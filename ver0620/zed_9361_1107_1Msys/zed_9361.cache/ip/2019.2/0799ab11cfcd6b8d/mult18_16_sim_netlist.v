// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu Nov  2 17:25:43 2023
// Host        : happ_x1c running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult18_16_sim_netlist.v
// Design      : mult18_16
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult18_16,mult_gen_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [33:0]P;

  wire [17:0]A;
  wire [15:0]B;
  wire CLK;
  wire [33:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "2" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "33" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "18" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "16" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "2" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "1" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "33" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [17:0]A;
  input [15:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [33:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [17:0]A;
  wire [15:0]B;
  wire CLK;
  wire [33:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "18" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "16" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "2" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "1" *) 
  (* C_OPTIMIZE_GOAL = "1" *) 
  (* C_OUT_HIGH = "33" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
HPMPLvpmoX7LOmPj78BMT9X1rCnPz6PdhVGZQ307N9haGfAdMGVirvGR3e0Glyn2ieoWqXA6qOQL
t0xn28+h0g==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Nxv/BnutRgdmHnLyK7kvDGjm7WGfFKW2mxQ6xUKF14zS4ziz5pSV0ueW4VqAzUyEPsErIAEuyV6F
m5KCqRBB197Q2NbZa7O7tdAqboX6tPAJzbB6u4U/MmNS1AQcSgtfj5srMbdBzDa5pR4V3HrI0MRj
0xhV1BWf725FYPP4av0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F5KGJgEDQsX2btdjtRUlSmNtuyodIhGXEa3/AXv1Y7qgSO8gknBfiqj5HcIaVA9b4npQpDnNcmq+
1ONAqLeLhdOm9TES+GsTAkh/lClvl89bzfqgOV33iqwQHYIHwSsWMRXT9JSUx+YWu+g6xKpT1Ycn
8BCPsq4QUJIqL6W16fheEHB/lkMgnespIWEYJJG6R6zvv2zG8GiU6cG8zHrRjdvAj8kOkhmiMvSd
YjGXJSMfjw7ojCPSUF+nb6WWhUEmoMA/6lgSVaXRm00YHSZ09k7rKTJWSXFSpTmkL2WOsQhNS0ek
jdTK2KF5K6z2YOK4zkfHgZ+fB0KJyANaLLJH/Q==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lFuQXeJ0hi7qnIKAR+37XCSOwp8bGLukonngcICceOVpL87+rxvhP5TyNJ/zXpAWDF0BaRYlGr7d
isPiUStrvUthNyOqCr4vFZyhCdY8n+Mrv3OCvLoLQSarxVXbaKbXb0tPsXJCUdXTrCt9mr5x0Nda
6DAI8FBPlFMAiqnFXnYMwlUiSlkNWUpInuNw7+1eD8kUdckEUV1PDwZ0yjpFqMokMH9oJjN6z0Yy
65D8Tqo288ZMfZQuIimjski+X6EK157XbpyuoZIuYLJ7j6oaATdintgfZpgGzVvhCZtMbx6/SJtR
efW5vLBGiGs7rPBPE2T8fosHGOvmeC9QBSj8Ww==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q8VVvHzTNgU3tZr4+8ia7ylST+kbNPWskONHDOT1dTkB7cHZIAWyzXpQZPuEgk2wJq21PoqmVlG9
t08IYzkfC8vYQ2LRf2Co3SXc7p3gF2OFMC68J9Nf9D+/PXJCJy3QO4H8oO39l6bn8c56K2ARnK0R
mMIALbCWSBDGCWGQmXWZJ+xmDGs1KgTeiSW3bZRftWJ6K8l8BhMit8BLOY2Mi3jJ0WRhN8kKd6JT
D4NU1jTZT6jEtmI7Gnj/AXG6auTqDPHsVQzf+ZzBsLTfw83CFoO70xM997L5cZXlqz8fEDmxezkr
wWxPwJbJeVkRV3tUxlo2Bs2x1uVkXQeNVMI8jg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oUeTLA0HA2uKORUHo1HidNC3lw54gxwlLUkv28qRPv1pz7AEVUbIJ7wsyu2Scju+EkC2Ivi8HbBn
jxkeqRDTAwAbAqIKnY3AdyfojN9Hb8SMLcLnpWLLCpb6E0vwA09r7uqKRZ8wYAgT9CPFvzpQ3zKt
9DTLgQ3rZtFxx2nfCug=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Fayrlym1l14Y48yZ195XboT9ZQmp/mAzUyHby3Y9qJTzDF+m6mRQ/ZbebObo8bu4VAm45JeETPx1
YI4UZNOK4IqKv0BZsAlzUfAYAmqmkmIJYbn2gWUCwXyKX5AoA4ONnlxEHxzZhqtsmEXvxwTEs25/
R7iLzeoMfmwwNHgPNQkteiR4zDlB76CYmgu6EOSUX5Nnitq1oh7qRuU8WqWN7lLfgIC6T7qNHwGD
RPze2yiP06fSG45jPrOn2fvBX9SRbUXjNtiFgmqim4anwJU46v7y3ubit/I6giZhz5PJMZfkDaFX
ag+uCMq4Q8ZEolqMBmjUjat86BdVd4Nmr0yUaA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kIpxh3qIIkWUg8aLJSPKvKhKTPFH7T8fisti5RtNaftS7xh3KDsGLYnF1lYhH2RVXgzbdaVqvtED
5QJazVo6wUFI91xgFeOR5jX+Ny5UBUX2MngsK+UZyZg5+EdtSiDtiJNtQqgjq1Rn+XQCGF3xP80n
7YvuVMbgRHCAfWrWw7ZJ7Y3raRzeIkx+koPFio7XnC+QdRJ0ItO1YtQgF4Sg1Ihr5TH8/RrNn903
kPa+anH9spo3SFCf2Ts11UXAGLdIBmOLMtEAKjjCUbtmjGSeSc0gn2q2I+xRTFcegLevlr/iuLTw
3lFndBAoW40xOiCDjWZ6Rz7J+jZhsRl3D0Bhwg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pzFaF1raL3+VBQVHSvYQSOmt+DKyWkZcauoJEipmFXw5i+CXDJJS68/SjOEVl+0F/8SOdV+ZCQJ7
UMYTNDNzBjy1tDfZxnTtuMpCndSiC3BPyXzaUtF3qGLrCIwT7mbi3Xvlsktk7aO04ul/F3xR3PDf
Nc+GtRNTJrlsn/Ov4lVpsk0Mwl2QR7W/SagELv4kEFKNQ3iFBRccY00t9++XB4Pxld1zJK9WOqfO
3heBMc3cDBoPEApxVtqoyOJhnU6Wv3SEVZEzcXf4y2axtGQRUVzsh8+guGSzuSSHL4/sz7GBrHsR
1yBQtPgt8dr4MaXDrPfh2L9ucTcGuVtr76TOtQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
xJgQ1qppk6sUQif1QosD4vu/zEsXf3vl3c8hofHEq1vkI9NnTq6+PGs2k2CDehdCRMBFdrXl7IW0
cd3sU7h5RDSSeQQepetL4ZzjYUOSL3XjfvFJgIrZp+oMvTY1co7BFsK7uElljFw7tMvkgtPur9y4
EUQgexhzZ80le8XSb7We9uQf4fkk8yJ3Lrvd+5tgJ41+YSAERYOML+YUC0R3uCC5ZmcwprQM92pe
lUCjkexcVf+KAsPhBk7Ii/hgcx2nOnfkWgk9kZCZWkheWlmSR8WhrlvgiMa9nu/CsllaR2CJxifW
BpKAKlpKCwNjZFwUDNkFiOdA2vXg5uYQiIPsjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7184)
`pragma protect data_block
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
PVg=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
