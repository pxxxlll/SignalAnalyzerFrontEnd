// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Aug 28 11:51:01 2023
// Host        : MJ_FPGA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_ad9361_if_idelay_0_0_stub.v
// Design      : design_1_ad9361_if_idelay_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ad9361_if_idelay,Vivado 2019.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(idelay_clk_200m, rst_n, data_clk, ap_rst_n, 
  rx_clk_in_p, rx_clk_in_n, rx_data_in_p, rx_data_in_n, rx_frame_in_p, rx_frame_in_n, 
  tx_clk_out_p, tx_clk_out_n, tx_frame_out_p, tx_frame_out_n, tx_data_out_p, tx_data_out_n, 
  adc_valid, adc_data_i1, adc_data_q1, adc_data_i2, adc_data_q2, adc_status, dac_valid, 
  dac_data_i1, dac_data_q1, dac_data_i2, dac_data_q2, idly_en, idly_d, data_clk_ce, adc_mode_r1, 
  dac_mode_r1)
/* synthesis syn_black_box black_box_pad_pin="idelay_clk_200m,rst_n,data_clk,ap_rst_n,rx_clk_in_p,rx_clk_in_n,rx_data_in_p[5:0],rx_data_in_n[5:0],rx_frame_in_p,rx_frame_in_n,tx_clk_out_p,tx_clk_out_n,tx_frame_out_p,tx_frame_out_n,tx_data_out_p[5:0],tx_data_out_n[5:0],adc_valid,adc_data_i1[11:0],adc_data_q1[11:0],adc_data_i2[11:0],adc_data_q2[11:0],adc_status,dac_valid,dac_data_i1[11:0],dac_data_q1[11:0],dac_data_i2[11:0],dac_data_q2[11:0],idly_en[6:0],idly_d[4:0],data_clk_ce,adc_mode_r1,dac_mode_r1" */;
  input idelay_clk_200m;
  input rst_n;
  output data_clk;
  output ap_rst_n;
  input rx_clk_in_p;
  input rx_clk_in_n;
  input [5:0]rx_data_in_p;
  input [5:0]rx_data_in_n;
  input rx_frame_in_p;
  input rx_frame_in_n;
  output tx_clk_out_p;
  output tx_clk_out_n;
  output tx_frame_out_p;
  output tx_frame_out_n;
  output [5:0]tx_data_out_p;
  output [5:0]tx_data_out_n;
  output adc_valid;
  output [11:0]adc_data_i1;
  output [11:0]adc_data_q1;
  output [11:0]adc_data_i2;
  output [11:0]adc_data_q2;
  output adc_status;
  input dac_valid;
  input [11:0]dac_data_i1;
  input [11:0]dac_data_q1;
  input [11:0]dac_data_i2;
  input [11:0]dac_data_q2;
  input [6:0]idly_en;
  input [4:0]idly_d;
  input data_clk_ce;
  input adc_mode_r1;
  input dac_mode_r1;
endmodule
