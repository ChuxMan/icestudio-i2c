{
  "version": "1.1",
  "package": {
    "name": "I2C",
    "version": "0.2",
    "description": "Módulo de comunicaciones IIC. Adaptación del bloque de código de Obijuan.",
    "author": "Juan González (Obijuan), Juan Manuel Rico y Jesús Rodríguez Conde (ChuxMan)",
    "image": "%3Csvg%20xmlns=%22http://www.w3.org/2000/svg%22%20width=%22153.011%22%20height=%22170.05%22%20viewBox=%220%200%20153.0113%20170.05031%22%3E%3Cg%20fill-rule=%22evenodd%22%3E%3Cpath%20d=%22M152.6%2083.303l-30.396.208v17.435h-14.832V46.66h14.205v18.791l31.023-.104V8.867c0-4.593-4.805-8.456-9.297-8.456H8.871C4.275.411.411%204.274.411%208.867v152.315c0%204.594%203.76%208.457%208.46%208.457h134.432c4.596%200%209.297-3.863%209.297-8.457V83.303z%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%22.822%22%20stroke-miterlimit=%222.613%22/%3E%3Cpath%20d=%22M147.272%2088.313v67.13c0%203.757-5.223%208.454-8.982%208.454H14.407c-4.596%200-8.46-3.758-8.46-8.455V14.714c0-4.698%203.865-8.456%208.46-8.456H138.29c4.596%200%208.982%204.176%208.982%208.456v46.98l-20.89.103V41.962H101v62.43h25.381V88.208l20.891.104z%22%20fill=%22#c8c9ca%22%20stroke=%22#000%22%20stroke-width=%22.822%22%20stroke-miterlimit=%222.613%22/%3E%3Cpath%20d=%22M13.258%20124.541v32.152H40.31c5.536%200%2010.76-2.607%2010.76-9.603%200-2.4-.837-4.28-3.344-6.367%206.372-5.846%202.924-15.346-4.7-16.182H13.258zm9.61%206.992h16.189c2.298%201.254%201.777%205.221-1.67%205.951h-14.52v-5.95zm0%2012.319h15.355c3.657.836%202.61%205.116-.524%205.638H22.868v-5.638zM110.401%20124.54c-11.594%201.357-11.28%2016.81-1.254%2018.896h17.861c3.762.416%203.971%205.533-.104%206.367h-12.639c-1.672%200-2.508-1.67-2.508-3.445H101.73c-.209%207.936%205.12%2010.232%208.773%2010.336h18.803c12.848-.73%2013.057-17.225%202.924-18.896h-17.547c-3.97-.52-4.283-6.055-.418-6.576h12.43c2.088%200%203.238%201.88%203.238%203.34h9.504c-.207-5.326-3.969-10.02-8.459-10.02h-20.577v-.002zM57.651%20124.852v28.291c0%201.881%202.821%203.97%204.701%203.97h28.411c1.984%200%205.12-2.612%205.12-5.013v-27.248h-9.61v21.715c0%201.67-2.09%203.236-3.656%203.236h-12.22c-1.15%200-3.135-1.357-3.135-3.027v-21.924h-9.61z%22/%3E%3Cpath%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%22.822%22%20stroke-miterlimit=%222.613%22%20d=%22M.411%20118.694v-89.99h32.8v89.99zM152.6%2082.676l-31.44-.104-.105%2011.274c0%202.924-2.82%206.264-6.268%206.264-3.55%200-6.37-2.818-6.37-6.264V53.55c0-3.445%202.82-6.369%206.37-6.369%203.447%200%206.268%203.237%206.268%206.37v12.736H152.6V37.681c0-4.906-4.074-9.5-9.19-9.5H88.986c-5.223%200-9.4%204.28-9.4%209.5v70.886c0%205.324%204.49%209.604%209.4%209.604h54.422c4.908%200%209.191-4.697%209.191-9.604v-25.89z%22/%3E%3Cpath%20fill=%22#c8c9ca%22%20stroke=%22#000%22%20stroke-width=%22.822%22%20stroke-miterlimit=%222.613%22%20d=%22M27.882%2034.445H5.633v78.61h22.25zM147.272%2061.276v-22.55c0-1.984-2.193-4.699-4.699-4.699H89.614c-2.506%200-4.805%202.192-4.805%204.7v69.631c0%202.506%202.3%204.697%204.805%204.697h52.96c2.82%200%204.698-2.4%204.698-4.697V87.895l-20.89.105v12.11c0%202.714-2.612%205.323-5.327%205.323h-12.639c-2.926%200-5.328-2.4-5.328-5.324V47.18c0-2.923%202.402-5.219%205.328-5.219h12.64c2.82%200%205.325%202.401%205.325%205.22v14.094h20.891v.001z%22/%3E%3Cpath%20d=%22M45.43%2018.576c-3.76%201.252-6.372%204.49-6.372%209.605h5.746c0-1.567%201.044-3.967%202.924-3.967h16.608c3.657.94%202.82%207.412.417%208.247H44.28c-2.82%200-4.805%203.445-4.805%205.742V49.06h34.053v-5.742h-27.68l-.417-.313v-2.61c.417-.313%201.044-1.669%201.88-1.879h17.444c3.97%200%208.043-4.07%208.043-7.412v-4.593c0-3.132-4.283-7.935-8.252-7.935H45.43z%22%20fill=%22#fff%22%20stroke=%22#000%22%20stroke-width=%22.822%22%20stroke-miterlimit=%222.613%22/%3E%3C/g%3E%3C/svg%3E"
  },
  "design": {
    "board": "icezum",
    "graph": {
      "blocks": [
        {
          "id": "b491ae83-591d-4e40-9b71-d06e0f0b1777",
          "type": "basic.input",
          "data": {
            "name": "clk",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -48,
            "y": -64
          }
        },
        {
          "id": "d96d23e1-e807-4afa-a15c-98702887d4a4",
          "type": "basic.output",
          "data": {
            "name": "busy",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 936,
            "y": -64
          }
        },
        {
          "id": "337a8679-e65f-4bc8-a33d-dfe6ea78143f",
          "type": "basic.input",
          "data": {
            "name": "rst",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 24
          }
        },
        {
          "id": "4d106ac0-76d4-49c8-b6c3-44cf587e88a1",
          "type": "basic.output",
          "data": {
            "name": "ack_error",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 936,
            "y": 24
          }
        },
        {
          "id": "6410133b-95d8-440f-ac12-e3c06dc60ba9",
          "type": "basic.input",
          "data": {
            "name": "sda_in",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 112
          }
        },
        {
          "id": "20db224a-3f7c-4fbf-80a0-7c82d5557890",
          "type": "basic.output",
          "data": {
            "name": "data_rd",
            "range": "[7:0]",
            "pins": [
              {
                "index": "7",
                "name": "",
                "value": "0"
              },
              {
                "index": "6",
                "name": "",
                "value": "0"
              },
              {
                "index": "5",
                "name": "",
                "value": "0"
              },
              {
                "index": "4",
                "name": "",
                "value": "0"
              },
              {
                "index": "3",
                "name": "",
                "value": "0"
              },
              {
                "index": "2",
                "name": "",
                "value": "0"
              },
              {
                "index": "1",
                "name": "",
                "value": "0"
              },
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 936,
            "y": 112
          }
        },
        {
          "id": "5d8a3d4d-9ff9-4cd8-9831-a5609f5e8a48",
          "type": "basic.output",
          "data": {
            "name": "ready",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 936,
            "y": 200
          }
        },
        {
          "id": "d582ac6c-a2f4-4394-9ad2-7d48f41f1b62",
          "type": "basic.input",
          "data": {
            "name": "enable",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 200
          }
        },
        {
          "id": "56105f11-fbf9-42fc-aeec-787d75d37c49",
          "type": "basic.output",
          "data": {
            "name": "scl",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 936,
            "y": 288
          }
        },
        {
          "id": "0dd5b073-41e4-4926-96de-eeb9e656bee4",
          "type": "basic.input",
          "data": {
            "name": "addr",
            "range": "[6:0]",
            "pins": [
              {
                "index": "6",
                "name": "",
                "value": "0"
              },
              {
                "index": "5",
                "name": "",
                "value": "0"
              },
              {
                "index": "4",
                "name": "",
                "value": "0"
              },
              {
                "index": "3",
                "name": "",
                "value": "0"
              },
              {
                "index": "2",
                "name": "",
                "value": "0"
              },
              {
                "index": "1",
                "name": "",
                "value": "0"
              },
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 288
          }
        },
        {
          "id": "117d621b-1d0d-4acc-81c0-1a646fd2824f",
          "type": "basic.output",
          "data": {
            "name": "sda_out",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 936,
            "y": 376
          }
        },
        {
          "id": "6db78986-3bed-4394-9086-e9548889e7d7",
          "type": "basic.input",
          "data": {
            "name": "rw",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 376
          }
        },
        {
          "id": "7d5e5975-94fd-4fa0-b9e2-6227f51023c7",
          "type": "basic.output",
          "data": {
            "name": "sclDebug",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 936,
            "y": 464
          }
        },
        {
          "id": "c1e53ae5-7c0a-4cd8-ad0e-40b2a7726779",
          "type": "basic.input",
          "data": {
            "name": "data_wr",
            "range": "[7:0]",
            "pins": [
              {
                "index": "7",
                "name": "",
                "value": "0"
              },
              {
                "index": "6",
                "name": "",
                "value": "0"
              },
              {
                "index": "5",
                "name": "",
                "value": "0"
              },
              {
                "index": "4",
                "name": "",
                "value": "0"
              },
              {
                "index": "3",
                "name": "",
                "value": "0"
              },
              {
                "index": "2",
                "name": "",
                "value": "0"
              },
              {
                "index": "1",
                "name": "",
                "value": "0"
              },
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 464
          }
        },
        {
          "id": "1141d685-54b0-4f48-84f8-90b6d6ac4a70",
          "type": "basic.output",
          "data": {
            "name": "sdaDebug",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true
          },
          "position": {
            "x": 936,
            "y": 552
          }
        },
        {
          "id": "f3893774-6b42-484e-85b8-b952903e93e0",
          "type": "basic.input",
          "data": {
            "name": "fast_mode",
            "pins": [
              {
                "index": "0",
                "name": "",
                "value": "0"
              }
            ],
            "virtual": true,
            "clock": false
          },
          "position": {
            "x": -48,
            "y": 552
          }
        },
        {
          "id": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
          "type": "basic.code",
          "data": {
            "code": "//@include i2c.v\n\n//Instantiate I2C module.\n//Instanciar el módulo I2C.\ni2c\ni2c1 (\n    clk,            // System clock.\n    rst,            // Reset.\n    enable,         // Enable.\n    fast_mode,      // Fast mode.\n    addr[6:0],      // Address device.\n    rw,             // Read-write signal.\n    data_wr[7:0],   // Data write.\n    data_rd[7:0],   // Data read.\n    ready,          // Ready for a set of bytes.\n    busy,           // Busy.\n    ack_error,      // Ack error.\n    sdain,          // SDA pin. (input)\n    scl,          // SCL pin. (input)\n    sdaout,         // SDA pin. (output)\n    sda2,           // SDA pin (debug)\n    scl2            // SCL pin (debug)\n);",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "clk"
                },
                {
                  "name": "rst"
                },
                {
                  "name": "sdain"
                },
                {
                  "name": "enable"
                },
                {
                  "name": "addr",
                  "range": "[6:0]",
                  "size": 7
                },
                {
                  "name": "rw"
                },
                {
                  "name": "data_wr",
                  "range": "[7:0]",
                  "size": 8
                },
                {
                  "name": "fast_mode"
                }
              ],
              "out": [
                {
                  "name": "busy"
                },
                {
                  "name": "ack_error"
                },
                {
                  "name": "data_rd",
                  "range": "[7:0]",
                  "size": 8
                },
                {
                  "name": "ready"
                },
                {
                  "name": "scl"
                },
                {
                  "name": "sdaout"
                },
                {
                  "name": "scl2"
                },
                {
                  "name": "sda2"
                }
              ]
            }
          },
          "position": {
            "x": 152,
            "y": -80
          },
          "size": {
            "width": 672,
            "height": 704
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "b491ae83-591d-4e40-9b71-d06e0f0b1777",
            "port": "out"
          },
          "target": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "337a8679-e65f-4bc8-a33d-dfe6ea78143f",
            "port": "out"
          },
          "target": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "rst"
          }
        },
        {
          "source": {
            "block": "d582ac6c-a2f4-4394-9ad2-7d48f41f1b62",
            "port": "out"
          },
          "target": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "enable"
          }
        },
        {
          "source": {
            "block": "0dd5b073-41e4-4926-96de-eeb9e656bee4",
            "port": "out"
          },
          "target": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "addr"
          },
          "size": 7
        },
        {
          "source": {
            "block": "6db78986-3bed-4394-9086-e9548889e7d7",
            "port": "out"
          },
          "target": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "rw"
          }
        },
        {
          "source": {
            "block": "c1e53ae5-7c0a-4cd8-ad0e-40b2a7726779",
            "port": "out"
          },
          "target": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "data_wr"
          },
          "size": 8
        },
        {
          "source": {
            "block": "f3893774-6b42-484e-85b8-b952903e93e0",
            "port": "out"
          },
          "target": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "fast_mode"
          }
        },
        {
          "source": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "busy"
          },
          "target": {
            "block": "d96d23e1-e807-4afa-a15c-98702887d4a4",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "ack_error"
          },
          "target": {
            "block": "4d106ac0-76d4-49c8-b6c3-44cf587e88a1",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "data_rd"
          },
          "target": {
            "block": "20db224a-3f7c-4fbf-80a0-7c82d5557890",
            "port": "in"
          },
          "size": 8
        },
        {
          "source": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "ready"
          },
          "target": {
            "block": "5d8a3d4d-9ff9-4cd8-9831-a5609f5e8a48",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "scl2"
          },
          "target": {
            "block": "7d5e5975-94fd-4fa0-b9e2-6227f51023c7",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "sda2"
          },
          "target": {
            "block": "1141d685-54b0-4f48-84f8-90b6d6ac4a70",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "6410133b-95d8-440f-ac12-e3c06dc60ba9",
            "port": "out"
          },
          "target": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "sdain"
          }
        },
        {
          "source": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "sdaout"
          },
          "target": {
            "block": "117d621b-1d0d-4acc-81c0-1a646fd2824f",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "5ce4ea27-c70f-4911-bb77-e3646bbe6352",
            "port": "scl"
          },
          "target": {
            "block": "56105f11-fbf9-42fc-aeec-787d75d37c49",
            "port": "in"
          }
        }
      ]
    },
    "state": {
      "pan": {
        "x": 118.3523,
        "y": 95.2273
      },
      "zoom": 0.6903
    }
  },
  "dependencies": {}
}