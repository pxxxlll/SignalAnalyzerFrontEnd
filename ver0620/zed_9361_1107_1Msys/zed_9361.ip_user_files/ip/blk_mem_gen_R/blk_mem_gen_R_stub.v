// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Dec  1 11:26:52 2023
// Host        : DESKTOP-44GDF0S running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               F:/Ming_Jian/16QAM/16M_16QAM/zed_9361_1107_1Msys/zed_9361_1107_1Msys/zed_9361.srcs/sources_1/ip/blk_mem_gen_R/blk_mem_gen_R_stub.v
// Design      : blk_mem_gen_R
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *)
module blk_mem_gen_R(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[12:0],douta[11:0]" */;
  input clka;
  input [12:0]addra;
  output [11:0]douta;
endmodule
