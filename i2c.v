module i2c
(
    input  wire       clk,            // System clock.
    input  wire       rst,            // Reset.
    output wire       enable,         // Enable.
    input  wire       fast_mode,      // Fast mode.
    input  wire [6:0] addr,           // Address device.
    input  wire       rw,             // Read-write signal.
    input  wire [7:0] data_wr,        // Data write.
    output reg  [7:0] data_rd,        // Data read.
    output wire       ready,          // Ready for a set of bytes.
    output reg        busy,           // Busy.
    output reg        ack_error,      // Ack error.
    input  wire       sdain,          // SDA pin. (sin guión bajo para diferenciar del wire interno)
    input  wire       sclin,          // SCL pin.
    output wire       sdaout,         // SDA pin. (sin guión bajo para diferenciar del wire interno)
    output wire       sclout,         // SCL pin.
    output wire       sda2,           // SDA pin (debug).
    output wire       scl2            // SCL pin (debug).
);

parameter  BUS_CLK_400  = 400_000;
parameter  BUS_CLK_100  = 100_000;
parameter  CLK_FREQ = 12_000_000;  //-- 100_000_000 Initial value
localparam DIVIDER_400  = (CLK_FREQ/BUS_CLK_400/4);
localparam DIVIDER_100  = (CLK_FREQ/BUS_CLK_100/4);

localparam IDLE      = 4'b0000;
localparam START     = 4'b0001;
localparam COMMAND   = 4'b0010;
localparam SLV_ACK1  = 4'b0011;
localparam WR        = 4'b0100;
localparam RD        = 4'b0101;
localparam SLV_ACK2  = 4'b0110;
localparam MSTR_ACK  = 4'b0111;
localparam STOP      = 4'b1000;

reg [3:0] state = IDLE;
reg       stretch;
reg [9:0] count;
reg [9:0] pre_div;
//reg       ack_error;
reg       data_clk;
reg       data_clk_prev;
wire      scl_in;
reg       scl_clk;
reg       scl_enable = 0;
wire      sda_in;
wire      sda_enable;
reg       sda_int = 1'b1;
reg [7:0] data_rx;
reg [3:0] bit_cnt = 4'h7;
reg [7:0] data_tx;
reg [7:0] addr_rw;

//reg busy;
//reg [7:0] data_rd;

