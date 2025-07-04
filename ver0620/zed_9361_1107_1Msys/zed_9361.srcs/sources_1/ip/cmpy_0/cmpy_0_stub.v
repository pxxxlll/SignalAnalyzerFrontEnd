// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu Nov  2 17:19:28 2023
// Host        : happ_x1c running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/projects/vivado20192/ZED_AD9361_Sean_2019_2_066_1/soc_prj/zed_9361/zed_9361.srcs/sources_1/ip/cmpy_0/cmpy_0_stub.v
// Design      : cmpy_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "cmpy_v6_0_18,Vivado 2019.2" *)
module cmpy_0(aclk, s_axis_a_tvalid, s_axis_a_tdata, 
  s_axis_b_tvalid, s_axis_b_tdata, m_axis_dout_tvalid, m_axis_dout_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,s_axis_a_tvalid,s_axis_a_tdata[47:0],s_axis_b_tvalid,s_axis_b_tdata[47:0],m_axis_dout_tvalid,m_axis_dout_tdata[79:0]" */;
  input aclk;
  input s_axis_a_tvalid;
  input [47:0]s_axis_a_tdata;
  input s_axis_b_tvalid;
  input [47:0]s_axis_b_tdata;
  output m_axis_dout_tvalid;
  output [79:0]m_axis_dout_tdata;
endmodule
