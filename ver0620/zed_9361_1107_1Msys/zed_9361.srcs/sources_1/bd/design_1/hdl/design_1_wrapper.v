//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Thu Oct 26 15:53:30 2023
//Host        : happ_x1c running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    GPIO_O_0,
    M_AXIS_DATA_0_tdata,
    M_AXIS_DATA_0_tvalid,
    SPI0_MISO_I_0,
    SPI0_MOSI_O_0,
    SPI0_SCLK_O_0,
    SPI0_SS_O_0,
    S_AXIS_PHASE_0_tdata,
    S_AXIS_PHASE_0_tvalid,
    adc_data_i1_0,
    adc_data_i2_0,
    adc_data_q1_0,
    adc_data_q2_0,
    adc_mode_r1_0,
    adc_status_0,
    adc_valid_0,
    ap_rst_n_0,
    dac_data_i1_0,
    dac_data_i2_0,
    dac_data_q1_0,
    dac_data_q2_0,
    dac_mode_r1_0,
    dac_valid_0,
    data_clk_0,
    data_clk_ce_0,
    phase_0,
    rx_clk_in_n_0,
    rx_clk_in_p_0,
    rx_data_in_n_0,
    rx_data_in_p_0,
    rx_frame_in_n_0,
    rx_frame_in_p_0,
    tx_clk_out_n_0,
    tx_clk_out_p_0,
    tx_data_out_n_0,
    tx_data_out_p_0,
    tx_frame_out_n_0,
    tx_frame_out_p_0,
    ud_wclk_0,
    ud_wdata_0,
    ud_wde_0,
    user_rstn,
    user_start);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output [31:0]GPIO_O_0;
  output [31:0]M_AXIS_DATA_0_tdata;
  output M_AXIS_DATA_0_tvalid;
  input SPI0_MISO_I_0;
  output SPI0_MOSI_O_0;
  output SPI0_SCLK_O_0;
  output SPI0_SS_O_0;
  input [15:0]S_AXIS_PHASE_0_tdata;
  input S_AXIS_PHASE_0_tvalid;
  output [11:0]adc_data_i1_0;
  output [11:0]adc_data_i2_0;
  output [11:0]adc_data_q1_0;
  output [11:0]adc_data_q2_0;
  input adc_mode_r1_0;
  output adc_status_0;
  output adc_valid_0;
  output ap_rst_n_0;
  input [11:0]dac_data_i1_0;
  input [11:0]dac_data_i2_0;
  input [11:0]dac_data_q1_0;
  input [11:0]dac_data_q2_0;
  input dac_mode_r1_0;
  input dac_valid_0;
  output data_clk_0;
  input data_clk_ce_0;
  output [11:0]phase_0;
  input rx_clk_in_n_0;
  input rx_clk_in_p_0;
  input [5:0]rx_data_in_n_0;
  input [5:0]rx_data_in_p_0;
  input rx_frame_in_n_0;
  input rx_frame_in_p_0;
  output tx_clk_out_n_0;
  output tx_clk_out_p_0;
  output [5:0]tx_data_out_n_0;
  output [5:0]tx_data_out_p_0;
  output tx_frame_out_n_0;
  output tx_frame_out_p_0;
  input ud_wclk_0;
  input [127:0]ud_wdata_0;
  input ud_wde_0;
  output [0:0]user_rstn;
  output [0:0]user_start;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire [31:0]GPIO_O_0;
  wire [31:0]M_AXIS_DATA_0_tdata;
  wire M_AXIS_DATA_0_tvalid;
  wire SPI0_MISO_I_0;
  wire SPI0_MOSI_O_0;
  wire SPI0_SCLK_O_0;
  wire SPI0_SS_O_0;
  wire [15:0]S_AXIS_PHASE_0_tdata;
  wire S_AXIS_PHASE_0_tvalid;
  wire [11:0]adc_data_i1_0;
  wire [11:0]adc_data_i2_0;
  wire [11:0]adc_data_q1_0;
  wire [11:0]adc_data_q2_0;
  wire adc_mode_r1_0;
  wire adc_status_0;
  wire adc_valid_0;
  wire ap_rst_n_0;
  wire [11:0]dac_data_i1_0;
  wire [11:0]dac_data_i2_0;
  wire [11:0]dac_data_q1_0;
  wire [11:0]dac_data_q2_0;
  wire dac_mode_r1_0;
  wire dac_valid_0;
  wire data_clk_0;
  wire data_clk_ce_0;
  wire [11:0]phase_0;
  wire rx_clk_in_n_0;
  wire rx_clk_in_p_0;
  wire [5:0]rx_data_in_n_0;
  wire [5:0]rx_data_in_p_0;
  wire rx_frame_in_n_0;
  wire rx_frame_in_p_0;
  wire tx_clk_out_n_0;
  wire tx_clk_out_p_0;
  wire [5:0]tx_data_out_n_0;
  wire [5:0]tx_data_out_p_0;
  wire tx_frame_out_n_0;
  wire tx_frame_out_p_0;
  wire ud_wclk_0;
  wire [127:0]ud_wdata_0;
  wire ud_wde_0;
  wire [0:0]user_rstn;
  wire [0:0]user_start;

  design_1 design_1_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .GPIO_O_0(GPIO_O_0),
        .M_AXIS_DATA_0_tdata(M_AXIS_DATA_0_tdata),
        .M_AXIS_DATA_0_tvalid(M_AXIS_DATA_0_tvalid),
        .SPI0_MISO_I_0(SPI0_MISO_I_0),
        .SPI0_MOSI_O_0(SPI0_MOSI_O_0),
        .SPI0_SCLK_O_0(SPI0_SCLK_O_0),
        .SPI0_SS_O_0(SPI0_SS_O_0),
        .S_AXIS_PHASE_0_tdata(S_AXIS_PHASE_0_tdata),
        .S_AXIS_PHASE_0_tvalid(S_AXIS_PHASE_0_tvalid),
        .adc_data_i1_0(adc_data_i1_0),
        .adc_data_i2_0(adc_data_i2_0),
        .adc_data_q1_0(adc_data_q1_0),
        .adc_data_q2_0(adc_data_q2_0),
        .adc_mode_r1_0(adc_mode_r1_0),
        .adc_status_0(adc_status_0),
        .adc_valid_0(adc_valid_0),
        .ap_rst_n_0(ap_rst_n_0),
        .dac_data_i1_0(dac_data_i1_0),
        .dac_data_i2_0(dac_data_i2_0),
        .dac_data_q1_0(dac_data_q1_0),
        .dac_data_q2_0(dac_data_q2_0),
        .dac_mode_r1_0(dac_mode_r1_0),
        .dac_valid_0(dac_valid_0),
        .data_clk_0(data_clk_0),
        .data_clk_ce_0(data_clk_ce_0),
        .phase_0(phase_0),
        .rx_clk_in_n_0(rx_clk_in_n_0),
        .rx_clk_in_p_0(rx_clk_in_p_0),
        .rx_data_in_n_0(rx_data_in_n_0),
        .rx_data_in_p_0(rx_data_in_p_0),
        .rx_frame_in_n_0(rx_frame_in_n_0),
        .rx_frame_in_p_0(rx_frame_in_p_0),
        .tx_clk_out_n_0(tx_clk_out_n_0),
        .tx_clk_out_p_0(tx_clk_out_p_0),
        .tx_data_out_n_0(tx_data_out_n_0),
        .tx_data_out_p_0(tx_data_out_p_0),
        .tx_frame_out_n_0(tx_frame_out_n_0),
        .tx_frame_out_p_0(tx_frame_out_p_0),
        .ud_wclk_0(ud_wclk_0),
        .ud_wdata_0(ud_wdata_0),
        .ud_wde_0(ud_wde_0),
        .user_rstn(user_rstn),
        .user_start(user_start));
endmodule
