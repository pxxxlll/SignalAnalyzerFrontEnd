// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed Nov 15 17:53:03 2023
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
   (A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [17:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [33:0]P;

  wire [17:0]A;
  wire [15:0]B;
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
  (* C_LATENCY = "0" *) 
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
        .CLK(1'b1),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "18" *) (* C_B_TYPE = "0" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "16" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "0" *) (* C_MODEL_TYPE = "0" *) 
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
  (* C_LATENCY = "0" *) 
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
        .CLK(1'b0),
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
mESVSN+09cqQT+qk3EbE8wYFGiO4EbTPoXGVos9chtEo8yJz4eVcupFsVTOkj5lXh7qc8ACqOb0Y
MQoaNv4Q1a114ijH4J+AomQL5R6U88c1MhhrBTUPI3GqNLNc3NM6dl77e75gnuSSz1w2WXnr7eKB
RK+dDoqKnfHnBLsDXupWKYeV/Drl/08bJg/H5UVtVdUXGeW+s5p8rGe3wQP6SDN474qgf8gVeiNw
ZFy6eoSpqFm1ZBgQ2wrGfwZzdfNNLT2U8UuxqGqljnWTa3BD2fCfER7QBvq3J/isClrR6IzRqfxv
e0VBIQR1mQnrylT9KHXhGpxZse+sY1D7CNnQ2Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
SDs3GqepuyRA5+VRFRoYFBeCzIF84gUlTZxCXOT4yO43dbelEb90Ykm9Byyem8AFJOvEwj7eEmH6
BEegP6Ejq++MZpKDTFpJsjM8PrvLqm4yGp/u2UHJsYPLZRQKhT7Ih2KyaYF0egcnm4BRfYQkQQvD
9wdSxZhA/7ZgY+o5vBbECD12rbzRKPTWwbkWJPA1kzVZ7Bt2D5FlzvGHLnjnEQig9KBvlXP5ySDN
q3o5Kj2b18/7FBFM//fIqe8g+hm1L/mgGcXCxymMXr1IaMh1tqdFqpe5B9oMHKNx7nXqJWB7hx7h
U+mzdrJymZH9EzL5ucsVi/fyaUTi9t0/xo95pw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6560)
`pragma protect data_block
lSt8Up+zXPJCDCM5Ee0DI67V0m0duyfLeijC5NivrJoXVqqCA06Yt2a3SC/KroBZXDr0SYv+mTb4
yaoptcUW/pUrtr/pVr2pUYpFtF86WHOrXTFmAwxreM4AhvIBNYPHnnA2JbPCrrv/5tbrNfuHytU2
cBOcXwJu90AiAyLzp+V0Rt3cnjxBJssnpEZpIhGH5Bw4xDbhzvddmd1JMN9ZoKpqnqCdfNaMbspA
camGTaZOz2uphopPZ39AtJyyZaUXsyESzNjzc76vseOzQGwzrdmKhXhDXTTUz2Nn+xVQ3OX0g97G
1wBHQOlBw6fVK6Ge9/j8G9bUZ/09F6jLsrQR+4n2amSZHF5q+4Pyr1QW3mCiM4xtmUenloYrFwD5
YL8i7lmRuF/1QvJa4DvNDhBVfujrZZ1SzfDJaswE9gZz998dR25mihSTF80P4z4f704CkEvK/geb
lj6qbdyH/X+0aIhrzJdN2bQ8ecMnA6XCSC5cg/+gnBxNXJwnvFSmhUZFBUfcANOFawooYsfgGZDO
g4fIpX46esIiolRd3JrRazEPuLgT54oglmBRrHAQCzdqKeZvGYbc99wE9Q1eaXD5SxiR8reJgZrt
KlHCqJxbG/B6NUCAx5KvYas3NOdUtTtBkqv9QmWcBB9LEMOyrz0PQDIvTF3TcZM5XPMWJxmCpGDC
MKtuISL3aZJRgELk9DhQCL3ohBZwBCQ4yRK/+85ny9Dcia/n4tv/1CYY1sLEBn/7vLDca1zPKhQJ
iQZUOD2XOxhXIWqJbW7jtJNeVAMORkj6gbGnedyfMKOdnxRFcW6QLQ19IFY/7Yh3ouiY4S4ssinE
L1tAsd0bedCqBgWVrNJWD69kvKiAlRYGMUAdGjrNDmuEiRt5ifs2E6TPhd1kH/88+Uy9JYsiAfPt
Yre3iT1BjSEum1PTeJDUWUd9TjsHDwy4fb55xta4zaZYeSgH+LT0s0F8ScIb4H/N17w41ZOd1z0T
xuCRduM8mv0GBGIoJWdPJi7nEO3zNuymvS9iEfWIzFOgjCAanBBhV09SFkwVdK3amtdLDI7xzmAg
i+Lml6FK/mo0YxTRvaDdaVIbZEuFv52AbSzkQLnGIfxDwdPh4EMq6d4/K8Cv/b8+KWvZnwUYCRXH
Sw3DKEOVnP7BSBcSGduDVlQX1FBqFVYDVI3FXjuXmwoSJuvBEc9tb3iIqLxOO/Z8h0xeH5u2lrgC
vVexWdeN6XOkUjQ5uYYPC1TUgX/n6maLY0VLgqGByYB6FrbQGOrfa2ifsnyBo3wMXG2VkDr/7bzv
M+GnE9+Z58B3ny3xrm8ygSBMos9M146GyExUjk8uC0xGHoQVYoMzlqFTTyPIiSrI6vlTXz1+KnAT
yMsqiEFSS6flk0UiHU5UtwXPLRwaYk+NK1YtOSFZSRcyd5OUHJFIRqXXn0UWMKWClhzGhLiqDsva
dIuaxN4d0o/FZVKnJggPUg5oWI2/efSglBO6j1006fzswKwFDA3YdQsfiOGZ73SEh2YU3HjcqzaJ
kMiHTb0NJpH2WAS9WuLQID+dva7tx2N6s/7Y9zpzLDBWwczaf6dzsD3oWr2+cqK8GVyI5+YWRYsB
E4x8vH3lHRoUIBFMj60mzF8BXINavlHF2EP7aCzsVtVIq92vlSez/XBpFOmtIa0WBXYsUgmqyfgJ
dE/nWpZ41xJrf0Cy8GzkIHyTv6ImKX4lWRuBlVGxS7gMwUmOF+3xyu3SG3NzWw1YtkNAmiaGQ3i3
qgJXLk23S9Q0AAxmzKtkKfZkgjDf8sKh6HOFoATEjO+KsoNp4WVrHKNs4BwPa9Ntyu0r4mOXBABC
JeRHgvHLZdiN3BbTyJ9W/K89PVBBUPKKzxHWxwuZmZrsu4TJvnp8zLbQKKPVEVlQOKExzkC7dCZC
iR0sOx1Kg55ig62420rtUu4ejgn8jmOL7oXMn5zpqlnW0bfYDQ/dEqLYbtGqs+fF4G8NzhwAJGl5
hAxAL+YXQCRvuVeR/02JEvE1eggzfx1susMGfPbj1or/hBzYHu5fgSMr+SQaDP7mkCq+TyW24kgS
ydH9b4j/Jr4hdB521VypAvdSsqVkZTRPOcXdrPbFpGRlQZpw5e9IURHfCDRaA82lLfA+MGTq5c+x
i9HsVAvK4WRVk/B50a1TjMjVNEDlDIoF/wAzUHdN/dpAJK+xuNgQbIG3nTb0ATWwdncprbMxzFe6
yK2xkEVvV++Kk1CRl9QwEv9/rxW+04iTdjgJ+RhC72miXtaJMbhnjiATo0JIgePGZ5VEC6CSkMx+
b7jPX+IYP6+uiJS/kg64ioszRFCnGJKz84TugTMGSkzw5rOd3eVVjzAVKq1NyTaV7sSuKiGVolaa
dGRv030De8Wdh/FMZxL+d7OaRNeGaIdzwcKd52fC1ySh6128rAma4ORGELxKvWMgAUqtfCrWrwJI
kTC4NMt/OuTq9TssbWOTqx0+IvgsYt3FB7RgOfvx7LsnHGmJlI0yzX4nZ+R+Vb0TXYPuXNhpMfLe
TOql2BG4D9B9RR+CuW6eREIc7xoY44uTfRiLDd8dsMhFVDVGB7yEzfKyBGcz4yQC0Udm0nfpeaAs
04R9xbrrSOXLCeymuecZJPe9XzpAF8tvVGSjNyfg+b4TtkDq52lxJxb2RALuuoxSOQ5Pka2JMyos
mpw35E4kmYuZmL1GtV0AhrFUW6j7bALO5H88dCKojrjlAiAUvPI5KSRP3c5rjYpKYPq2gSL9b/Eb
HMBykuJYr72L+ragTP3HjtyOo9Mz+cGxAeVMyRXkVAMnU70G62QQQNGP+2Mf8ANLLgM18kqWKQXZ
f7GuxImoU5kLk8EdG7pek5CLjRlbweUciqXvrIj/Qu4laUSDOURmId9WOYfpSqXlRr46PLjkfMXP
21P0KhMHJ3/8uHE8OIuE5pWvqyGIIqdiGCvLVpsmVFkhQR6IvtrKaZ3S6mJDJOBdWtNcaxvfbuf6
Ds9hkcwrIJYRK/h2j9KYmMuH8n7iFFvEzGF6HL1JYW+eakTsJfrWITMKalFUFHKsoUFufMtTZemH
uiXbTjOCFpdm4KsPU1hhEzkX5s959by7KDk6Z4RdYb1PrEX0V6a8uSHAhrIL8KEUZ06XrvCtdWX2
2tp1NN643jmg2O5O+OVwye2bRBj5PPXK2W4KRDaFIrAM0T+krhcfX3ea+uL0GSJKUe5mraZwBMF/
Qaxx8zN9MVhDauZv2Tnjkf6fMNojiT1A+PUAQsZyV3pkBFOZjzgfrWHxfnb8cfKhXLNjZYXGdMn9
q0KsRBxSIIPqkhbMJxi1Xiu8nXIRGKyv5wCIIVo1NIAfd0oCQw7D1Djk2jWhGeh8i1kV2H3O0L8Q
bCYlQaII1h3vnSLWK49VtBg7EXOb8OqKSQ2iK9eUkqDfBAtEk4M48D7XQubygo/9nkl3vfikMt4W
ofIoCFzEQBhY/2N1+2j6VrAch2qMACs4KiuNaIg9XhweUhoXWoSQYrQbx1l93LhzXy+wlxfWMJ8N
lw3vGPRoqUHm8g7TbZKo4hAL9PrrX+4O382Vf4DQb7In9JwLlHUaQl1y5/wOP/8Yg8CslGZwk+XX
G4QQsJoAZDZfsvDHLXFT4Lsi4xMl9H83QBSOe/s5IRF7ge5tfADbImBaQCrO4gs4MTZsbwJ8gIfG
NFjwYCgn2pluxpIJFDPPWBMk1eqw4jIC4lFBCOQwVyQ+w/L0SjHrkJemcC/zE7HlLSBFJGxcYAyF
d1nmSNQhGPNVNlGRIIdKJ4fNv9pHshvBF0ZWVHSef4YiEQUOOGghk58HWUN+lxsKzBoIWJJzwELK
wobDW+iQuXa27Hx6k+X69vYAF+TbtB99cgAgk0UgF3JMQwH89TnWlsQlfV9Q5D9U/9myDNuOGkPc
bXRbyOdoLXY4acuyoWpanS54myGkEQvyli6msAEoPn9TntDCXTMFtWed4+Wd/ewnCqrYbuwJ1j2l
NfoDu7L/rxFABaYvbfP2pOWEZTVkCFf4q7JgqIMLsCsuIh1Oxv/BYm8p4XtqAI+rJyLn4CYAhcBu
CYTqrs33evvOzbM77PSxsE3pXZbfuG7rZSlwo5THIeEhTkuoDbQR3AGPNnYY8/qUYuqmzh5wQvbh
3I1LRuYavc7FK3XGniSx4YSifNdK8oyzGaCchKvx6N8zXi2oygjSQWNQiFwHk1/IS8TvWE/AGTY3
MGzE7LzpBScl2nXfU6vx8Z84u6qI9WZaf8PYGJ9t/UMzwQLFV3wqgb6Z4PL7koSINpsmKu8pWVvb
QyW+HAfGgUYuckISbYzoS0KWneRBqw+CpPBRbAaml7uq+PSfkNH70GyDr8Hp6q9xM1TB03BLcHQR
ohaj55mCIXZ5dUfFC499o9Zm15T/6R1Z64m+tLQwmmrRN7myLt0RVHoZBPwzWktCtTHaHxTmsVOZ
OZ5CThnpNvbEjXfvW5XCLti0VV5Yi63NYFU2+RbWKSDzhCIZ/naGMr+oTfMlU/DILRQoMSbU3DVd
fqt/BVvu0OCSpAff1etF38mXyZjAzV6QtO2wIvPnJ+jgZ1moq2UFIv+JsEev5/7Pru0fSdbrBYav
k+MvBuhXmyArcno838dUb5GItQRGyfXYCpGwWVC0Fv+mflASnlMKCZU4idKQaOwtlMLh8QMAaI0e
8DL+qskrqDg3mencF2akbe8L8cAWb5WVC/P0hyCvs3iVXv5Oj9te/ciQGsfdN7RdJAYzqGXoDmGp
SZye8JtmlOvCG9fbZ3e/gQl4JncBhNNoGOSyHi62Qp3Pp+MEEYV8StIPivuvZ+eiSnV71T2huXvE
Gz+hEuLo6wy17c6iC8mIm3u6IP4gsCXEYp4SxsxZNtoxWejrTqtCBTq04va96wIUGfaUfygr496n
dBvAQ5YTL/Mxb+v7VXdFIxX+UpW502Ps0kNVU+DD0cWnmtbJtIMZiABroDi0bMcqdkCsiK5Lshp2
q9LAiioDp7QS4zRKDEV4KET5lC1AsNQ2wWzx9sitVFS+K6Sk7avmKUlJk0GcrBCVmVOCIK4ONjYT
VGd4gyx9bfEwx46KZ81DZVubLV+vTsO/JoAD5B1kUOFVRWywpcd3YJIxBwHjcr6dCKYqsVgU9DY8
LIja/FtB0hSc35jobx9zFQMmJw/Mh387IMkGAJPYDOYWZz84hjBws9uHA1UHMUE6fOSIplGpjsUe
Tu3on+lSIcwL5T10rESnNzUOSLytYRncaItHJd344biTtWFrx8kY9ueqKQ5P1OT3GoywFyt/AfDh
i6vt+k2V6RkWmFrLQXZzmacUzc5FdC1NLT5+toWhG2F/Noszk3eziQ2CikSM2gIUP0ccpb8FCvnQ
lueiZgn/rMsc6Kt0Co9/wTOveOv71nOEqOsDZIkgY6MBolhDV82w0IlN2do8kOmTkZXIIkpCaZWx
wKYBLzo7poA7lxHBye4wTk/K0diBK/mmDjLpM1Y0GS4ty78r3oumHjxV/98Xkl03DDE6fItP/4yw
E7iOxi5IdTFS1iPXsHY5cTw8RsgJczIsnHUkC/y9cBsM8sx6ZbgUQdWyIsj6KAD3w2byTAGznuYI
FIdhg+bzqTgqMOQNZp9XyfDnewJNLPYIF5CLFtxXwygMs48JCQh9OtnqYDRBlhrpTjhitilEp4CL
9EbcJJ/0M6RGHdN4ECHeFPqAndt/Ha0rRu4Lgo332vmeW4FhvvNJj8NeWTcizLSirVrzHJti71My
p83rB/kYL52ptwi0nxUTLE4ffh/UortZl9gyB0YhKVpxcvfDQStoecGHmfNSGOrLV3Sg2/Fhzp1M
UWYMl0e7QAuuMZfyqVefwFf3G3qA2AfJ7FaCrKJJl6uOnceJFz8KVh50TX9RvDolxSU6ouiU5X7B
W2ye4gvcgxnEwEvly8y4iRy2R5uxkV7y8LjaN4iPNuhVBMSc9IwYE/HszIJ3SohNT6wQunTafrdA
J9/VIWjNReRSahRaQbqUD6n3Q6UYsJI0ZLNXrcaHLp0wfNKpJMI1m5cn3f2vWp71vZQDXo75GLFd
YjYbkt2HjQFjMKH+80GDlRoVJqBH80Wzw+IDH1pN/n838tw6zyWWODXXZ74u7FwGZajCj0ciEm5l
r5HkjDIMP1IIe+bYQEKKfetC2oHE0B6KkQTeBQdE4NL32KoDvUN6XXwfF/Qw0vWq/QW+TaILo9eo
7EpAf7km/qNvuQSbyBP1UdCCpn7osVdeCgzlAKqw8t02ifO03xHQDHs+C4YgO9vMVX4FgeI/1fFh
JV8JBjNkVclnosAxHPJucJ/ZfKvP51GzakXoGXoPvnLIq7AXulkRX3tQ+Ya9NcH8l/W2qjqbJcEU
YZa5tRt9v8B4o72ohzAFhxNI20RUAo2GScpmA3vcQZplmD8a+kqgVAtELv1/GVpSLvY0/srRSHk5
t9sSfwCeAKJQmxRanZLOXy4V8BkoMmru+2SnrKwifYUodAEUareFMy/5QR8VBlLlMv8FVBMdqQNw
79sD0HwXDH6kcfpkTSi1Rd2898V3CpWoxeR0IgtEax8nqxUwUpNJmWne1VWFI7DdoqSB7OVpkDL4
+tRsZGbWzeguWLR2vPJsxR88sbJ6mhC/CAkpDN2emOe/Jb0qZw1GW/NdwfIJkJvvtLm05SDcWoOD
BfehGd57lSzlJJaWKr4NxBf6hmfUTCN9Q6bnJ5tSsOLkBohkooCSyABXn3VC44cSY5Cnh3diC9wp
seZLsVu5UI5zjTJgz2nkyuTGkTjzQSRYHizOa15qjQedSl574z/7co3r3/BrHO4qrHI/f0x6aywy
Kj7tuCmlgphSST5twEyHoUoLcoK7RuPqQxtZkY8Fi95haEXBCZrGz38pXghUePDIAxku2GTw/KcP
H+4knsg5Q22VaRQGcYHnfg8DwDpfUGveMK0DZCmZCyt5BGkLJdvMwoy418/DHYnVD9SYWNYnQLac
poYaTmoRnCgJvettaZP02Z2cs4x/UfcInm+e4nXN9a131FmSBxpYRJLIM9ZQOlQK7v9J2HIQrBTM
O5Aclru1YElpA9rcP42Q2cl9GOVh/P6TE2cRB4/ht6tJJpsdPYvt0QvbS9CcqHne3GHgY4Wdz0ts
FQPbYxkIKcvfHpRZkGyiMHxSmoh8x9XO+Kw21Q6RNtlDaMmrH9JXfk6KGfWRsmeZHNGOyXlAurwN
/a0H5MhtNqeaP9QFdrajrpu3S7UTgZkuYmZlV4E4O0HEGBB65FK34GiSnva5PrQLY7mRwvJrKup7
+3/xIdz1Ak1S6qwyCfhcGKmu2FCTx7b7kDiLq5kmsGRx2IcdliK1Pv9JtWdji6oiApfF2DGpwhKn
TA/0x4pfjFWQ1O61UGdR8q3nPbUTfjvDZWOkAhV2ImeLoHJ6bHtckG8zmB2wLUuQ0yMxLaoKjc5M
gf1lzNm8wwTcP+Kzary6PQahTjxKrUxhCJW6nCcG+ApdDDI1jufsEfgW0Q2iFp3D1nIc9S8hfxQm
iYwnQt+lWIGm4Bkj0zDV+QhTKPhRaYW3tybSSEEGe+tDLKG5dwju+K6M69HjWivWKfDhkU2eFWpQ
pNbWsRD2pIaMSMYy1tP3L70veMKv/hX7vQPVL+izU2EkXHZ5+E6PWFbrbFtjZ3W2dNsN61DKCY7q
PSH7PozmKWIgZpKC1Kc57Q135En2KEprz0XZRsN2M0fBYuOQhiKO7FZ42sox4v7h57t9Cy/b0dEN
NBIwR/fM37aR2YecZ+6MHx5291d9JFkwXZ7+3G3O+/XW7KH/Jy2/VJabsruK7lj3Jd5BaFr+Yfq5
83hBUvFOHKipiXnyzeFfIOdYSlgF86TIiLpJ3OpS4Ek45MEcKlgnnme/73jjcKd3+CdfOtlaOkyK
q95DRFjxLsOp0jsqyHIbySdFmZJgmIBs1Zroe5PoMaykmXKzqB8vXlaCU9Ha1+C5MyMmnnm1No8y
dJPV9YDmoD+FfLuVr5F7kw7SqjHt2jbjgRoiCLWEJVu6VUypVRinfHVfUOn7JBgkU871uMx18OcF
wlC5Kax6Ua06VP4ncXppKst42uL3h/qof+yKsLyahWW+/x7oMviNuvzjhr7JaYzBW02B1TbdNUlP
otzPbs1Y8KukLKozaA5Yc3BwC2d2evyJ3/nFbSOgBJTkPDH0ARDsbEyAYxo+PzMDvSfnSZNEgsgo
9bztWVKiIEyjkkx3LEbsAURG21i5YcqTGAmbojYlDypjAZIfaA46CxnrQkOuFJzqaTf8YQLcJMz9
cdt8eNloOFYLu1/0jjR3aKomANy+NKnLfhxyBRT1EIvt2/2o2m0DwJe1h/NMN1Us91Xg7r8YdoUn
E45SpZUk0LI9gqc9H0n7dFYyNnvVau8qrg2fuJVOaiErvlyqIoIFdE/GGbvQvkyqEzzCdxM8vT2g
hba2CYYkVfsce5rawSisrp9mjpnkP49HCtAs+x45ieMitwKY6l+5MjLbEFJr3i65NmcwlmRj6pxR
o46GNW5c0Ed14G54E0zxgBcHi3czzfVTNXY7YZe5v9s5HsZy3wGPNpjHbPkzLBT9PbQpmfBDMMhy
GISPTx8pynKC9NXTCTt9zsS+1d7v79XY4PZwYdRb/iG0kMOE98wy3yoCT0Ykg/yCZ/eVH1NuF3Fb
HPf7QcOo1DUBfqYw87YKKa3ZNfiu9Tqz2FksC3dlGjaOLuwc3oFbhK7Xq+L2clC+qgDWD5jZ6dGz
/TOE2/htJh0TAKxr4XCGBNIJw1l3AhKBfqd89h4mDWgOlhxqJBfCgmOviyDp+JRQq2QKkDk/Ge2E
Mh5pSaA=
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
