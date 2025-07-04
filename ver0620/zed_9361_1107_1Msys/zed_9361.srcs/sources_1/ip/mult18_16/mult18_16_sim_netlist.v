// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed Nov 15 17:53:04 2023
// Host        : happ_x1c running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               C:/projects/vivado20192/zed_9361_1107_1Msys/zed_9361.srcs/sources_1/ip/mult18_16/mult18_16_sim_netlist.v
// Design      : mult18_16
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult18_16,mult_gen_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module mult18_16
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
  mult18_16_mult_gen_v12_0_16 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "mult_gen_v12_0_16" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module mult18_16_mult_gen_v12_0_16
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
  mult18_16_mult_gen_v12_0_16_viv i_mult
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
U8NkaGtX6pZ47asCooKHGzSbFQIEMrrL1YZARxJfSCuBQWr862c1Y3Jx3Kmo2cd1kouQMt7hAcss
gJRJ6YHdzAoBT3Q/ZOfw+HVSPsgpW8+bK/ygxP8mQ8+6alA5DqdcfCpLoH31S+BoL8EW2QVPx18U
o0n24WETQlAV+nYL5cTfdVI4Lc4vXfZjOmOgnLqb0aWNUvgfQrIt2Iy1CZiO/nU9qcG9LaWie16W
Y0lu+bUaQBYEyrM8TT2d2KYrEprZCqi8TlTdSktAb1H9R90EZNl7sbQEqRptYD+NQhGnzJjE5QLr
yqbg71hf5V0EMSr03b/AGH0WV0bddQfOQR1CUQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BPjyZw7EsFSdVA8y2Wsfr/lneb1kgMoc1KcE9Hs+B1lZrkDA5YWnsdFkyADxkanpubyO8+ZIH03k
qhxSggIjXur1WkU4biJX9EHAZh59WuCxLTGfZjz1K1Yv28S65H/kkXl6tBbcLSNNHVLFB7ESj5Ll
UBcjrMZqKgwNsbTwwxjRih+4fuzFPSUsSHcEKHSaXsz7xWu0Bhu92Rk19tRnPTIPDlXpdk/Peeee
V20WdUsOVGaMrUa0gYwehtktIup1lK5LX0Q0zejREevRC001YAJxG4CQBRWx4gZpqgvVmJFgbfmX
2bq6QR7dlvqDaaJOaj+n1j7LY4Pt2x0Ox1sovg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6528)
`pragma protect data_block
zFYH8+OjgnaEyZ47hluj/WFkYUFdV/PFH9sgwAoUv0Odlqq3C9UotLIVM5xVPd4In6vhmmB34fPE
pgILEiPr7Onk5PJNzYvxm3ga2uVkmFRyNtINiHftn0OMis88dEgV5AGMj/4PA2QFYXKHkzgjyTwd
oCr9zeFX97UUqDKT0LRx2G3IN9UCRNczeMCI7HnNW9DQsvISxu4R1DiQRB0PuIsA/nRrFVcA+APw
KfCS/G2OXoqQ5ahxzGOnO0WwmqlJdTZnWCAl6tfBYeDITU1vQegu+BfHVzVElDDxMUWBnjJgFM7x
bHQ+KqQqvzZhrfh7BbBtddNSYjkS7bonHaFyE0XTHP/1r5u4LIMjNrB+ezsBTP83PjEwGDKFYhbw
rwxvUNPbrydqNqpdR46NbR1bnpjHM7b449/DbeTyWTYJWv0mX0cSULHxEl0uZTmL7q33QMgLb0e9
RsC8ZMoO7TC+M3nQRtk81N5SLblibHMlPRVh2SZ5yuWGI4Ht1+uWjV8vfpQuUnVYuCfjLaQ7atOO
4dVLMHQWH1fiyHlPFSLDZiUiVfoCL6zzOZ9B9dKZAmvSc8qKroI5qNxwXIP8JoXspUTxeBZdsB2b
Tq7rwmmxA1fPP17cbjf0FEb354tR9MUiEQlp/ktC6s3N+0A7jfhHNtRh2s7pMtS9aPknqDZzeQww
MgBFAVabggg1geKNYGIcBw5aESHDMraD/ZwoDnxFYjwttDI0C8sqEFKQlGhNkY0APpMJpRZj5fma
PMPgpxJEBnGu69jLSPsE/r1VN2G4KMGxmj+zrjY21Pz15YalXjVSjDM/CsUKpZDaixW3991Qt+zW
5tVC+ue8gk3TOGM26FZqH33AF0lw9C5XSRo286RHoB6XxW1xazUGejhU2fArwN5dtUjRfo0X/4qr
4bbSGOvZkcvotDO3tikZfY2i7ReknKb+93PCtjAR7Zbg45ZIlQrmimD0FSAIYFYO7w/161YaVOTB
6PWYO9y0ktrMm1R52aDa4+k6At8775WNz1kqrtJixyF3M3T6A51f1Z3372TNZJRfjEKDS+959zcq
GLsCEHSa6v+HWVKB8vBaTJTMmRVvMHj1n/zF3mGezhV0U1HQKIH3/tRXQrBGDCxkgUz60Roq6ptY
uZofRSIpZyhFnVSjRxhawaft8Ey7OqQKwr/aywj5rLTvVZPNcfgihA/UiiwgLEAjDn+byvvZS62T
efGYle88QD+Zsi2VYcQVnmAL/UCdWYht8Qt39y1ZvRkBvjF96HtEUaO/8Yevp/lnZoT4hOIdyaXl
hmv5N/Cug9j5QVNV0hmGrNwsAdVMYFizSzn5hVnX8SRoSG+5+p576M2QlpVFBDCgdYIkSp6//UVm
eOgxvxMUwx8mFjQBoShWk05JEarDL1yDd0REMZZgfZfYNyFC0SupnPKsbIBzt47fqcrnOMm6bpNP
+PudCstTW6U0zzwYJolKJArVbqZoRweZfEdd9iEnI2qDFiKrFAKtQv7kuLtpszP1Mw2pnhK6wVE+
9Yp77+9kqFnxzEodwgYePUWbesaribeKM+pleh0G0MeJJCeBu2DzKuVJnohq42mlJRCDQq/vfY9u
Q75mpm9YM4cbmbskfmEtaHLaOsPmmUgCmtH+4n3dQubA4wYTH3dpaunbYaJUh1BSoYgxq6jvd9Lw
YAdttiqaQA0rX9I0KAObvzX1pbl7eBfvcbI9t1Kc9N73DIZtYvkwHW5P7oLdcLzaCtMGJzXVzU10
MjTbFXo5iNLS9zBu5GUhVV1VMoZOoPYRpgcMPWeJv2Z4p5c3DT7YnOk/S48+bt3IfAm5HBDMDZjJ
a13dAHS9TdLTsQWuPzmWuvCnUZC5Gb3DwL1SDSiEC4Fy7uSbLETKePS3OK/6iPu8IS3tHo4wX7hq
287nC+gsR3DrTpVWbOitE8Yg6ph7T7aiN7O1zrSQliFRVi6NbE2Pyg3wgJb7FBlE591WgxtmpYap
sACiwP7uoKKuEj5uB1stIDPOIELHyiVIL1oTtkC/44a79t2gfaYP3A2GIQ9xkhrpukC6NUdz/D8V
z7eqS3mequS2SYby7taTLcAJu/+032wG+a8HD1zNUH38+PlRCfP8qBXOygvepciJJxX+54AQqnXm
l5+8pEMMZ26exSs3Qw54ESlQiwig1c8dJo6dVe9DjR764WZRmw6OqBzhLv9PVPhJcxMOgMBuNZLp
f4N4oDNbC2NFCr8Ciitx39Q25ROYPRG+r5+Rswyrg8KYRpLDeb6jKEKP8u7NX+HTTJzTiDWnMy63
npQldXAlnD8jEHUm2oov5cLRCLw1KCyGDE3hYpgkgvP1+wpO5TDLC8DiF5RexBAAIi/TITFnbrus
G7hhJKT0hfqjEX7dEB5qo3ycBYIvrD257I2mWU/HAyCnGBwlURB2DzKsXt7cAWU2e6eKnK19/HCs
AUQDimlivCfS1egOOcWXRpo+irN80UTklasq7iQgleprjku2LHFVUiXMMUwn06SPxH4W4s1uv6Yu
pLWVirKrYP5McCvK5NexVRxlxh/Hap9zQM+xjvy1sGJ/z11ElzYOZSMbA508RqMTu6KC0SWcGnJJ
qOZQdx+qEjB2laCwH3Eb5aTGiloniGJZ1ZQoPB6imumZo2vcC244O8+Ma5LdBFT/pCZ55g9TpPHI
6dbCmcpKrYNfjplAFhF1VyKXiYR84VilbZzLfbKAJftJ2EWNKvIWpMLZ3oyqQoPvGprva5UdRbF8
yIzK5C56yqVhmzqm1IbZ1x736Ma20rAP0K4Kw3QLqN+4FJrvKsiaDN8mrTlQVFp8fkU7HzMslDD6
1nu/QQ6pUNZCK+4gCSaH/9xFq30hAkyg4AdzRXebhyXVlzyIvJ0TGsr7aCrygYm3CN0FXQuGWMS8
fLOWVIBOnyF2kE6yoA8MNC9/PjzI+x2ZljydMeCwUw3F4Iqynb5lbsf7LDNiaN/RGjADZf9jGirb
GPku3A318uPvHL1kCelzP6hVoUQK++CRqq8jmBEOJ3vq2bBaGyZHa29buqIBJvPDWtg17xDfItIj
3ELn1hxvesC//ZR+44rsz7Otwwr/Z+TgQKAVGw7kaKkl0QsrdRgvokUx32NQy0Fjk+5rL+nQMN68
zt3bj/f/M5HdcB5wJes6FPq9Rlm+00OQC51/MgSLaJ3a9eCXTn2efLkjvos78gfkC1+xx6gknaKP
HP2sxPKk4yYCZ0syHEiq7pnGa1F0gM+jgHKeWXP75fAdKnxpR/UUFqfADVi8Fp9Qm6cqQ3f/mn2g
iVpOPE5CMtpZqtcJK+/48XXamNd6K7YYQxax0e5atzulv0j4H84UUILTn2gOxBUO25rJQbvD+WV+
HgXXBRnfEjhs2z6Ms/Ot/maFOtxSVLhwOKzcRdShyhYZZ8BVRIbQvMkuL1SCjAzi/sanln9S3DgO
kj5QVZmQ0ZsW/J8eLAm3r2Tu8UTaGVouNiRaNWIXhDpXXPsltXDfh1FLGh6ZGNTaNUnHkPdaPqHp
kVc2QRUOhf2dd92QdFokZd604KdpcRtX4Aiah/Six4XcGlbQivkfDHApKgJLSJX337X5cfN2wy8A
Pi7euMlVo/aT3011tNFhc/HxIEOIPrOgZktxAghsHcqgUZg6SIH1QWlUVHRtpmEkf40tIH/QTwzS
uIhjnTdqj/yXW8RuPQ+H/U7lPBoYOHTIfPw9LiyALAhvegt9EzV7f6IuT1b/HO+6qITHTI9RdeVS
dKaXC79PKj8KuZHsWpgd19rg3HhrLBVvEZzbo7lPM/VOv8GKHcG8t5vkIhGJDvVPJpwKLPiGa+wr
QqEusCRnIhYk4PyEMz52iMxitEz6Skdc3J02NHlz4C0m+pCux/m4EumpuW6etQAOwK8j7cZ52qys
qgf1c5mQDPw84IBQrzBqYRJWB8nPXSSQfPz3V4Xj0oxjnTEMduj7FkCSuDXJtXqzj/TZSHvyYTv6
n6w9RtD7qs/yC6U23VhjnJ+hcz4lgRdxhIqSBomBJoOYIqhKmjdK37F5Z/WnvuikIvu0mpp/x5KT
L8+GfqBMFCwojynvYzfeVciNTzZD0vwcHlsINERWhSDFDIXHDSfRbZO3WKpOkbJ0NpVE0kutJotD
wIrq58vOQaScN2B2PsWH2Yj5Kx4knLEZjOvyvwMI9cSyFtU0oI/y/Yp5MpSVR6xe2Qv0RDJyp40B
RTgbajosb0A1CpkTx8bESH7k8NsUBtxvOyppLKNknDRAfeWGQG8XbRz1qIyueHxRF1d7gq09ZJGI
WOaQMzGa2oVIEa2RmH/Tj11183UFrCXAZdvjvH74ON7ckg8mAPE3bhf08VJ0Y5f8DJAUHIVFhTs3
ERYqljJbLs+J8PIr+NrqOhF8vhBZvvUk9oj1HD92jqSYBJVqM1UUF1JFpDCgzjN1mnZ1CJ9oq7Jr
Rt6smzmUWYgdumOX1XOtN12Giz+WzXZmjyjsqhCdN8KYLyUMmmsQFiIoCwlRXdyo8jPMZ6MQMZ2u
3y51bY/iOtrgrHI5qAAB6I5/p1psbFHIArCmvPfzEyr2uDlBYOQyyRnAjC5hgkOKKJHPYnxuFZIf
ycwfP4BVV9SbPj1987qsGm07eyG/A/ME22DTcHxeyuCrgibeEEQnT3OpNN+cwpZLlqLpitAlAu9z
kmGJ7H/3KKKQnyORaGQqyHzltWiM9pLZADW3sBQGNJZjAU6HY9cTpDQAptH5NnaBSa7Tlq5Fnnf1
aCgJ6fwNSDjEaIJoCkWKnwMSkf375FtI0AkJhFR4voJzZaNptBsANQToFAo1oNZrHYZD18b8baiF
l1PTlbpEVGSt74IdU8TFop9Q+tF2lRTmxOsGJcZUSjYuLghQHOrja+EX5MJTarh8q6UZiOqJ/zGa
QY0CBaz3k0s6wSDRm1JACIQXKx1lmjL5ZzMR66tF0EkMN6LpiKMPOIZ8mx8mQM/R8Epe0CA9BcN3
V+eqJbOGtoqWQIcZtXqtRMYoQC5eHoG3/7v0/rGSCJ+CeBCilBK7aF5Q6lkVLR9WQF7GvwVsG+Bg
5nznDfN00cfATfWzvScr3i12+rWS1NG+GYNi0S9TmkStyG0lytLX3HWG3oX03oaf6Mg6NPNRLtfr
TKhm/JqOn6C2kD9gOeR6dCoX0uu3+1NKIpgx5LUCWU+wC5gcLDKnHtrFjTCC6pC4UqS/DLYAtdBX
3r2Jn1oK9jsNZJcPojMGJejtLdd2cVRdgCy62noX5MqmPw6klsFGGRlFnJX0j3xRFIjpnL36fldV
SueaikKxunbCpiCzyfq3rt7GFeSkiVtkHdHcHt4qHLZtXRd14yzjRo0NC0NjQ2ZVmscZi2Jm09Y7
tE8UlW9GJvWuPKio2xDuI3gHDjskcJ+4MDguwRvMJ7P0l800Jfe12b443PyjeJ9VgULAMxBv9p4G
SwCr00SfU56eAQmxc8AJqOQN+3EgDR4EAlJ9Kv/pQF2Xs2L8/XY4Y1P1GgvIMOVo3uS5pX2ych4Q
zLfqqXoj8yM8unU0oBygKz9bOJCVYCKDDT0QPuLD2dl+zjoUFOjkM37hUMAW72FM0POb22HgORRN
u33iGEeJIpit2wtG9FQpLXudqG0tlv5SAAWANkqNy3JioE11N0lmhytJIw/du4yNrXiIOFz/ftQi
rSS9/BF/khF/XHNDYIQS3kObLsEdwxDxqaHJFwUxGYXDkkv4BDK0Y3vjRChKvv3gFTqMFedqcM6S
iRSmjMQ+0JkFeMWSgo4v14k7qR7v+/6FiXubx8hlqjnDizuaPWLhQqwZEiHvw+Ec5FQAJgNGpxdm
vc/V+WbmPFcBfkItDPJ9NYb5JEQEsgbcLLomKyZKtSKx/WvTsww+Gjs2wSMA0sts9kU6SZ5RklFz
c1QgLCbZSnsLx0KNIjjMOHE2112bCMG4OwTL7/702kEo86bq3sViyJEWj9GVSF4cKspfCLkpezEh
iKago2h5ruNfg8avJVOdLyFlOaUJntH8QN6jZpjnStTuZOy8SZ9sXeqtnXcy8o6cLzKGkrEG6YE7
FcU6Tji9Nt9kRN7lek9fUbeSJoOkXIK4+7zTNju8y9PxbOGvmPGtFPNHz5wJ0m8aMNc+O5jIZ8Wq
fgWGPnjoRkUqujqWUUXgQ7jzKK4r6VOVTuZvtfooN0vYwkkBm5Isq4cRvYRwdkyN8L80Ks4mM70G
TruotAuN6ebC94xpULJKzJwZZ+obVqRIs2CnKD92q6xWA9Pit3Tl5MQlcism0bFRUzz+I6sIxr1P
q/0FZgrSfi2/sjbkGiEG4XXcWaeR3Vic+hthU8j30lAQpDGjfBwO9Z0Fil/WLPCGUWMCP7Bmpzqk
c6Be/ygQmGW8Ju+dFe4IDknuK2jU3xtryZ6C4wCqrkz8tzQEeCQcBS1CYwGpMU+GPkk2tcIE0MzV
+Auo9mPEZu5cTRbb/zlsulllCOPoAC3kNxFa/uyJGrI3ZvBIOxw3M0BvBXvgVlBIn/DY6PnV3MOa
DSPdczJssPSg9yPYfL8I1PtQL0dYnZ+6hGS2IhVPReWQJHIJVGYF5iAXTJMaGCjWxAPK/UxIU3KI
ohAW9pmo0JAd/GNRta0uBe0W6ZwJE2Q5uUwBC6cHycUCspLqCVDu7VWMyii9RU87Qyx6thP7PJNP
eiowssAZxMstRiBJ8Y/S8XXac9haDqUX2IbmIUjIlpokLax4phPdTXvSTJ6uYCyEeAnnbxMaG+wL
hZJmIWa0VtUiqweaVJ6ejbKn+LSsHGiLHrExjmG6KLYq5kYwGiTCR8aO/sbSyMuiR1p1j1La0ZRE
DsuzDCkTsVcifgfq8ba2RSy7ItqeryesG9h62CL1Sf2iu3Mwp96fjjjsJyW7ZU93FFT4ymww8EKk
qp2dvZ44g1We1T8gMqBuDxGTAShkgUe2vOqJGT5fbUiz+96e7yTgiF2HN+KccxMtz/PUZyWG9eLf
+IDl/Db6P8TR+cRaqNPzWkWwcOeU+7L2BL7Jr8RD87GSdkBRpV2VEJZ2u3aZBGpzlJ8wH8qMgNau
koIsbr11Vo+nYZ7TRO5OuAOGT8LcFESlZ/SOLi7LGjg2EgU+PniN53TsSXAfu48ffiTzJojoK0Kr
SdArj9P3vGfQkWUm6U4n+QnmOXY2LXMrQW6eEtEz2apglZxiSkhCJcjlURcksY3FjWafwmfWytGB
dabGiolIgmSQOX8sF2XHa/YqU5PrVH6c6q31gp6fUhmp/M/cjDB/WDLLZbRCYoZLAqAfXaRdHlFF
p/gKkElSLpotWcpWxrvThPU0lTF8/ub7qVvw8whp2klDh2d2ri3PzztOu4EI28WFZfll7l5RkxB6
ws50O8aTKFqV2iDf9ICoxtPy+MbsS4no1yUrLmDh2vtBp6xHj26TobpZqFACmvbVWu1iYU3WcdTG
oBq00SnvU1K6rWXQRAeGw/gpPYyi4arP2OQ9orH+WEgIs+UkQbG43MQFjWYkIxHpXco1viVB3QID
InJ1pUSkEjiuutLmZ/UCW4JADdGyzl39FyKSKlC5Tv48lAok3xfNIym3VGA4feRLvDzxzWHg1IOY
fQRezFuDAxGYGDudp8Ih19rKTPNxK1R0IgsPHTbzyWoTxEzRdppfL5OxwsNPicKzAbaHc0y6iFBf
HTAVSE3cfkf7wz77oog7sstLN7kxAk20MoEedRxCcuC+NuZQugKxlmMcgWjniR+o8gowtxnIFITK
odINDlhGix60D8dFdG7l6HqIG1GUn3/oS+joOlkMPMVPwIKhxboN57mlh3mw7zJkT+S9QOZ+LtgT
0f4Ub8Cggj35wbK8A8rozce3xraNwUgwEuQy7YyOBhsX6TjgYJt0gIdLYhb3CKF6GOkaLi/7hAra
J9QbAvG6NGoOCtJkoPfKXxlHpXrJtf51Mz6+Dpn7O3FxB2CUucvNJZOnMTOffAjUDoBTW66CTyhc
sxRe/uOLEZLIzFmb054VwZAh2sDfZuK88yXl8jm+O3kG4teP72GfQREPsCybR2CGmtP1XIAb1BK+
d31QnfTQPwZWsOpo56scllSs4VnX9hSHOeXHoHeFXZpHbyRsDuXcE9j0qM3ukbTAK7RWzKO4jltt
U8KBTiBjFdSWEVauxQUgIhCMykYuvD8Bzs7CN0zRPqo5QsSwLMWN65yUSwbnHxHvfYUu50w4F5RE
LArTjQ7tbA99bdAPDGxsIbHDK401U7G3pISCliLb8kUBUMdZRuP1Qvf8QaeOXnGi1uny1qWWMAE9
tnj2bHjTxGDH+Ky5qEqPTf0Nd57yYtARvSvvEXC/Y/RbgpuMrTuASL2IumTQnhg8cfRdn9BJP6JI
kH44IhbM1LwZtmr+zQX/xrrR5X7qJ17d0PtI/3bxBkhYRtetar1ZRICMV3ZMqyWBtFPJ6C732iPA
hXlNTfDhlA3ssF4Pjw5Nw3DiJA8hMPQZiVLzQxaDASPFJ9rn+i87XgibTp5Tg7o4bz2McBv08pHB
RvXLjJCGDryVbECmXh7YMjNywtn6TwfRJw/tPOVeRJWFVoUJvoDAWjH0Vm2CgP/NPtnvXvAP36uK
Md2Qi08Ktf0mLaKzONv0fLZVfjGU3DouXknhOvqx82wDkFj0wv0bwmdPMFJko5qEiwOYaMaGYQg1
RMdWWyJ8ntfp/5y0+Y2Vd3ricBgvTxEj95Ov0XyVgCr8UMaplr6L8nFsK6bwRm6MxSlAT8bDBSvR
wm/cCxOmMF4sGHN3ECkjzNf3hX/g4Aj44rNUsWaV
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
