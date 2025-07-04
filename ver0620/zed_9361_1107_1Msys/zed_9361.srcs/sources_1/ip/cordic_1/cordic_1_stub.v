// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu Nov  2 17:22:59 2023
// Host        : happ_x1c running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/projects/vivado20192/ZED_AD9361_Sean_2019_2_066_1/soc_prj/zed_9361/zed_9361.srcs/sources_1/ip/cordic_1/cordic_1_stub.v
// Design      : cordic_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "cordic_v6_0_16,Vivado 2019.2" *)
module cordic_1(aclk, s_axis_phase_tvalid, 
  s_axis_phase_tdata, s_axis_cartesian_tvalid, s_axis_cartesian_tdata, 
  m_axis_dout_tvalid, m_axis_dout_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,s_axis_phase_tvalid,s_axis_phase_tdata[23:0],s_axis_cartesian_tvalid,s_axis_cartesian_tdata[47:0],m_axis_dout_tvalid,m_axis_dout_tdata[47:0]" */;
  input aclk;
  input s_axis_phase_tvalid;
  input [23:0]s_axis_phase_tdata;
  input s_axis_cartesian_tvalid;
  input [47:0]s_axis_cartesian_tdata;
  output m_axis_dout_tvalid;
  output [47:0]m_axis_dout_tdata;
endmodule