always @ (posedge clk or posedge rst)
begin
    if (rst)
    begin
        stretch <= 0;
        count <= 0;
    end
    else
    begin
        data_clk_prev <= data_clk;

        if (fast_mode)
            pre_div <= DIVIDER_400;
        else
            pre_div <= DIVIDER_100;

        if (count == pre_div*4-1)
        begin
            count <= 0;
        end
        else
            if (stretch == 1'b0)
            begin
                count <= count + 1;
            end

        if (count > 0 && count <= pre_div-1)
        begin
            scl_clk <= 1'b0;
            data_clk <= 1'b0;
        end
        else
            if (count >= pre_div && count <= pre_div*2-1)
            begin
                scl_clk <= 1'b0;
                data_clk <= 1'b1;
            end
            else
                if (count >= pre_div*2 && count <= pre_div*3-1)
                begin
                    scl_clk <= 1'b1;
                    if (scl_in == 1'b0)
                        stretch <= 1'b1;
                    else
                        stretch <= 1'b0;
                    data_clk <= 1'b1;
                end
        else
        begin
            scl_clk <= 1'b1;
            data_clk <= 1'b0;
        end
    end
end

always @ (posedge clk or posedge rst)
begin
    if (rst)
    begin
        busy <= 1'b0;
        scl_enable <= 1'b0;
        sda_int <= 1'b1;
        ack_error <= 1'b0;
        bit_cnt <= 4'h7;
        state <= IDLE;
        data_rd <= 8'b00000000;
    end
    else
    begin
        if (data_clk == 1'b1 && data_clk_prev == 1'b0)
        begin
            case (state)
                IDLE: 
                    begin
                        if (enable == 1'b1)
                        begin
                            busy <= 1'b1;
                            addr_rw <= {addr, rw};
                            state <= START;
                        end
                        else
                        begin
                            busy <= 1'b0;
                            state <= IDLE;
                        end
                    end

                START:
                begin
                    busy <= 1'b1;
                    sda_int <= addr_rw[bit_cnt];
                    state <= COMMAND;
                end

                COMMAND:
                begin
                    if (bit_cnt == 4'b0000)
                    begin
                        sda_int <= 1'b1;
                        bit_cnt <= 4'h7;
                        state<= SLV_ACK1;
                    end
                    else
                    begin
                        bit_cnt <= bit_cnt - 1;
                        sda_int <= addr_rw[bit_cnt-1];
                        state <= COMMAND;
                    end
                end

                SLV_ACK1:
                begin
                    if (addr_rw[0] == 1'b0)
                    begin
                        sda_int <= data_tx[bit_cnt];
                        state <= WR;
                        data_tx <= data_wr;
                    end
                    else
                    begin
                        sda_int <= 1'b1;
                        state <= RD;
                    end
                end

                WR:
                begin
                    if (bit_cnt == 4'b0000)
                    begin
                        sda_int <= 1'b1;
                        bit_cnt <= 4'h7;
                        state <= SLV_ACK2;
                        busy <= 1'b0;
                    end
                    else
                    begin
                        bit_cnt <= bit_cnt - 1;
                        sda_int <= data_tx[bit_cnt-1];
                        state <= WR;
                        busy <= 1'b1;
                    end
                end

                RD:
                begin
                    if (bit_cnt == 4'b0000)
                    begin
                        if (enable == 1'b1 && addr_rw == {addr, rw})
                            sda_int <= 1'b0;
                        else
                            sda_int <= 1'b1;
                        bit_cnt <= 4'h7;
                        data_rd <= data_rx;
                        state <= MSTR_ACK;
                        busy <= 1'b0;
                    end
                    else
                    begin
                        bit_cnt <= bit_cnt - 1;
                        state <= RD;
                        busy <= 1'b1;
                    end
                end

                SLV_ACK2:
                begin
                    if (enable == 1'b1)
                    begin
                        addr_rw <= {addr, rw};
                        data_tx <= data_wr;
                        if (addr_rw == {addr, rw})
                        begin
                            sda_int <= data_wr[bit_cnt];
                            state <= WR;
                        end
                        else
                        begin
                            state <= START;
                        end
                    end
                    else
                    begin
                        state <= STOP;
                    end
                end

                MSTR_ACK:
                begin
                    if (enable == 1'b1)
                    begin
                        addr_rw <= {addr, rw};
                        data_tx <= data_wr;
                        if (addr_rw == {addr, rw})
                        begin
                            sda_int <= 1'b1;
                            state <= RD;
                        end
                        else
                        begin
                            state <= START;
                        end
                    end
                    else
                    begin
                        state <= STOP;
                    end
                end

                STOP:
                begin
                    busy <= 1'b0;
                    state <= IDLE;
                end

            endcase
        end
        else
        if (data_clk == 1'b0 && data_clk_prev == 1'b1)
        begin
            case (state)
                START:
                begin
                    if (scl_enable == 1'b0)
                    begin
                        scl_enable <= 1'b1;
                        ack_error <= 1'b0;
                    end
                end

                SLV_ACK1:
                begin
                    if (sda_in != 1'b0 || ack_error == 1'b1)
                        ack_error <= 1'b1;
                end

                RD:
                begin
                    data_rx[bit_cnt] <= sda_in;
                end

                SLV_ACK2:
                begin
                    if (sda_in != 1'b0 || ack_error == 1'b1)
                        ack_error <= 1'b1;
                end

                STOP:
                begin
                    scl_enable <= 1'b0;
                end
            endcase
        end
    end
end

assign sda_enable = (state == START) ? data_clk_prev :
                    (state == STOP) ? !data_clk_prev : sda_int;
                    
assign ready = (state == IDLE);

//Tri-State buffer control  -- Originales de Obijuan.
/*SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b0)
) scl_io (
    .PACKAGE_PIN(scl),
    .OUTPUT_ENABLE(scl_enable == 1'b1 && scl_clk == 1'b0),
    .D_OUT_0(1'b0),
    .D_IN_0(scl_in)
); */

//Tri-State buffer control 
/*SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b0)
) sda_io (
    .PACKAGE_PIN(sda),
    .OUTPUT_ENABLE(sda_enable == 1'b0),
    .D_OUT_0(1'b0),
    .D_IN_0(sda_in)
);*/

//Tri-State buffer control. Modificado por ChuxMan. 2017-11-07.
SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b0)
) scl_io (
    .PACKAGE_PIN(sclin),
    .OUTPUT_ENABLE(scl_enable == 1'b1 && scl_clk == 1'b0),
    .D_OUT_0(sclout),
    .D_IN_0(scl_in)
);

//Tri-State buffer control.
SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b0)
) sda_io (
    .PACKAGE_PIN(sdain),
    .OUTPUT_ENABLE(sda_enable == 1'b0),
    .D_OUT_0(sdaout),
    .D_IN_0(sda_in)
);

//Tri-State buffer control
/*SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b0)
) scl_io_out (
    .PACKAGE_PIN(sclout),
    .OUTPUT_ENABLE(scl_enable == 1'b1 && scl_clk == 1'b0),
    .D_OUT_0(scl_in),
    .D_IN_0(1'b0)
);

//Tri-State buffer control
SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b0)
) sda_io_out (
    .PACKAGE_PIN(sdaout),
    .OUTPUT_ENABLE(sda_enable == 1'b0),
    .D_OUT_0(sda_in),
    .D_IN_0(1'b0)
);*/

assign scl2 = scl_in;
assign sda2 = sda_in;

endmodule