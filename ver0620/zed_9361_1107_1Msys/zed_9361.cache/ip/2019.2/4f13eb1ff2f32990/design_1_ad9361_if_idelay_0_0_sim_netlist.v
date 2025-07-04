// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Aug 28 11:51:01 2023
// Host        : MJ_FPGA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_ad9361_if_idelay_0_0_sim_netlist.v
// Design      : design_1_ad9361_if_idelay_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ad9361_if_idelay
   (data_clk,
    ap_rst_n,
    tx_frame_out_p,
    tx_frame_out_n,
    tx_clk_out_p,
    tx_clk_out_n,
    tx_data_out_p,
    tx_data_out_n,
    adc_valid,
    adc_data_i1,
    adc_data_q1,
    adc_data_i2,
    adc_data_q2,
    adc_status,
    rst_n,
    dac_mode_r1,
    rx_clk_in_p,
    rx_clk_in_n,
    data_clk_ce,
    rx_frame_in_p,
    rx_frame_in_n,
    idelay_clk_200m,
    idly_en,
    idly_d,
    rx_data_in_p,
    rx_data_in_n,
    adc_mode_r1,
    dac_valid,
    dac_data_i1,
    dac_data_i2,
    dac_data_q1,
    dac_data_q2);
  output data_clk;
  output ap_rst_n;
  output tx_frame_out_p;
  output tx_frame_out_n;
  output tx_clk_out_p;
  output tx_clk_out_n;
  output [5:0]tx_data_out_p;
  output [5:0]tx_data_out_n;
  output adc_valid;
  output [11:0]adc_data_i1;
  output [11:0]adc_data_q1;
  output [11:0]adc_data_i2;
  output [11:0]adc_data_q2;
  output adc_status;
  input rst_n;
  input dac_mode_r1;
  input rx_clk_in_p;
  input rx_clk_in_n;
  input data_clk_ce;
  input rx_frame_in_p;
  input rx_frame_in_n;
  input idelay_clk_200m;
  input [6:0]idly_en;
  input [4:0]idly_d;
  input [5:0]rx_data_in_p;
  input [5:0]rx_data_in_n;
  input adc_mode_r1;
  input dac_valid;
  input [11:0]dac_data_i1;
  input [11:0]dac_data_i2;
  input [11:0]dac_data_q1;
  input [11:0]dac_data_q2;

  wire [11:0]adc_data_i1;
  wire \adc_data_i1[0]_i_1_n_0 ;
  wire \adc_data_i1[10]_i_1_n_0 ;
  wire \adc_data_i1[11]_i_1_n_0 ;
  wire \adc_data_i1[1]_i_1_n_0 ;
  wire \adc_data_i1[2]_i_1_n_0 ;
  wire \adc_data_i1[3]_i_1_n_0 ;
  wire \adc_data_i1[4]_i_1_n_0 ;
  wire \adc_data_i1[5]_i_1_n_0 ;
  wire \adc_data_i1[6]_i_1_n_0 ;
  wire \adc_data_i1[7]_i_1_n_0 ;
  wire \adc_data_i1[8]_i_1_n_0 ;
  wire \adc_data_i1[9]_i_1_n_0 ;
  wire [11:0]adc_data_i2;
  wire [11:0]adc_data_q1;
  wire \adc_data_q1[0]_i_1_n_0 ;
  wire \adc_data_q1[10]_i_1_n_0 ;
  wire \adc_data_q1[11]_i_1_n_0 ;
  wire \adc_data_q1[1]_i_1_n_0 ;
  wire \adc_data_q1[2]_i_1_n_0 ;
  wire \adc_data_q1[3]_i_1_n_0 ;
  wire \adc_data_q1[4]_i_1_n_0 ;
  wire \adc_data_q1[5]_i_1_n_0 ;
  wire \adc_data_q1[6]_i_1_n_0 ;
  wire \adc_data_q1[7]_i_1_n_0 ;
  wire \adc_data_q1[8]_i_1_n_0 ;
  wire \adc_data_q1[9]_i_1_n_0 ;
  wire [11:0]adc_data_q2;
  wire adc_mode_r1;
  wire adc_status;
  wire adc_status_i_1_n_0;
  wire adc_valid;
  wire adc_valid_i_1_n_0;
  wire ap_rst_n;
  wire \ap_rst_n_r_reg[14]_srl15_n_0 ;
  wire [11:0]dac_data_i1;
  wire [11:0]dac_data_i2;
  wire [11:0]dac_data_q1;
  wire [11:0]dac_data_q2;
  wire dac_mode_r1;
  wire dac_valid;
  wire [5:0]data0;
  wire [5:0]data2;
  wire data_clk;
  wire data_clk_ce;
  wire data_clk_ibuf;
  wire idelay_clk_200m;
  wire [4:0]idly_d;
  wire [6:0]idly_en;
  wire p_0_out;
  wire p_11_out;
  wire p_1_out;
  wire p_3_out;
  wire p_5_out;
  wire p_7_out;
  wire p_9_out;
  wire rst_n;
  wire rx_clk_in_n;
  wire rx_clk_in_p;
  wire [11:0]rx_data_i1_r2__0;
  wire [11:0]rx_data_i2_r2;
  wire [11:0]rx_data_i_r1;
  wire rx_data_ibuf_0;
  wire rx_data_ibuf_1;
  wire rx_data_ibuf_2;
  wire rx_data_ibuf_3;
  wire rx_data_ibuf_4;
  wire rx_data_ibuf_5;
  wire [5:0]rx_data_iddr_n;
  wire [5:0]rx_data_iddr_n_dly;
  wire rx_data_idelay_0;
  wire rx_data_idelay_1;
  wire rx_data_idelay_2;
  wire rx_data_idelay_3;
  wire rx_data_idelay_4;
  wire rx_data_idelay_5;
  wire [5:0]rx_data_in_n;
  wire [5:0]rx_data_in_p;
  wire [11:0]rx_data_q1_r2;
  wire rx_data_q1_r2_1;
  wire [11:0]rx_data_q2_r2;
  wire rx_data_q2_r2_0;
  wire [11:0]rx_data_q_r1;
  wire rx_data_q_r1_2;
  wire [23:0]rx_data_shift;
  wire rx_error_r1;
  wire rx_error_r1_i_1_n_0;
  wire rx_error_r2;
  wire rx_error_r2_i_1_n_0;
  wire rx_frame_ibuf;
  wire rx_frame_iddr_n;
  wire rx_frame_iddr_n_dly;
  wire rx_frame_iddr_p;
  wire rx_frame_idelay;
  wire rx_frame_in_n;
  wire rx_frame_in_p;
  wire [3:0]rx_frame_shift;
  wire rx_valid_r1;
  wire rx_valid_r2;
  wire tx_clk;
  wire tx_clk_out_n;
  wire tx_clk_out_p;
  wire [1:0]tx_data_cnt;
  wire \tx_data_cnt[0]_i_1_n_0 ;
  wire \tx_data_cnt[1]_i_1_n_0 ;
  wire tx_data_cnt_flag_i_1_n_0;
  wire \tx_data_i1_d_reg_n_0_[0] ;
  wire \tx_data_i1_d_reg_n_0_[1] ;
  wire \tx_data_i1_d_reg_n_0_[2] ;
  wire \tx_data_i1_d_reg_n_0_[3] ;
  wire \tx_data_i1_d_reg_n_0_[4] ;
  wire \tx_data_i1_d_reg_n_0_[5] ;
  wire \tx_data_i2_d_reg_n_0_[0] ;
  wire \tx_data_i2_d_reg_n_0_[1] ;
  wire \tx_data_i2_d_reg_n_0_[2] ;
  wire \tx_data_i2_d_reg_n_0_[3] ;
  wire \tx_data_i2_d_reg_n_0_[4] ;
  wire \tx_data_i2_d_reg_n_0_[5] ;
  wire \tx_data_n[0]_i_1_n_0 ;
  wire \tx_data_n[1]_i_1_n_0 ;
  wire \tx_data_n[2]_i_1_n_0 ;
  wire \tx_data_n[3]_i_1_n_0 ;
  wire \tx_data_n[4]_i_1_n_0 ;
  wire \tx_data_n[5]_i_1_n_0 ;
  wire \tx_data_n_reg_n_0_[0] ;
  wire \tx_data_n_reg_n_0_[1] ;
  wire \tx_data_n_reg_n_0_[2] ;
  wire \tx_data_n_reg_n_0_[3] ;
  wire \tx_data_n_reg_n_0_[4] ;
  wire \tx_data_n_reg_n_0_[5] ;
  wire tx_data_out_0;
  wire tx_data_out_1;
  wire tx_data_out_2;
  wire tx_data_out_3;
  wire tx_data_out_4;
  wire tx_data_out_5;
  wire [5:0]tx_data_out_n;
  wire [5:0]tx_data_out_p;
  wire \tx_data_p[0]_i_1_n_0 ;
  wire \tx_data_p[1]_i_1_n_0 ;
  wire \tx_data_p[2]_i_1_n_0 ;
  wire \tx_data_p[3]_i_1_n_0 ;
  wire \tx_data_p[4]_i_1_n_0 ;
  wire \tx_data_p[5]_i_1_n_0 ;
  wire \tx_data_p[5]_i_2_n_0 ;
  wire \tx_data_p_reg_n_0_[0] ;
  wire \tx_data_p_reg_n_0_[1] ;
  wire \tx_data_p_reg_n_0_[2] ;
  wire \tx_data_p_reg_n_0_[3] ;
  wire \tx_data_p_reg_n_0_[4] ;
  wire \tx_data_p_reg_n_0_[5] ;
  wire [11:0]tx_data_q1_d;
  wire [11:0]tx_data_q2_d;
  wire [2:2]tx_data_sel;
  wire tx_frame;
  wire tx_frame_i_1_n_0;
  wire tx_frame_out;
  wire tx_frame_out_n;
  wire tx_frame_out_p;
  wire NLW_IDELAYCTRL_inst_RDY_UNCONNECTED;
  wire [4:0]NLW_IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED;
  wire NLW_ODDR_data_clk_inst_R_UNCONNECTED;
  wire NLW_ODDR_data_clk_inst_S_UNCONNECTED;
  wire NLW_ODDR_frame_inst_R_UNCONNECTED;
  wire NLW_ODDR_frame_inst_S_UNCONNECTED;
  wire [4:0]\NLW_genblk1[0].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_genblk1[1].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_genblk1[2].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_genblk1[3].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_genblk1[4].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED ;
  wire [4:0]\NLW_genblk1[5].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED ;
  wire \NLW_genblk2[0].ODDR_tx_data_inst_R_UNCONNECTED ;
  wire \NLW_genblk2[0].ODDR_tx_data_inst_S_UNCONNECTED ;
  wire \NLW_genblk2[1].ODDR_tx_data_inst_R_UNCONNECTED ;
  wire \NLW_genblk2[1].ODDR_tx_data_inst_S_UNCONNECTED ;
  wire \NLW_genblk2[2].ODDR_tx_data_inst_R_UNCONNECTED ;
  wire \NLW_genblk2[2].ODDR_tx_data_inst_S_UNCONNECTED ;
  wire \NLW_genblk2[3].ODDR_tx_data_inst_R_UNCONNECTED ;
  wire \NLW_genblk2[3].ODDR_tx_data_inst_S_UNCONNECTED ;
  wire \NLW_genblk2[4].ODDR_tx_data_inst_R_UNCONNECTED ;
  wire \NLW_genblk2[4].ODDR_tx_data_inst_S_UNCONNECTED ;
  wire \NLW_genblk2[5].ODDR_tx_data_inst_R_UNCONNECTED ;
  wire \NLW_genblk2[5].ODDR_tx_data_inst_S_UNCONNECTED ;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "BUFGCE" *) 
  (* XILINX_TRANSFORM_PINMAP = "CE:CE0 I:I0" *) 
  BUFGCTRL #(
    .INIT_OUT(0),
    .PRESELECT_I0("TRUE"),
    .PRESELECT_I1("FALSE"),
    .SIM_DEVICE("7SERIES")) 
    BUFGCE_data_clk_inst
       (.CE0(data_clk_ce),
        .CE1(1'b0),
        .I0(data_clk_ibuf),
        .I1(1'b1),
        .IGNORE0(1'b0),
        .IGNORE1(1'b1),
        .O(data_clk),
        .S0(1'b1),
        .S1(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    IBUFDS_data_clk_inst
       (.I(rx_clk_in_p),
        .IB(rx_clk_in_n),
        .O(data_clk_ibuf));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    IBUFDS_rx_frame_inst
       (.I(rx_frame_in_p),
        .IB(rx_frame_in_n),
        .O(rx_frame_ibuf));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    IDDR_rx_frame_inst
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_frame_idelay),
        .Q1(rx_frame_iddr_p),
        .Q2(rx_frame_iddr_n),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  IDELAYCTRL #(
    .SIM_DEVICE("7SERIES")) 
    IDELAYCTRL_inst
       (.RDY(NLW_IDELAYCTRL_inst_RDY_UNCONNECTED),
        .REFCLK(idelay_clk_200m),
        .RST(p_0_out));
  LUT1 #(
    .INIT(2'h1)) 
    IDELAYCTRL_inst_i_1
       (.I0(rst_n),
        .O(p_0_out));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("FALSE"),
    .IDELAY_TYPE("VAR_LOAD"),
    .IDELAY_VALUE(0),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    IDELAYE2_rx_frame_inst
       (.C(idelay_clk_200m),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(idly_d),
        .CNTVALUEOUT(NLW_IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED[4:0]),
        .DATAIN(1'b1),
        .DATAOUT(rx_frame_idelay),
        .IDATAIN(rx_frame_ibuf),
        .INC(1'b0),
        .LD(idly_en[6]),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    OBUFDS_data_clk_inst
       (.I(tx_clk),
        .O(tx_clk_out_p),
        .OB(tx_clk_out_n));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    OBUFDS_frame_inst
       (.I(tx_frame_out),
        .O(tx_frame_out_p),
        .OB(tx_frame_out_n));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    ODDR_data_clk_inst
       (.C(data_clk),
        .CE(1'b1),
        .D1(1'b0),
        .D2(1'b1),
        .Q(tx_clk),
        .R(NLW_ODDR_data_clk_inst_R_UNCONNECTED),
        .S(NLW_ODDR_data_clk_inst_S_UNCONNECTED));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    ODDR_frame_inst
       (.C(data_clk),
        .CE(1'b1),
        .D1(tx_frame),
        .D2(tx_frame),
        .Q(tx_frame_out),
        .R(NLW_ODDR_frame_inst_R_UNCONNECTED),
        .S(NLW_ODDR_frame_inst_S_UNCONNECTED));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_i1[0]_i_1 
       (.I0(rx_data_i_r1[0]),
        .I1(rx_data_i1_r2__0[0]),
        .I2(adc_mode_r1),
        .O(\adc_data_i1[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_i1[10]_i_1 
       (.I0(rx_data_i_r1[10]),
        .I1(rx_data_i1_r2__0[10]),
        .I2(adc_mode_r1),
        .O(\adc_data_i1[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_i1[11]_i_1 
       (.I0(rx_data_i_r1[11]),
        .I1(rx_data_i1_r2__0[11]),
        .I2(adc_mode_r1),
        .O(\adc_data_i1[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_i1[1]_i_1 
       (.I0(rx_data_i_r1[1]),
        .I1(rx_data_i1_r2__0[1]),
        .I2(adc_mode_r1),
        .O(\adc_data_i1[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_i1[2]_i_1 
       (.I0(rx_data_i_r1[2]),
        .I1(rx_data_i1_r2__0[2]),
        .I2(adc_mode_r1),
        .O(\adc_data_i1[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_i1[3]_i_1 
       (.I0(rx_data_i_r1[3]),
        .I1(rx_data_i1_r2__0[3]),
        .I2(adc_mode_r1),
        .O(\adc_data_i1[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_i1[4]_i_1 
       (.I0(rx_data_i_r1[4]),
        .I1(rx_data_i1_r2__0[4]),
        .I2(adc_mode_r1),
        .O(\adc_data_i1[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_i1[5]_i_1 
       (.I0(rx_data_i_r1[5]),
        .I1(rx_data_i1_r2__0[5]),
        .I2(adc_mode_r1),
        .O(\adc_data_i1[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_i1[6]_i_1 
       (.I0(rx_data_i_r1[6]),
        .I1(rx_data_i1_r2__0[6]),
        .I2(adc_mode_r1),
        .O(\adc_data_i1[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_i1[7]_i_1 
       (.I0(rx_data_i_r1[7]),
        .I1(rx_data_i1_r2__0[7]),
        .I2(adc_mode_r1),
        .O(\adc_data_i1[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_i1[8]_i_1 
       (.I0(rx_data_i_r1[8]),
        .I1(rx_data_i1_r2__0[8]),
        .I2(adc_mode_r1),
        .O(\adc_data_i1[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_i1[9]_i_1 
       (.I0(rx_data_i_r1[9]),
        .I1(rx_data_i1_r2__0[9]),
        .I2(adc_mode_r1),
        .O(\adc_data_i1[9]_i_1_n_0 ));
  FDRE \adc_data_i1_reg[0] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_i1[0]_i_1_n_0 ),
        .Q(adc_data_i1[0]),
        .R(1'b0));
  FDRE \adc_data_i1_reg[10] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_i1[10]_i_1_n_0 ),
        .Q(adc_data_i1[10]),
        .R(1'b0));
  FDRE \adc_data_i1_reg[11] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_i1[11]_i_1_n_0 ),
        .Q(adc_data_i1[11]),
        .R(1'b0));
  FDRE \adc_data_i1_reg[1] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_i1[1]_i_1_n_0 ),
        .Q(adc_data_i1[1]),
        .R(1'b0));
  FDRE \adc_data_i1_reg[2] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_i1[2]_i_1_n_0 ),
        .Q(adc_data_i1[2]),
        .R(1'b0));
  FDRE \adc_data_i1_reg[3] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_i1[3]_i_1_n_0 ),
        .Q(adc_data_i1[3]),
        .R(1'b0));
  FDRE \adc_data_i1_reg[4] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_i1[4]_i_1_n_0 ),
        .Q(adc_data_i1[4]),
        .R(1'b0));
  FDRE \adc_data_i1_reg[5] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_i1[5]_i_1_n_0 ),
        .Q(adc_data_i1[5]),
        .R(1'b0));
  FDRE \adc_data_i1_reg[6] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_i1[6]_i_1_n_0 ),
        .Q(adc_data_i1[6]),
        .R(1'b0));
  FDRE \adc_data_i1_reg[7] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_i1[7]_i_1_n_0 ),
        .Q(adc_data_i1[7]),
        .R(1'b0));
  FDRE \adc_data_i1_reg[8] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_i1[8]_i_1_n_0 ),
        .Q(adc_data_i1[8]),
        .R(1'b0));
  FDRE \adc_data_i1_reg[9] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_i1[9]_i_1_n_0 ),
        .Q(adc_data_i1[9]),
        .R(1'b0));
  FDRE \adc_data_i2_reg[0] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_i2_r2[0]),
        .Q(adc_data_i2[0]),
        .R(adc_mode_r1));
  FDRE \adc_data_i2_reg[10] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_i2_r2[10]),
        .Q(adc_data_i2[10]),
        .R(adc_mode_r1));
  FDRE \adc_data_i2_reg[11] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_i2_r2[11]),
        .Q(adc_data_i2[11]),
        .R(adc_mode_r1));
  FDRE \adc_data_i2_reg[1] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_i2_r2[1]),
        .Q(adc_data_i2[1]),
        .R(adc_mode_r1));
  FDRE \adc_data_i2_reg[2] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_i2_r2[2]),
        .Q(adc_data_i2[2]),
        .R(adc_mode_r1));
  FDRE \adc_data_i2_reg[3] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_i2_r2[3]),
        .Q(adc_data_i2[3]),
        .R(adc_mode_r1));
  FDRE \adc_data_i2_reg[4] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_i2_r2[4]),
        .Q(adc_data_i2[4]),
        .R(adc_mode_r1));
  FDRE \adc_data_i2_reg[5] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_i2_r2[5]),
        .Q(adc_data_i2[5]),
        .R(adc_mode_r1));
  FDRE \adc_data_i2_reg[6] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_i2_r2[6]),
        .Q(adc_data_i2[6]),
        .R(adc_mode_r1));
  FDRE \adc_data_i2_reg[7] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_i2_r2[7]),
        .Q(adc_data_i2[7]),
        .R(adc_mode_r1));
  FDRE \adc_data_i2_reg[8] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_i2_r2[8]),
        .Q(adc_data_i2[8]),
        .R(adc_mode_r1));
  FDRE \adc_data_i2_reg[9] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_i2_r2[9]),
        .Q(adc_data_i2[9]),
        .R(adc_mode_r1));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_q1[0]_i_1 
       (.I0(rx_data_q_r1[0]),
        .I1(rx_data_q1_r2[0]),
        .I2(adc_mode_r1),
        .O(\adc_data_q1[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_q1[10]_i_1 
       (.I0(rx_data_q_r1[10]),
        .I1(rx_data_q1_r2[10]),
        .I2(adc_mode_r1),
        .O(\adc_data_q1[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_q1[11]_i_1 
       (.I0(rx_data_q_r1[11]),
        .I1(rx_data_q1_r2[11]),
        .I2(adc_mode_r1),
        .O(\adc_data_q1[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_q1[1]_i_1 
       (.I0(rx_data_q_r1[1]),
        .I1(rx_data_q1_r2[1]),
        .I2(adc_mode_r1),
        .O(\adc_data_q1[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_q1[2]_i_1 
       (.I0(rx_data_q_r1[2]),
        .I1(rx_data_q1_r2[2]),
        .I2(adc_mode_r1),
        .O(\adc_data_q1[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_q1[3]_i_1 
       (.I0(rx_data_q_r1[3]),
        .I1(rx_data_q1_r2[3]),
        .I2(adc_mode_r1),
        .O(\adc_data_q1[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_q1[4]_i_1 
       (.I0(rx_data_q_r1[4]),
        .I1(rx_data_q1_r2[4]),
        .I2(adc_mode_r1),
        .O(\adc_data_q1[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_q1[5]_i_1 
       (.I0(rx_data_q_r1[5]),
        .I1(rx_data_q1_r2[5]),
        .I2(adc_mode_r1),
        .O(\adc_data_q1[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_q1[6]_i_1 
       (.I0(rx_data_q_r1[6]),
        .I1(rx_data_q1_r2[6]),
        .I2(adc_mode_r1),
        .O(\adc_data_q1[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_q1[7]_i_1 
       (.I0(rx_data_q_r1[7]),
        .I1(rx_data_q1_r2[7]),
        .I2(adc_mode_r1),
        .O(\adc_data_q1[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_q1[8]_i_1 
       (.I0(rx_data_q_r1[8]),
        .I1(rx_data_q1_r2[8]),
        .I2(adc_mode_r1),
        .O(\adc_data_q1[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \adc_data_q1[9]_i_1 
       (.I0(rx_data_q_r1[9]),
        .I1(rx_data_q1_r2[9]),
        .I2(adc_mode_r1),
        .O(\adc_data_q1[9]_i_1_n_0 ));
  FDRE \adc_data_q1_reg[0] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_q1[0]_i_1_n_0 ),
        .Q(adc_data_q1[0]),
        .R(1'b0));
  FDRE \adc_data_q1_reg[10] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_q1[10]_i_1_n_0 ),
        .Q(adc_data_q1[10]),
        .R(1'b0));
  FDRE \adc_data_q1_reg[11] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_q1[11]_i_1_n_0 ),
        .Q(adc_data_q1[11]),
        .R(1'b0));
  FDRE \adc_data_q1_reg[1] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_q1[1]_i_1_n_0 ),
        .Q(adc_data_q1[1]),
        .R(1'b0));
  FDRE \adc_data_q1_reg[2] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_q1[2]_i_1_n_0 ),
        .Q(adc_data_q1[2]),
        .R(1'b0));
  FDRE \adc_data_q1_reg[3] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_q1[3]_i_1_n_0 ),
        .Q(adc_data_q1[3]),
        .R(1'b0));
  FDRE \adc_data_q1_reg[4] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_q1[4]_i_1_n_0 ),
        .Q(adc_data_q1[4]),
        .R(1'b0));
  FDRE \adc_data_q1_reg[5] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_q1[5]_i_1_n_0 ),
        .Q(adc_data_q1[5]),
        .R(1'b0));
  FDRE \adc_data_q1_reg[6] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_q1[6]_i_1_n_0 ),
        .Q(adc_data_q1[6]),
        .R(1'b0));
  FDRE \adc_data_q1_reg[7] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_q1[7]_i_1_n_0 ),
        .Q(adc_data_q1[7]),
        .R(1'b0));
  FDRE \adc_data_q1_reg[8] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_q1[8]_i_1_n_0 ),
        .Q(adc_data_q1[8]),
        .R(1'b0));
  FDRE \adc_data_q1_reg[9] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\adc_data_q1[9]_i_1_n_0 ),
        .Q(adc_data_q1[9]),
        .R(1'b0));
  FDRE \adc_data_q2_reg[0] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q2_r2[0]),
        .Q(adc_data_q2[0]),
        .R(adc_mode_r1));
  FDRE \adc_data_q2_reg[10] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q2_r2[10]),
        .Q(adc_data_q2[10]),
        .R(adc_mode_r1));
  FDRE \adc_data_q2_reg[11] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q2_r2[11]),
        .Q(adc_data_q2[11]),
        .R(adc_mode_r1));
  FDRE \adc_data_q2_reg[1] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q2_r2[1]),
        .Q(adc_data_q2[1]),
        .R(adc_mode_r1));
  FDRE \adc_data_q2_reg[2] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q2_r2[2]),
        .Q(adc_data_q2[2]),
        .R(adc_mode_r1));
  FDRE \adc_data_q2_reg[3] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q2_r2[3]),
        .Q(adc_data_q2[3]),
        .R(adc_mode_r1));
  FDRE \adc_data_q2_reg[4] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q2_r2[4]),
        .Q(adc_data_q2[4]),
        .R(adc_mode_r1));
  FDRE \adc_data_q2_reg[5] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q2_r2[5]),
        .Q(adc_data_q2[5]),
        .R(adc_mode_r1));
  FDRE \adc_data_q2_reg[6] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q2_r2[6]),
        .Q(adc_data_q2[6]),
        .R(adc_mode_r1));
  FDRE \adc_data_q2_reg[7] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q2_r2[7]),
        .Q(adc_data_q2[7]),
        .R(adc_mode_r1));
  FDRE \adc_data_q2_reg[8] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q2_r2[8]),
        .Q(adc_data_q2[8]),
        .R(adc_mode_r1));
  FDRE \adc_data_q2_reg[9] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q2_r2[9]),
        .Q(adc_data_q2[9]),
        .R(adc_mode_r1));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adc_status_i_1
       (.I0(rx_error_r1),
        .I1(adc_mode_r1),
        .I2(rx_error_r2),
        .O(adc_status_i_1_n_0));
  FDRE adc_status_reg
       (.C(data_clk),
        .CE(1'b1),
        .D(adc_status_i_1_n_0),
        .Q(adc_status),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    adc_valid_i_1
       (.I0(rx_valid_r1),
        .I1(adc_mode_r1),
        .I2(rx_valid_r2),
        .O(adc_valid_i_1_n_0));
  FDRE adc_valid_reg
       (.C(data_clk),
        .CE(1'b1),
        .D(adc_valid_i_1_n_0),
        .Q(adc_valid),
        .R(1'b0));
  (* srl_bus_name = "\inst/ap_rst_n_r_reg " *) 
  (* srl_name = "\inst/ap_rst_n_r_reg[14]_srl15 " *) 
  SRL16E \ap_rst_n_r_reg[14]_srl15 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(data_clk),
        .D(rst_n),
        .Q(\ap_rst_n_r_reg[14]_srl15_n_0 ));
  FDRE \ap_rst_n_r_reg[15] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\ap_rst_n_r_reg[14]_srl15_n_0 ),
        .Q(ap_rst_n),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[0].IBUFDS_rx_data_inst 
       (.I(rx_data_in_p[0]),
        .IB(rx_data_in_n[0]),
        .O(rx_data_ibuf_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \genblk1[0].IDDR_rx_frame_inst 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_idelay_0),
        .Q1(p_11_out),
        .Q2(rx_data_iddr_n[0]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("FALSE"),
    .IDELAY_TYPE("VAR_LOAD"),
    .IDELAY_VALUE(0),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \genblk1[0].IDELAYE2_rx_frame_inst 
       (.C(idelay_clk_200m),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(idly_d),
        .CNTVALUEOUT(\NLW_genblk1[0].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b1),
        .DATAOUT(rx_data_idelay_0),
        .IDATAIN(rx_data_ibuf_0),
        .INC(1'b0),
        .LD(idly_en[0]),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[1].IBUFDS_rx_data_inst 
       (.I(rx_data_in_p[1]),
        .IB(rx_data_in_n[1]),
        .O(rx_data_ibuf_1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \genblk1[1].IDDR_rx_frame_inst 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_idelay_1),
        .Q1(p_9_out),
        .Q2(rx_data_iddr_n[1]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("FALSE"),
    .IDELAY_TYPE("VAR_LOAD"),
    .IDELAY_VALUE(0),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \genblk1[1].IDELAYE2_rx_frame_inst 
       (.C(idelay_clk_200m),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(idly_d),
        .CNTVALUEOUT(\NLW_genblk1[1].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b1),
        .DATAOUT(rx_data_idelay_1),
        .IDATAIN(rx_data_ibuf_1),
        .INC(1'b0),
        .LD(idly_en[1]),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[2].IBUFDS_rx_data_inst 
       (.I(rx_data_in_p[2]),
        .IB(rx_data_in_n[2]),
        .O(rx_data_ibuf_2));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \genblk1[2].IDDR_rx_frame_inst 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_idelay_2),
        .Q1(p_7_out),
        .Q2(rx_data_iddr_n[2]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("FALSE"),
    .IDELAY_TYPE("VAR_LOAD"),
    .IDELAY_VALUE(0),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \genblk1[2].IDELAYE2_rx_frame_inst 
       (.C(idelay_clk_200m),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(idly_d),
        .CNTVALUEOUT(\NLW_genblk1[2].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b1),
        .DATAOUT(rx_data_idelay_2),
        .IDATAIN(rx_data_ibuf_2),
        .INC(1'b0),
        .LD(idly_en[2]),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[3].IBUFDS_rx_data_inst 
       (.I(rx_data_in_p[3]),
        .IB(rx_data_in_n[3]),
        .O(rx_data_ibuf_3));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \genblk1[3].IDDR_rx_frame_inst 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_idelay_3),
        .Q1(p_5_out),
        .Q2(rx_data_iddr_n[3]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("FALSE"),
    .IDELAY_TYPE("VAR_LOAD"),
    .IDELAY_VALUE(0),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \genblk1[3].IDELAYE2_rx_frame_inst 
       (.C(idelay_clk_200m),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(idly_d),
        .CNTVALUEOUT(\NLW_genblk1[3].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b1),
        .DATAOUT(rx_data_idelay_3),
        .IDATAIN(rx_data_ibuf_3),
        .INC(1'b0),
        .LD(idly_en[3]),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[4].IBUFDS_rx_data_inst 
       (.I(rx_data_in_p[4]),
        .IB(rx_data_in_n[4]),
        .O(rx_data_ibuf_4));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \genblk1[4].IDDR_rx_frame_inst 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_idelay_4),
        .Q1(p_3_out),
        .Q2(rx_data_iddr_n[4]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("FALSE"),
    .IDELAY_TYPE("VAR_LOAD"),
    .IDELAY_VALUE(0),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \genblk1[4].IDELAYE2_rx_frame_inst 
       (.C(idelay_clk_200m),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(idly_d),
        .CNTVALUEOUT(\NLW_genblk1[4].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b1),
        .DATAOUT(rx_data_idelay_4),
        .IDATAIN(rx_data_ibuf_4),
        .INC(1'b0),
        .LD(idly_en[4]),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \genblk1[5].IBUFDS_rx_data_inst 
       (.I(rx_data_in_p[5]),
        .IB(rx_data_in_n[5]),
        .O(rx_data_ibuf_5));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "TRUE" *) 
  IDDR #(
    .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \genblk1[5].IDDR_rx_frame_inst 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_idelay_5),
        .Q1(p_1_out),
        .Q2(rx_data_iddr_n[5]),
        .R(1'b0),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* SIM_DELAY_D = "0" *) 
  IDELAYE2 #(
    .CINVCTRL_SEL("FALSE"),
    .DELAY_SRC("IDATAIN"),
    .HIGH_PERFORMANCE_MODE("FALSE"),
    .IDELAY_TYPE("VAR_LOAD"),
    .IDELAY_VALUE(0),
    .IS_C_INVERTED(1'b0),
    .IS_DATAIN_INVERTED(1'b0),
    .IS_IDATAIN_INVERTED(1'b0),
    .PIPE_SEL("FALSE"),
    .REFCLK_FREQUENCY(200.000000),
    .SIGNAL_PATTERN("DATA")) 
    \genblk1[5].IDELAYE2_rx_frame_inst 
       (.C(idelay_clk_200m),
        .CE(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(idly_d),
        .CNTVALUEOUT(\NLW_genblk1[5].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED [4:0]),
        .DATAIN(1'b1),
        .DATAOUT(rx_data_idelay_5),
        .IDATAIN(rx_data_ibuf_5),
        .INC(1'b0),
        .LD(idly_en[5]),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \genblk2[0].OBUFDS_tx_data_inst 
       (.I(tx_data_out_0),
        .O(tx_data_out_p[0]),
        .OB(tx_data_out_n[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \genblk2[0].ODDR_tx_data_inst 
       (.C(data_clk),
        .CE(1'b1),
        .D1(\tx_data_p_reg_n_0_[0] ),
        .D2(\tx_data_n_reg_n_0_[0] ),
        .Q(tx_data_out_0),
        .R(\NLW_genblk2[0].ODDR_tx_data_inst_R_UNCONNECTED ),
        .S(\NLW_genblk2[0].ODDR_tx_data_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \genblk2[1].OBUFDS_tx_data_inst 
       (.I(tx_data_out_1),
        .O(tx_data_out_p[1]),
        .OB(tx_data_out_n[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \genblk2[1].ODDR_tx_data_inst 
       (.C(data_clk),
        .CE(1'b1),
        .D1(\tx_data_p_reg_n_0_[1] ),
        .D2(\tx_data_n_reg_n_0_[1] ),
        .Q(tx_data_out_1),
        .R(\NLW_genblk2[1].ODDR_tx_data_inst_R_UNCONNECTED ),
        .S(\NLW_genblk2[1].ODDR_tx_data_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \genblk2[2].OBUFDS_tx_data_inst 
       (.I(tx_data_out_2),
        .O(tx_data_out_p[2]),
        .OB(tx_data_out_n[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \genblk2[2].ODDR_tx_data_inst 
       (.C(data_clk),
        .CE(1'b1),
        .D1(\tx_data_p_reg_n_0_[2] ),
        .D2(\tx_data_n_reg_n_0_[2] ),
        .Q(tx_data_out_2),
        .R(\NLW_genblk2[2].ODDR_tx_data_inst_R_UNCONNECTED ),
        .S(\NLW_genblk2[2].ODDR_tx_data_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \genblk2[3].OBUFDS_tx_data_inst 
       (.I(tx_data_out_3),
        .O(tx_data_out_p[3]),
        .OB(tx_data_out_n[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \genblk2[3].ODDR_tx_data_inst 
       (.C(data_clk),
        .CE(1'b1),
        .D1(\tx_data_p_reg_n_0_[3] ),
        .D2(\tx_data_n_reg_n_0_[3] ),
        .Q(tx_data_out_3),
        .R(\NLW_genblk2[3].ODDR_tx_data_inst_R_UNCONNECTED ),
        .S(\NLW_genblk2[3].ODDR_tx_data_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \genblk2[4].OBUFDS_tx_data_inst 
       (.I(tx_data_out_4),
        .O(tx_data_out_p[4]),
        .OB(tx_data_out_n[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \genblk2[4].ODDR_tx_data_inst 
       (.C(data_clk),
        .CE(1'b1),
        .D1(\tx_data_p_reg_n_0_[4] ),
        .D2(\tx_data_n_reg_n_0_[4] ),
        .Q(tx_data_out_4),
        .R(\NLW_genblk2[4].ODDR_tx_data_inst_R_UNCONNECTED ),
        .S(\NLW_genblk2[4].ODDR_tx_data_inst_S_UNCONNECTED ));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    \genblk2[5].OBUFDS_tx_data_inst 
       (.I(tx_data_out_5),
        .O(tx_data_out_p[5]),
        .OB(tx_data_out_n[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO" *) 
  (* __SRVAL = "TRUE" *) 
  ODDR #(
    .DDR_CLK_EDGE("SAME_EDGE"),
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D1_INVERTED(1'b0),
    .IS_D2_INVERTED(1'b0),
    .SRTYPE("SYNC")) 
    \genblk2[5].ODDR_tx_data_inst 
       (.C(data_clk),
        .CE(1'b1),
        .D1(\tx_data_p_reg_n_0_[5] ),
        .D2(\tx_data_n_reg_n_0_[5] ),
        .Q(tx_data_out_5),
        .R(\NLW_genblk2[5].ODDR_tx_data_inst_R_UNCONNECTED ),
        .S(\NLW_genblk2[5].ODDR_tx_data_inst_S_UNCONNECTED ));
  LUT4 #(
    .INIT(16'h8000)) 
    rx_data_i1_r2
       (.I0(rx_frame_shift[3]),
        .I1(rx_frame_shift[2]),
        .I2(rx_frame_shift[0]),
        .I3(rx_frame_shift[1]),
        .O(rx_data_q1_r2_1));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i1_r2_reg[0] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[6]),
        .Q(rx_data_i1_r2__0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i1_r2_reg[10] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[22]),
        .Q(rx_data_i1_r2__0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i1_r2_reg[11] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[23]),
        .Q(rx_data_i1_r2__0[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i1_r2_reg[1] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[7]),
        .Q(rx_data_i1_r2__0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i1_r2_reg[2] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[8]),
        .Q(rx_data_i1_r2__0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i1_r2_reg[3] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[9]),
        .Q(rx_data_i1_r2__0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i1_r2_reg[4] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[10]),
        .Q(rx_data_i1_r2__0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i1_r2_reg[5] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[11]),
        .Q(rx_data_i1_r2__0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i1_r2_reg[6] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[18]),
        .Q(rx_data_i1_r2__0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i1_r2_reg[7] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[19]),
        .Q(rx_data_i1_r2__0[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i1_r2_reg[8] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[20]),
        .Q(rx_data_i1_r2__0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i1_r2_reg[9] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[21]),
        .Q(rx_data_i1_r2__0[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0001)) 
    \rx_data_i2_r2[11]_i_1 
       (.I0(rx_frame_shift[3]),
        .I1(rx_frame_shift[2]),
        .I2(rx_frame_shift[0]),
        .I3(rx_frame_shift[1]),
        .O(rx_data_q2_r2_0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i2_r2_reg[0] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[6]),
        .Q(rx_data_i2_r2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i2_r2_reg[10] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[22]),
        .Q(rx_data_i2_r2[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i2_r2_reg[11] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[23]),
        .Q(rx_data_i2_r2[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i2_r2_reg[1] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[7]),
        .Q(rx_data_i2_r2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i2_r2_reg[2] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[8]),
        .Q(rx_data_i2_r2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i2_r2_reg[3] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[9]),
        .Q(rx_data_i2_r2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i2_r2_reg[4] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[10]),
        .Q(rx_data_i2_r2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i2_r2_reg[5] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[11]),
        .Q(rx_data_i2_r2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i2_r2_reg[6] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[18]),
        .Q(rx_data_i2_r2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i2_r2_reg[7] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[19]),
        .Q(rx_data_i2_r2[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i2_r2_reg[8] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[20]),
        .Q(rx_data_i2_r2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i2_r2_reg[9] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[21]),
        .Q(rx_data_i2_r2[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h1000)) 
    \rx_data_i_r1[11]_i_1 
       (.I0(rx_frame_shift[0]),
        .I1(rx_frame_shift[1]),
        .I2(rx_frame_shift[3]),
        .I3(rx_frame_shift[2]),
        .O(rx_data_q_r1_2));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i_r1_reg[0] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[6]),
        .Q(rx_data_i_r1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i_r1_reg[10] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[22]),
        .Q(rx_data_i_r1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i_r1_reg[11] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[23]),
        .Q(rx_data_i_r1[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i_r1_reg[1] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[7]),
        .Q(rx_data_i_r1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i_r1_reg[2] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[8]),
        .Q(rx_data_i_r1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i_r1_reg[3] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[9]),
        .Q(rx_data_i_r1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i_r1_reg[4] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[10]),
        .Q(rx_data_i_r1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i_r1_reg[5] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[11]),
        .Q(rx_data_i_r1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i_r1_reg[6] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[18]),
        .Q(rx_data_i_r1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i_r1_reg[7] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[19]),
        .Q(rx_data_i_r1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i_r1_reg[8] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[20]),
        .Q(rx_data_i_r1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_i_r1_reg[9] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[21]),
        .Q(rx_data_i_r1[9]),
        .R(1'b0));
  FDRE \rx_data_iddr_n_dly_reg[0] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_iddr_n[0]),
        .Q(rx_data_iddr_n_dly[0]),
        .R(1'b0));
  FDRE \rx_data_iddr_n_dly_reg[1] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_iddr_n[1]),
        .Q(rx_data_iddr_n_dly[1]),
        .R(1'b0));
  FDRE \rx_data_iddr_n_dly_reg[2] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_iddr_n[2]),
        .Q(rx_data_iddr_n_dly[2]),
        .R(1'b0));
  FDRE \rx_data_iddr_n_dly_reg[3] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_iddr_n[3]),
        .Q(rx_data_iddr_n_dly[3]),
        .R(1'b0));
  FDRE \rx_data_iddr_n_dly_reg[4] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_iddr_n[4]),
        .Q(rx_data_iddr_n_dly[4]),
        .R(1'b0));
  FDRE \rx_data_iddr_n_dly_reg[5] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_iddr_n[5]),
        .Q(rx_data_iddr_n_dly[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q1_r2_reg[0] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[0]),
        .Q(rx_data_q1_r2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q1_r2_reg[10] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[16]),
        .Q(rx_data_q1_r2[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q1_r2_reg[11] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[17]),
        .Q(rx_data_q1_r2[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q1_r2_reg[1] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[1]),
        .Q(rx_data_q1_r2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q1_r2_reg[2] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[2]),
        .Q(rx_data_q1_r2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q1_r2_reg[3] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[3]),
        .Q(rx_data_q1_r2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q1_r2_reg[4] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[4]),
        .Q(rx_data_q1_r2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q1_r2_reg[5] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[5]),
        .Q(rx_data_q1_r2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q1_r2_reg[6] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[12]),
        .Q(rx_data_q1_r2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q1_r2_reg[7] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[13]),
        .Q(rx_data_q1_r2[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q1_r2_reg[8] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[14]),
        .Q(rx_data_q1_r2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q1_r2_reg[9] 
       (.C(data_clk),
        .CE(rx_data_q1_r2_1),
        .D(rx_data_shift[15]),
        .Q(rx_data_q1_r2[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q2_r2_reg[0] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[0]),
        .Q(rx_data_q2_r2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q2_r2_reg[10] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[16]),
        .Q(rx_data_q2_r2[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q2_r2_reg[11] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[17]),
        .Q(rx_data_q2_r2[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q2_r2_reg[1] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[1]),
        .Q(rx_data_q2_r2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q2_r2_reg[2] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[2]),
        .Q(rx_data_q2_r2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q2_r2_reg[3] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[3]),
        .Q(rx_data_q2_r2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q2_r2_reg[4] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[4]),
        .Q(rx_data_q2_r2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q2_r2_reg[5] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[5]),
        .Q(rx_data_q2_r2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q2_r2_reg[6] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[12]),
        .Q(rx_data_q2_r2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q2_r2_reg[7] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[13]),
        .Q(rx_data_q2_r2[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q2_r2_reg[8] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[14]),
        .Q(rx_data_q2_r2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q2_r2_reg[9] 
       (.C(data_clk),
        .CE(rx_data_q2_r2_0),
        .D(rx_data_shift[15]),
        .Q(rx_data_q2_r2[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q_r1_reg[0] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[0]),
        .Q(rx_data_q_r1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q_r1_reg[10] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[16]),
        .Q(rx_data_q_r1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q_r1_reg[11] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[17]),
        .Q(rx_data_q_r1[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q_r1_reg[1] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[1]),
        .Q(rx_data_q_r1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q_r1_reg[2] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[2]),
        .Q(rx_data_q_r1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q_r1_reg[3] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[3]),
        .Q(rx_data_q_r1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q_r1_reg[4] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[4]),
        .Q(rx_data_q_r1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q_r1_reg[5] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[5]),
        .Q(rx_data_q_r1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q_r1_reg[6] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[12]),
        .Q(rx_data_q_r1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q_r1_reg[7] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[13]),
        .Q(rx_data_q_r1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q_r1_reg[8] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[14]),
        .Q(rx_data_q_r1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_q_r1_reg[9] 
       (.C(data_clk),
        .CE(rx_data_q_r1_2),
        .D(rx_data_shift[15]),
        .Q(rx_data_q_r1[9]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[0] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_iddr_n_dly[0]),
        .Q(rx_data_shift[0]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[10] 
       (.C(data_clk),
        .CE(1'b1),
        .D(p_3_out),
        .Q(rx_data_shift[10]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[11] 
       (.C(data_clk),
        .CE(1'b1),
        .D(p_1_out),
        .Q(rx_data_shift[11]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[12] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_shift[0]),
        .Q(rx_data_shift[12]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[13] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_shift[1]),
        .Q(rx_data_shift[13]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[14] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_shift[2]),
        .Q(rx_data_shift[14]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[15] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_shift[3]),
        .Q(rx_data_shift[15]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[16] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_shift[4]),
        .Q(rx_data_shift[16]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[17] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_shift[5]),
        .Q(rx_data_shift[17]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[18] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_shift[6]),
        .Q(rx_data_shift[18]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[19] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_shift[7]),
        .Q(rx_data_shift[19]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[1] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_iddr_n_dly[1]),
        .Q(rx_data_shift[1]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[20] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_shift[8]),
        .Q(rx_data_shift[20]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[21] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_shift[9]),
        .Q(rx_data_shift[21]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[22] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_shift[10]),
        .Q(rx_data_shift[22]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[23] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_shift[11]),
        .Q(rx_data_shift[23]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[2] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_iddr_n_dly[2]),
        .Q(rx_data_shift[2]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[3] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_iddr_n_dly[3]),
        .Q(rx_data_shift[3]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[4] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_iddr_n_dly[4]),
        .Q(rx_data_shift[4]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[5] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_iddr_n_dly[5]),
        .Q(rx_data_shift[5]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[6] 
       (.C(data_clk),
        .CE(1'b1),
        .D(p_11_out),
        .Q(rx_data_shift[6]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[7] 
       (.C(data_clk),
        .CE(1'b1),
        .D(p_9_out),
        .Q(rx_data_shift[7]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[8] 
       (.C(data_clk),
        .CE(1'b1),
        .D(p_7_out),
        .Q(rx_data_shift[8]),
        .R(1'b0));
  FDRE \rx_data_shift_reg[9] 
       (.C(data_clk),
        .CE(1'b1),
        .D(p_5_out),
        .Q(rx_data_shift[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFDBF)) 
    rx_error_r1_i_1
       (.I0(rx_frame_shift[0]),
        .I1(rx_frame_shift[2]),
        .I2(rx_frame_shift[3]),
        .I3(rx_frame_shift[1]),
        .O(rx_error_r1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_error_r1_reg
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_error_r1_i_1_n_0),
        .Q(rx_error_r1),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    rx_error_r2_i_1
       (.I0(rx_frame_shift[3]),
        .I1(rx_frame_shift[2]),
        .I2(rx_frame_shift[0]),
        .I3(rx_frame_shift[1]),
        .O(rx_error_r2_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_error_r2_reg
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_error_r2_i_1_n_0),
        .Q(rx_error_r2),
        .R(1'b0));
  FDRE rx_frame_iddr_n_dly_reg
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_frame_iddr_n),
        .Q(rx_frame_iddr_n_dly),
        .R(1'b0));
  FDRE \rx_frame_shift_reg[0] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_frame_iddr_n_dly),
        .Q(rx_frame_shift[0]),
        .R(1'b0));
  FDRE \rx_frame_shift_reg[1] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_frame_iddr_p),
        .Q(rx_frame_shift[1]),
        .R(1'b0));
  FDRE \rx_frame_shift_reg[2] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_frame_shift[0]),
        .Q(rx_frame_shift[2]),
        .R(1'b0));
  FDRE \rx_frame_shift_reg[3] 
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_frame_shift[1]),
        .Q(rx_frame_shift[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    rx_valid_r1_reg
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q_r1_2),
        .Q(rx_valid_r1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    rx_valid_r2_reg
       (.C(data_clk),
        .CE(1'b1),
        .D(rx_data_q2_r2_0),
        .Q(rx_valid_r2),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \tx_data_cnt[0]_i_1 
       (.I0(tx_data_sel),
        .I1(tx_data_cnt[0]),
        .O(\tx_data_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h52F0)) 
    \tx_data_cnt[1]_i_1 
       (.I0(tx_data_sel),
        .I1(dac_mode_r1),
        .I2(tx_data_cnt[1]),
        .I3(tx_data_cnt[0]),
        .O(\tx_data_cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hEAAEEEEE)) 
    tx_data_cnt_flag_i_1
       (.I0(dac_valid),
        .I1(tx_data_sel),
        .I2(dac_mode_r1),
        .I3(tx_data_cnt[1]),
        .I4(tx_data_cnt[0]),
        .O(tx_data_cnt_flag_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tx_data_cnt_flag_reg
       (.C(data_clk),
        .CE(1'b1),
        .D(tx_data_cnt_flag_i_1_n_0),
        .Q(tx_data_sel),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_cnt_reg[0] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_cnt[0]_i_1_n_0 ),
        .Q(tx_data_cnt[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_cnt_reg[1] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_cnt[1]_i_1_n_0 ),
        .Q(tx_data_cnt[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i1_d_reg[0] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i1[0]),
        .Q(\tx_data_i1_d_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i1_d_reg[10] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i1[10]),
        .Q(data0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i1_d_reg[11] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i1[11]),
        .Q(data0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i1_d_reg[1] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i1[1]),
        .Q(\tx_data_i1_d_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i1_d_reg[2] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i1[2]),
        .Q(\tx_data_i1_d_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i1_d_reg[3] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i1[3]),
        .Q(\tx_data_i1_d_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i1_d_reg[4] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i1[4]),
        .Q(\tx_data_i1_d_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i1_d_reg[5] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i1[5]),
        .Q(\tx_data_i1_d_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i1_d_reg[6] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i1[6]),
        .Q(data0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i1_d_reg[7] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i1[7]),
        .Q(data0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i1_d_reg[8] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i1[8]),
        .Q(data0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i1_d_reg[9] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i1[9]),
        .Q(data0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i2_d_reg[0] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i2[0]),
        .Q(\tx_data_i2_d_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i2_d_reg[10] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i2[10]),
        .Q(data2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i2_d_reg[11] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i2[11]),
        .Q(data2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i2_d_reg[1] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i2[1]),
        .Q(\tx_data_i2_d_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i2_d_reg[2] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i2[2]),
        .Q(\tx_data_i2_d_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i2_d_reg[3] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i2[3]),
        .Q(\tx_data_i2_d_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i2_d_reg[4] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i2[4]),
        .Q(\tx_data_i2_d_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i2_d_reg[5] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i2[5]),
        .Q(\tx_data_i2_d_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i2_d_reg[6] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i2[6]),
        .Q(data2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i2_d_reg[7] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i2[7]),
        .Q(data2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i2_d_reg[8] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i2[8]),
        .Q(data2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_i2_d_reg[9] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_i2[9]),
        .Q(data2[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \tx_data_n[0]_i_1 
       (.I0(tx_data_q2_d[0]),
        .I1(tx_data_q1_d[0]),
        .I2(tx_data_cnt[0]),
        .I3(tx_data_q2_d[6]),
        .I4(tx_data_cnt[1]),
        .I5(tx_data_q1_d[6]),
        .O(\tx_data_n[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \tx_data_n[1]_i_1 
       (.I0(tx_data_q2_d[1]),
        .I1(tx_data_q1_d[1]),
        .I2(tx_data_cnt[0]),
        .I3(tx_data_q2_d[7]),
        .I4(tx_data_cnt[1]),
        .I5(tx_data_q1_d[7]),
        .O(\tx_data_n[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \tx_data_n[2]_i_1 
       (.I0(tx_data_q2_d[2]),
        .I1(tx_data_q1_d[2]),
        .I2(tx_data_cnt[0]),
        .I3(tx_data_q2_d[8]),
        .I4(tx_data_cnt[1]),
        .I5(tx_data_q1_d[8]),
        .O(\tx_data_n[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \tx_data_n[3]_i_1 
       (.I0(tx_data_q2_d[3]),
        .I1(tx_data_q1_d[3]),
        .I2(tx_data_cnt[0]),
        .I3(tx_data_q2_d[9]),
        .I4(tx_data_cnt[1]),
        .I5(tx_data_q1_d[9]),
        .O(\tx_data_n[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \tx_data_n[4]_i_1 
       (.I0(tx_data_q2_d[4]),
        .I1(tx_data_q1_d[4]),
        .I2(tx_data_cnt[0]),
        .I3(tx_data_q2_d[10]),
        .I4(tx_data_cnt[1]),
        .I5(tx_data_q1_d[10]),
        .O(\tx_data_n[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \tx_data_n[5]_i_1 
       (.I0(tx_data_q2_d[5]),
        .I1(tx_data_q1_d[5]),
        .I2(tx_data_cnt[0]),
        .I3(tx_data_q2_d[11]),
        .I4(tx_data_cnt[1]),
        .I5(tx_data_q1_d[11]),
        .O(\tx_data_n[5]_i_1_n_0 ));
  FDRE \tx_data_n_reg[0] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_n[0]_i_1_n_0 ),
        .Q(\tx_data_n_reg_n_0_[0] ),
        .R(\tx_data_p[5]_i_1_n_0 ));
  FDRE \tx_data_n_reg[1] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_n[1]_i_1_n_0 ),
        .Q(\tx_data_n_reg_n_0_[1] ),
        .R(\tx_data_p[5]_i_1_n_0 ));
  FDRE \tx_data_n_reg[2] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_n[2]_i_1_n_0 ),
        .Q(\tx_data_n_reg_n_0_[2] ),
        .R(\tx_data_p[5]_i_1_n_0 ));
  FDRE \tx_data_n_reg[3] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_n[3]_i_1_n_0 ),
        .Q(\tx_data_n_reg_n_0_[3] ),
        .R(\tx_data_p[5]_i_1_n_0 ));
  FDRE \tx_data_n_reg[4] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_n[4]_i_1_n_0 ),
        .Q(\tx_data_n_reg_n_0_[4] ),
        .R(\tx_data_p[5]_i_1_n_0 ));
  FDRE \tx_data_n_reg[5] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_n[5]_i_1_n_0 ),
        .Q(\tx_data_n_reg_n_0_[5] ),
        .R(\tx_data_p[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \tx_data_p[0]_i_1 
       (.I0(\tx_data_i2_d_reg_n_0_[0] ),
        .I1(\tx_data_i1_d_reg_n_0_[0] ),
        .I2(tx_data_cnt[0]),
        .I3(data2[0]),
        .I4(tx_data_cnt[1]),
        .I5(data0[0]),
        .O(\tx_data_p[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \tx_data_p[1]_i_1 
       (.I0(\tx_data_i2_d_reg_n_0_[1] ),
        .I1(\tx_data_i1_d_reg_n_0_[1] ),
        .I2(tx_data_cnt[0]),
        .I3(data2[1]),
        .I4(tx_data_cnt[1]),
        .I5(data0[1]),
        .O(\tx_data_p[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \tx_data_p[2]_i_1 
       (.I0(\tx_data_i2_d_reg_n_0_[2] ),
        .I1(\tx_data_i1_d_reg_n_0_[2] ),
        .I2(tx_data_cnt[0]),
        .I3(data2[2]),
        .I4(tx_data_cnt[1]),
        .I5(data0[2]),
        .O(\tx_data_p[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \tx_data_p[3]_i_1 
       (.I0(\tx_data_i2_d_reg_n_0_[3] ),
        .I1(\tx_data_i1_d_reg_n_0_[3] ),
        .I2(tx_data_cnt[0]),
        .I3(data2[3]),
        .I4(tx_data_cnt[1]),
        .I5(data0[3]),
        .O(\tx_data_p[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \tx_data_p[4]_i_1 
       (.I0(\tx_data_i2_d_reg_n_0_[4] ),
        .I1(\tx_data_i1_d_reg_n_0_[4] ),
        .I2(tx_data_cnt[0]),
        .I3(data2[4]),
        .I4(tx_data_cnt[1]),
        .I5(data0[4]),
        .O(\tx_data_p[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hD5)) 
    \tx_data_p[5]_i_1 
       (.I0(tx_data_sel),
        .I1(dac_mode_r1),
        .I2(tx_data_cnt[1]),
        .O(\tx_data_p[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \tx_data_p[5]_i_2 
       (.I0(\tx_data_i2_d_reg_n_0_[5] ),
        .I1(\tx_data_i1_d_reg_n_0_[5] ),
        .I2(tx_data_cnt[0]),
        .I3(data2[5]),
        .I4(tx_data_cnt[1]),
        .I5(data0[5]),
        .O(\tx_data_p[5]_i_2_n_0 ));
  FDRE \tx_data_p_reg[0] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_p[0]_i_1_n_0 ),
        .Q(\tx_data_p_reg_n_0_[0] ),
        .R(\tx_data_p[5]_i_1_n_0 ));
  FDRE \tx_data_p_reg[1] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_p[1]_i_1_n_0 ),
        .Q(\tx_data_p_reg_n_0_[1] ),
        .R(\tx_data_p[5]_i_1_n_0 ));
  FDRE \tx_data_p_reg[2] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_p[2]_i_1_n_0 ),
        .Q(\tx_data_p_reg_n_0_[2] ),
        .R(\tx_data_p[5]_i_1_n_0 ));
  FDRE \tx_data_p_reg[3] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_p[3]_i_1_n_0 ),
        .Q(\tx_data_p_reg_n_0_[3] ),
        .R(\tx_data_p[5]_i_1_n_0 ));
  FDRE \tx_data_p_reg[4] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_p[4]_i_1_n_0 ),
        .Q(\tx_data_p_reg_n_0_[4] ),
        .R(\tx_data_p[5]_i_1_n_0 ));
  FDRE \tx_data_p_reg[5] 
       (.C(data_clk),
        .CE(1'b1),
        .D(\tx_data_p[5]_i_2_n_0 ),
        .Q(\tx_data_p_reg_n_0_[5] ),
        .R(\tx_data_p[5]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q1_d_reg[0] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q1[0]),
        .Q(tx_data_q1_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q1_d_reg[10] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q1[10]),
        .Q(tx_data_q1_d[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q1_d_reg[11] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q1[11]),
        .Q(tx_data_q1_d[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q1_d_reg[1] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q1[1]),
        .Q(tx_data_q1_d[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q1_d_reg[2] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q1[2]),
        .Q(tx_data_q1_d[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q1_d_reg[3] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q1[3]),
        .Q(tx_data_q1_d[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q1_d_reg[4] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q1[4]),
        .Q(tx_data_q1_d[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q1_d_reg[5] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q1[5]),
        .Q(tx_data_q1_d[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q1_d_reg[6] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q1[6]),
        .Q(tx_data_q1_d[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q1_d_reg[7] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q1[7]),
        .Q(tx_data_q1_d[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q1_d_reg[8] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q1[8]),
        .Q(tx_data_q1_d[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q1_d_reg[9] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q1[9]),
        .Q(tx_data_q1_d[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q2_d_reg[0] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q2[0]),
        .Q(tx_data_q2_d[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q2_d_reg[10] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q2[10]),
        .Q(tx_data_q2_d[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q2_d_reg[11] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q2[11]),
        .Q(tx_data_q2_d[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q2_d_reg[1] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q2[1]),
        .Q(tx_data_q2_d[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q2_d_reg[2] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q2[2]),
        .Q(tx_data_q2_d[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q2_d_reg[3] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q2[3]),
        .Q(tx_data_q2_d[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q2_d_reg[4] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q2[4]),
        .Q(tx_data_q2_d[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q2_d_reg[5] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q2[5]),
        .Q(tx_data_q2_d[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q2_d_reg[6] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q2[6]),
        .Q(tx_data_q2_d[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q2_d_reg[7] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q2[7]),
        .Q(tx_data_q2_d[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q2_d_reg[8] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q2[8]),
        .Q(tx_data_q2_d[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tx_data_q2_d_reg[9] 
       (.C(data_clk),
        .CE(dac_valid),
        .D(dac_data_q2[9]),
        .Q(tx_data_q2_d[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0070)) 
    tx_frame_i_1
       (.I0(dac_mode_r1),
        .I1(tx_data_cnt[0]),
        .I2(tx_data_sel),
        .I3(tx_data_cnt[1]),
        .O(tx_frame_i_1_n_0));
  FDRE tx_frame_reg
       (.C(data_clk),
        .CE(1'b1),
        .D(tx_frame_i_1_n_0),
        .Q(tx_frame),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_ad9361_if_idelay_0_0,ad9361_if_idelay,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "package_project" *) 
(* X_CORE_INFO = "ad9361_if_idelay,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (idelay_clk_200m,
    rst_n,
    data_clk,
    ap_rst_n,
    rx_clk_in_p,
    rx_clk_in_n,
    rx_data_in_p,
    rx_data_in_n,
    rx_frame_in_p,
    rx_frame_in_n,
    tx_clk_out_p,
    tx_clk_out_n,
    tx_frame_out_p,
    tx_frame_out_n,
    tx_data_out_p,
    tx_data_out_n,
    adc_valid,
    adc_data_i1,
    adc_data_q1,
    adc_data_i2,
    adc_data_q2,
    adc_status,
    dac_valid,
    dac_data_i1,
    dac_data_q1,
    dac_data_i2,
    dac_data_q2,
    idly_en,
    idly_d,
    data_clk_ce,
    adc_mode_r1,
    dac_mode_r1);
  input idelay_clk_200m;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 data_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME data_clk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_ad9361_if_idelay_0_0_data_clk, INSERT_VIP 0" *) output data_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output ap_rst_n;
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

  wire [11:0]adc_data_i1;
  wire [11:0]adc_data_i2;
  wire [11:0]adc_data_q1;
  wire [11:0]adc_data_q2;
  wire adc_mode_r1;
  wire adc_status;
  wire adc_valid;
  wire ap_rst_n;
  wire [11:0]dac_data_i1;
  wire [11:0]dac_data_i2;
  wire [11:0]dac_data_q1;
  wire [11:0]dac_data_q2;
  wire dac_mode_r1;
  wire dac_valid;
  wire data_clk;
  wire data_clk_ce;
  wire idelay_clk_200m;
  wire [4:0]idly_d;
  wire [6:0]idly_en;
  wire rst_n;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire rx_clk_in_n;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire rx_clk_in_p;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire [5:0]rx_data_in_n;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire [5:0]rx_data_in_p;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire rx_frame_in_n;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire rx_frame_in_p;
  (* SLEW = "SLOW" *) wire tx_clk_out_n;
  (* SLEW = "SLOW" *) wire tx_clk_out_p;
  (* SLEW = "SLOW" *) wire [5:0]tx_data_out_n;
  (* SLEW = "SLOW" *) wire [5:0]tx_data_out_p;
  (* SLEW = "SLOW" *) wire tx_frame_out_n;
  (* SLEW = "SLOW" *) wire tx_frame_out_p;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ad9361_if_idelay inst
       (.adc_data_i1(adc_data_i1),
        .adc_data_i2(adc_data_i2),
        .adc_data_q1(adc_data_q1),
        .adc_data_q2(adc_data_q2),
        .adc_mode_r1(adc_mode_r1),
        .adc_status(adc_status),
        .adc_valid(adc_valid),
        .ap_rst_n(ap_rst_n),
        .dac_data_i1(dac_data_i1),
        .dac_data_i2(dac_data_i2),
        .dac_data_q1(dac_data_q1),
        .dac_data_q2(dac_data_q2),
        .dac_mode_r1(dac_mode_r1),
        .dac_valid(dac_valid),
        .data_clk(data_clk),
        .data_clk_ce(data_clk_ce),
        .idelay_clk_200m(idelay_clk_200m),
        .idly_d(idly_d),
        .idly_en(idly_en),
        .rst_n(rst_n),
        .rx_clk_in_n(rx_clk_in_n),
        .rx_clk_in_p(rx_clk_in_p),
        .rx_data_in_n(rx_data_in_n),
        .rx_data_in_p(rx_data_in_p),
        .rx_frame_in_n(rx_frame_in_n),
        .rx_frame_in_p(rx_frame_in_p),
        .tx_clk_out_n(tx_clk_out_n),
        .tx_clk_out_p(tx_clk_out_p),
        .tx_data_out_n(tx_data_out_n),
        .tx_data_out_p(tx_data_out_p),
        .tx_frame_out_n(tx_frame_out_n),
        .tx_frame_out_p(tx_frame_out_p));
endmodule
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
