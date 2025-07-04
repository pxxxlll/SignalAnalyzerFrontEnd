// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Wed Nov 15 17:53:04 2023
// Host        : happ_x1c running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/projects/vivado20192/zed_9361_1107_1Msys/zed_9361.srcs/sources_1/ip/mult18_16/mult18_16_stub.v
// Design      : mult18_16
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *)
module mult18_16(A, B, P)
/* synthesis syn_black_box black_box_pad_pin="A[17:0],B[15:0],P[33:0]" */;
  input [17:0]A;
  input [15:0]B;
  output [33:0]P;
endmodule
