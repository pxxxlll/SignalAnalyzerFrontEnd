-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Mon Aug 28 11:51:01 2023
-- Host        : MJ_FPGA running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/12_RFMU/RFMU_v0_5_3/soc_prj/zed_9361/zed_9361.srcs/sources_1/bd/design_1/ip/design_1_ad9361_if_idelay_0_0/design_1_ad9361_if_idelay_0_0_sim_netlist.vhdl
-- Design      : design_1_ad9361_if_idelay_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ad9361_if_idelay_0_0_ad9361_if_idelay is
  port (
    data_clk : out STD_LOGIC;
    ap_rst_n : out STD_LOGIC;
    tx_frame_out_p : out STD_LOGIC;
    tx_frame_out_n : out STD_LOGIC;
    tx_clk_out_p : out STD_LOGIC;
    tx_clk_out_n : out STD_LOGIC;
    tx_data_out_p : out STD_LOGIC_VECTOR ( 5 downto 0 );
    tx_data_out_n : out STD_LOGIC_VECTOR ( 5 downto 0 );
    adc_valid : out STD_LOGIC;
    adc_data_i1 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    adc_data_q1 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    adc_data_i2 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    adc_data_q2 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    adc_status : out STD_LOGIC;
    rst_n : in STD_LOGIC;
    dac_mode_r1 : in STD_LOGIC;
    rx_clk_in_p : in STD_LOGIC;
    rx_clk_in_n : in STD_LOGIC;
    data_clk_ce : in STD_LOGIC;
    rx_frame_in_p : in STD_LOGIC;
    rx_frame_in_n : in STD_LOGIC;
    idelay_clk_200m : in STD_LOGIC;
    idly_en : in STD_LOGIC_VECTOR ( 6 downto 0 );
    idly_d : in STD_LOGIC_VECTOR ( 4 downto 0 );
    rx_data_in_p : in STD_LOGIC_VECTOR ( 5 downto 0 );
    rx_data_in_n : in STD_LOGIC_VECTOR ( 5 downto 0 );
    adc_mode_r1 : in STD_LOGIC;
    dac_valid : in STD_LOGIC;
    dac_data_i1 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dac_data_i2 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dac_data_q1 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dac_data_q2 : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_ad9361_if_idelay_0_0_ad9361_if_idelay : entity is "ad9361_if_idelay";
end design_1_ad9361_if_idelay_0_0_ad9361_if_idelay;

architecture STRUCTURE of design_1_ad9361_if_idelay_0_0_ad9361_if_idelay is
  signal \adc_data_i1[0]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_i1[10]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_i1[11]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_i1[1]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_i1[2]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_i1[3]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_i1[4]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_i1[5]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_i1[6]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_i1[7]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_i1[8]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_i1[9]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_q1[0]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_q1[10]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_q1[11]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_q1[1]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_q1[2]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_q1[3]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_q1[4]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_q1[5]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_q1[6]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_q1[7]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_q1[8]_i_1_n_0\ : STD_LOGIC;
  signal \adc_data_q1[9]_i_1_n_0\ : STD_LOGIC;
  signal adc_status_i_1_n_0 : STD_LOGIC;
  signal adc_valid_i_1_n_0 : STD_LOGIC;
  signal \ap_rst_n_r_reg[14]_srl15_n_0\ : STD_LOGIC;
  signal data0 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal data2 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \^data_clk\ : STD_LOGIC;
  signal data_clk_ibuf : STD_LOGIC;
  signal p_0_out : STD_LOGIC;
  signal p_11_out : STD_LOGIC;
  signal p_1_out : STD_LOGIC;
  signal p_3_out : STD_LOGIC;
  signal p_5_out : STD_LOGIC;
  signal p_7_out : STD_LOGIC;
  signal p_9_out : STD_LOGIC;
  signal \rx_data_i1_r2__0\ : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal rx_data_i2_r2 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal rx_data_i_r1 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal rx_data_ibuf_0 : STD_LOGIC;
  signal rx_data_ibuf_1 : STD_LOGIC;
  signal rx_data_ibuf_2 : STD_LOGIC;
  signal rx_data_ibuf_3 : STD_LOGIC;
  signal rx_data_ibuf_4 : STD_LOGIC;
  signal rx_data_ibuf_5 : STD_LOGIC;
  signal rx_data_iddr_n : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal rx_data_iddr_n_dly : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal rx_data_idelay_0 : STD_LOGIC;
  signal rx_data_idelay_1 : STD_LOGIC;
  signal rx_data_idelay_2 : STD_LOGIC;
  signal rx_data_idelay_3 : STD_LOGIC;
  signal rx_data_idelay_4 : STD_LOGIC;
  signal rx_data_idelay_5 : STD_LOGIC;
  signal rx_data_q1_r2 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal rx_data_q1_r2_1 : STD_LOGIC;
  signal rx_data_q2_r2 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal rx_data_q2_r2_0 : STD_LOGIC;
  signal rx_data_q_r1 : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal rx_data_q_r1_2 : STD_LOGIC;
  signal rx_data_shift : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal rx_error_r1 : STD_LOGIC;
  signal rx_error_r1_i_1_n_0 : STD_LOGIC;
  signal rx_error_r2 : STD_LOGIC;
  signal rx_error_r2_i_1_n_0 : STD_LOGIC;
  signal rx_frame_ibuf : STD_LOGIC;
  signal rx_frame_iddr_n : STD_LOGIC;
  signal rx_frame_iddr_n_dly : STD_LOGIC;
  signal rx_frame_iddr_p : STD_LOGIC;
  signal rx_frame_idelay : STD_LOGIC;
  signal rx_frame_shift : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal rx_valid_r1 : STD_LOGIC;
  signal rx_valid_r2 : STD_LOGIC;
  signal tx_clk : STD_LOGIC;
  signal tx_data_cnt : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \tx_data_cnt[0]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_cnt[1]_i_1_n_0\ : STD_LOGIC;
  signal tx_data_cnt_flag_i_1_n_0 : STD_LOGIC;
  signal \tx_data_i1_d_reg_n_0_[0]\ : STD_LOGIC;
  signal \tx_data_i1_d_reg_n_0_[1]\ : STD_LOGIC;
  signal \tx_data_i1_d_reg_n_0_[2]\ : STD_LOGIC;
  signal \tx_data_i1_d_reg_n_0_[3]\ : STD_LOGIC;
  signal \tx_data_i1_d_reg_n_0_[4]\ : STD_LOGIC;
  signal \tx_data_i1_d_reg_n_0_[5]\ : STD_LOGIC;
  signal \tx_data_i2_d_reg_n_0_[0]\ : STD_LOGIC;
  signal \tx_data_i2_d_reg_n_0_[1]\ : STD_LOGIC;
  signal \tx_data_i2_d_reg_n_0_[2]\ : STD_LOGIC;
  signal \tx_data_i2_d_reg_n_0_[3]\ : STD_LOGIC;
  signal \tx_data_i2_d_reg_n_0_[4]\ : STD_LOGIC;
  signal \tx_data_i2_d_reg_n_0_[5]\ : STD_LOGIC;
  signal \tx_data_n[0]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_n[1]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_n[2]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_n[3]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_n[4]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_n[5]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_n_reg_n_0_[0]\ : STD_LOGIC;
  signal \tx_data_n_reg_n_0_[1]\ : STD_LOGIC;
  signal \tx_data_n_reg_n_0_[2]\ : STD_LOGIC;
  signal \tx_data_n_reg_n_0_[3]\ : STD_LOGIC;
  signal \tx_data_n_reg_n_0_[4]\ : STD_LOGIC;
  signal \tx_data_n_reg_n_0_[5]\ : STD_LOGIC;
  signal tx_data_out_0 : STD_LOGIC;
  signal tx_data_out_1 : STD_LOGIC;
  signal tx_data_out_2 : STD_LOGIC;
  signal tx_data_out_3 : STD_LOGIC;
  signal tx_data_out_4 : STD_LOGIC;
  signal tx_data_out_5 : STD_LOGIC;
  signal \tx_data_p[0]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_p[1]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_p[2]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_p[3]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_p[4]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_p[5]_i_1_n_0\ : STD_LOGIC;
  signal \tx_data_p[5]_i_2_n_0\ : STD_LOGIC;
  signal \tx_data_p_reg_n_0_[0]\ : STD_LOGIC;
  signal \tx_data_p_reg_n_0_[1]\ : STD_LOGIC;
  signal \tx_data_p_reg_n_0_[2]\ : STD_LOGIC;
  signal \tx_data_p_reg_n_0_[3]\ : STD_LOGIC;
  signal \tx_data_p_reg_n_0_[4]\ : STD_LOGIC;
  signal \tx_data_p_reg_n_0_[5]\ : STD_LOGIC;
  signal tx_data_q1_d : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal tx_data_q2_d : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal tx_data_sel : STD_LOGIC_VECTOR ( 2 to 2 );
  signal tx_frame : STD_LOGIC;
  signal tx_frame_i_1_n_0 : STD_LOGIC;
  signal tx_frame_out : STD_LOGIC;
  signal NLW_IDELAYCTRL_inst_RDY_UNCONNECTED : STD_LOGIC;
  signal NLW_IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_ODDR_data_clk_inst_R_UNCONNECTED : STD_LOGIC;
  signal NLW_ODDR_data_clk_inst_S_UNCONNECTED : STD_LOGIC;
  signal NLW_ODDR_frame_inst_R_UNCONNECTED : STD_LOGIC;
  signal NLW_ODDR_frame_inst_S_UNCONNECTED : STD_LOGIC;
  signal \NLW_genblk1[0].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_genblk1[1].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_genblk1[2].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_genblk1[3].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_genblk1[4].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_genblk1[5].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal \NLW_genblk2[0].ODDR_tx_data_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk2[0].ODDR_tx_data_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk2[1].ODDR_tx_data_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk2[1].ODDR_tx_data_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk2[2].ODDR_tx_data_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk2[2].ODDR_tx_data_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk2[3].ODDR_tx_data_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk2[3].ODDR_tx_data_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk2[4].ODDR_tx_data_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk2[4].ODDR_tx_data_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk2[5].ODDR_tx_data_inst_R_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_genblk2[5].ODDR_tx_data_inst_S_UNCONNECTED\ : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of BUFGCE_data_clk_inst : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of BUFGCE_data_clk_inst : label is "BUFGCE";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of BUFGCE_data_clk_inst : label is "CE:CE0 I:I0";
  attribute BOX_TYPE of IBUFDS_data_clk_inst : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of IBUFDS_data_clk_inst : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of IBUFDS_data_clk_inst : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of IBUFDS_data_clk_inst : label is "AUTO";
  attribute BOX_TYPE of IBUFDS_rx_frame_inst : label is "PRIMITIVE";
  attribute CAPACITANCE of IBUFDS_rx_frame_inst : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of IBUFDS_rx_frame_inst : label is "0";
  attribute IFD_DELAY_VALUE of IBUFDS_rx_frame_inst : label is "AUTO";
  attribute BOX_TYPE of IDDR_rx_frame_inst : label is "PRIMITIVE";
  attribute \__SRVAL\ : string;
  attribute \__SRVAL\ of IDDR_rx_frame_inst : label is "TRUE";
  attribute BOX_TYPE of IDELAYCTRL_inst : label is "PRIMITIVE";
  attribute BOX_TYPE of IDELAYE2_rx_frame_inst : label is "PRIMITIVE";
  attribute SIM_DELAY_D : integer;
  attribute SIM_DELAY_D of IDELAYE2_rx_frame_inst : label is 0;
  attribute BOX_TYPE of OBUFDS_data_clk_inst : label is "PRIMITIVE";
  attribute CAPACITANCE of OBUFDS_data_clk_inst : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of OBUFDS_data_clk_inst : label is "OBUFDS";
  attribute BOX_TYPE of OBUFDS_frame_inst : label is "PRIMITIVE";
  attribute CAPACITANCE of OBUFDS_frame_inst : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of OBUFDS_frame_inst : label is "OBUFDS";
  attribute BOX_TYPE of ODDR_data_clk_inst : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of ODDR_data_clk_inst : label is "MLO";
  attribute \__SRVAL\ of ODDR_data_clk_inst : label is "TRUE";
  attribute BOX_TYPE of ODDR_frame_inst : label is "PRIMITIVE";
  attribute OPT_MODIFIED of ODDR_frame_inst : label is "MLO";
  attribute \__SRVAL\ of ODDR_frame_inst : label is "TRUE";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \adc_data_i1[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \adc_data_i1[10]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \adc_data_i1[11]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \adc_data_i1[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \adc_data_i1[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \adc_data_i1[3]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \adc_data_i1[4]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \adc_data_i1[5]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \adc_data_i1[6]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \adc_data_i1[7]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \adc_data_i1[8]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \adc_data_i1[9]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \adc_data_q1[0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \adc_data_q1[10]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \adc_data_q1[11]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \adc_data_q1[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \adc_data_q1[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \adc_data_q1[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \adc_data_q1[4]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \adc_data_q1[5]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \adc_data_q1[6]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \adc_data_q1[7]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \adc_data_q1[8]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \adc_data_q1[9]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of adc_status_i_1 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of adc_valid_i_1 : label is "soft_lutpair14";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \ap_rst_n_r_reg[14]_srl15\ : label is "\inst/ap_rst_n_r_reg ";
  attribute srl_name : string;
  attribute srl_name of \ap_rst_n_r_reg[14]_srl15\ : label is "\inst/ap_rst_n_r_reg[14]_srl15 ";
  attribute BOX_TYPE of \genblk1[0].IBUFDS_rx_data_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \genblk1[0].IBUFDS_rx_data_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \genblk1[0].IBUFDS_rx_data_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \genblk1[0].IBUFDS_rx_data_inst\ : label is "AUTO";
  attribute BOX_TYPE of \genblk1[0].IDDR_rx_frame_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \genblk1[0].IDDR_rx_frame_inst\ : label is "TRUE";
  attribute BOX_TYPE of \genblk1[0].IDELAYE2_rx_frame_inst\ : label is "PRIMITIVE";
  attribute SIM_DELAY_D of \genblk1[0].IDELAYE2_rx_frame_inst\ : label is 0;
  attribute BOX_TYPE of \genblk1[1].IBUFDS_rx_data_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \genblk1[1].IBUFDS_rx_data_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \genblk1[1].IBUFDS_rx_data_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \genblk1[1].IBUFDS_rx_data_inst\ : label is "AUTO";
  attribute BOX_TYPE of \genblk1[1].IDDR_rx_frame_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \genblk1[1].IDDR_rx_frame_inst\ : label is "TRUE";
  attribute BOX_TYPE of \genblk1[1].IDELAYE2_rx_frame_inst\ : label is "PRIMITIVE";
  attribute SIM_DELAY_D of \genblk1[1].IDELAYE2_rx_frame_inst\ : label is 0;
  attribute BOX_TYPE of \genblk1[2].IBUFDS_rx_data_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \genblk1[2].IBUFDS_rx_data_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \genblk1[2].IBUFDS_rx_data_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \genblk1[2].IBUFDS_rx_data_inst\ : label is "AUTO";
  attribute BOX_TYPE of \genblk1[2].IDDR_rx_frame_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \genblk1[2].IDDR_rx_frame_inst\ : label is "TRUE";
  attribute BOX_TYPE of \genblk1[2].IDELAYE2_rx_frame_inst\ : label is "PRIMITIVE";
  attribute SIM_DELAY_D of \genblk1[2].IDELAYE2_rx_frame_inst\ : label is 0;
  attribute BOX_TYPE of \genblk1[3].IBUFDS_rx_data_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \genblk1[3].IBUFDS_rx_data_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \genblk1[3].IBUFDS_rx_data_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \genblk1[3].IBUFDS_rx_data_inst\ : label is "AUTO";
  attribute BOX_TYPE of \genblk1[3].IDDR_rx_frame_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \genblk1[3].IDDR_rx_frame_inst\ : label is "TRUE";
  attribute BOX_TYPE of \genblk1[3].IDELAYE2_rx_frame_inst\ : label is "PRIMITIVE";
  attribute SIM_DELAY_D of \genblk1[3].IDELAYE2_rx_frame_inst\ : label is 0;
  attribute BOX_TYPE of \genblk1[4].IBUFDS_rx_data_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \genblk1[4].IBUFDS_rx_data_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \genblk1[4].IBUFDS_rx_data_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \genblk1[4].IBUFDS_rx_data_inst\ : label is "AUTO";
  attribute BOX_TYPE of \genblk1[4].IDDR_rx_frame_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \genblk1[4].IDDR_rx_frame_inst\ : label is "TRUE";
  attribute BOX_TYPE of \genblk1[4].IDELAYE2_rx_frame_inst\ : label is "PRIMITIVE";
  attribute SIM_DELAY_D of \genblk1[4].IDELAYE2_rx_frame_inst\ : label is 0;
  attribute BOX_TYPE of \genblk1[5].IBUFDS_rx_data_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \genblk1[5].IBUFDS_rx_data_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \genblk1[5].IBUFDS_rx_data_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \genblk1[5].IBUFDS_rx_data_inst\ : label is "AUTO";
  attribute BOX_TYPE of \genblk1[5].IDDR_rx_frame_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \genblk1[5].IDDR_rx_frame_inst\ : label is "TRUE";
  attribute BOX_TYPE of \genblk1[5].IDELAYE2_rx_frame_inst\ : label is "PRIMITIVE";
  attribute SIM_DELAY_D of \genblk1[5].IDELAYE2_rx_frame_inst\ : label is 0;
  attribute BOX_TYPE of \genblk2[0].OBUFDS_tx_data_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \genblk2[0].OBUFDS_tx_data_inst\ : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of \genblk2[0].OBUFDS_tx_data_inst\ : label is "OBUFDS";
  attribute BOX_TYPE of \genblk2[0].ODDR_tx_data_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \genblk2[0].ODDR_tx_data_inst\ : label is "MLO";
  attribute \__SRVAL\ of \genblk2[0].ODDR_tx_data_inst\ : label is "TRUE";
  attribute BOX_TYPE of \genblk2[1].OBUFDS_tx_data_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \genblk2[1].OBUFDS_tx_data_inst\ : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of \genblk2[1].OBUFDS_tx_data_inst\ : label is "OBUFDS";
  attribute BOX_TYPE of \genblk2[1].ODDR_tx_data_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \genblk2[1].ODDR_tx_data_inst\ : label is "MLO";
  attribute \__SRVAL\ of \genblk2[1].ODDR_tx_data_inst\ : label is "TRUE";
  attribute BOX_TYPE of \genblk2[2].OBUFDS_tx_data_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \genblk2[2].OBUFDS_tx_data_inst\ : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of \genblk2[2].OBUFDS_tx_data_inst\ : label is "OBUFDS";
  attribute BOX_TYPE of \genblk2[2].ODDR_tx_data_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \genblk2[2].ODDR_tx_data_inst\ : label is "MLO";
  attribute \__SRVAL\ of \genblk2[2].ODDR_tx_data_inst\ : label is "TRUE";
  attribute BOX_TYPE of \genblk2[3].OBUFDS_tx_data_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \genblk2[3].OBUFDS_tx_data_inst\ : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of \genblk2[3].OBUFDS_tx_data_inst\ : label is "OBUFDS";
  attribute BOX_TYPE of \genblk2[3].ODDR_tx_data_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \genblk2[3].ODDR_tx_data_inst\ : label is "MLO";
  attribute \__SRVAL\ of \genblk2[3].ODDR_tx_data_inst\ : label is "TRUE";
  attribute BOX_TYPE of \genblk2[4].OBUFDS_tx_data_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \genblk2[4].OBUFDS_tx_data_inst\ : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of \genblk2[4].OBUFDS_tx_data_inst\ : label is "OBUFDS";
  attribute BOX_TYPE of \genblk2[4].ODDR_tx_data_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \genblk2[4].ODDR_tx_data_inst\ : label is "MLO";
  attribute \__SRVAL\ of \genblk2[4].ODDR_tx_data_inst\ : label is "TRUE";
  attribute BOX_TYPE of \genblk2[5].OBUFDS_tx_data_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \genblk2[5].OBUFDS_tx_data_inst\ : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM of \genblk2[5].OBUFDS_tx_data_inst\ : label is "OBUFDS";
  attribute BOX_TYPE of \genblk2[5].ODDR_tx_data_inst\ : label is "PRIMITIVE";
  attribute OPT_MODIFIED of \genblk2[5].ODDR_tx_data_inst\ : label is "MLO";
  attribute \__SRVAL\ of \genblk2[5].ODDR_tx_data_inst\ : label is "TRUE";
  attribute SOFT_HLUTNM of rx_error_r1_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of rx_error_r2_i_1 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \tx_data_cnt[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \tx_data_cnt[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of tx_data_cnt_flag_i_1 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of tx_frame_i_1 : label is "soft_lutpair2";
begin
  data_clk <= \^data_clk\;
BUFGCE_data_clk_inst: unisim.vcomponents.BUFGCTRL
    generic map(
      INIT_OUT => 0,
      PRESELECT_I0 => true,
      PRESELECT_I1 => false,
      SIM_DEVICE => "7SERIES"
    )
        port map (
      CE0 => data_clk_ce,
      CE1 => '0',
      I0 => data_clk_ibuf,
      I1 => '1',
      IGNORE0 => '0',
      IGNORE1 => '1',
      O => \^data_clk\,
      S0 => '1',
      S1 => '0'
    );
IBUFDS_data_clk_inst: unisim.vcomponents.IBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => rx_clk_in_p,
      IB => rx_clk_in_n,
      O => data_clk_ibuf
    );
IBUFDS_rx_frame_inst: unisim.vcomponents.IBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => rx_frame_in_p,
      IB => rx_frame_in_n,
      O => rx_frame_ibuf
    );
IDDR_rx_frame_inst: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_frame_idelay,
      Q1 => rx_frame_iddr_p,
      Q2 => rx_frame_iddr_n,
      R => '0',
      S => '0'
    );
IDELAYCTRL_inst: unisim.vcomponents.IDELAYCTRL
    generic map(
      SIM_DEVICE => "7SERIES"
    )
        port map (
      RDY => NLW_IDELAYCTRL_inst_RDY_UNCONNECTED,
      REFCLK => idelay_clk_200m,
      RST => p_0_out
    );
IDELAYCTRL_inst_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rst_n,
      O => p_0_out
    );
IDELAYE2_rx_frame_inst: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "FALSE",
      IDELAY_TYPE => "VAR_LOAD",
      IDELAY_VALUE => 0,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => idelay_clk_200m,
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => idly_d(4 downto 0),
      CNTVALUEOUT(4 downto 0) => NLW_IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED(4 downto 0),
      DATAIN => '1',
      DATAOUT => rx_frame_idelay,
      IDATAIN => rx_frame_ibuf,
      INC => '0',
      LD => idly_en(6),
      LDPIPEEN => '0',
      REGRST => '0'
    );
OBUFDS_data_clk_inst: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => tx_clk,
      O => tx_clk_out_p,
      OB => tx_clk_out_n
    );
OBUFDS_frame_inst: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => tx_frame_out,
      O => tx_frame_out_p,
      OB => tx_frame_out_n
    );
ODDR_data_clk_inst: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D1 => '0',
      D2 => '1',
      Q => tx_clk,
      R => NLW_ODDR_data_clk_inst_R_UNCONNECTED,
      S => NLW_ODDR_data_clk_inst_S_UNCONNECTED
    );
ODDR_frame_inst: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D1 => tx_frame,
      D2 => tx_frame,
      Q => tx_frame_out,
      R => NLW_ODDR_frame_inst_R_UNCONNECTED,
      S => NLW_ODDR_frame_inst_S_UNCONNECTED
    );
\adc_data_i1[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_i_r1(0),
      I1 => \rx_data_i1_r2__0\(0),
      I2 => adc_mode_r1,
      O => \adc_data_i1[0]_i_1_n_0\
    );
\adc_data_i1[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_i_r1(10),
      I1 => \rx_data_i1_r2__0\(10),
      I2 => adc_mode_r1,
      O => \adc_data_i1[10]_i_1_n_0\
    );
\adc_data_i1[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_i_r1(11),
      I1 => \rx_data_i1_r2__0\(11),
      I2 => adc_mode_r1,
      O => \adc_data_i1[11]_i_1_n_0\
    );
\adc_data_i1[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_i_r1(1),
      I1 => \rx_data_i1_r2__0\(1),
      I2 => adc_mode_r1,
      O => \adc_data_i1[1]_i_1_n_0\
    );
\adc_data_i1[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_i_r1(2),
      I1 => \rx_data_i1_r2__0\(2),
      I2 => adc_mode_r1,
      O => \adc_data_i1[2]_i_1_n_0\
    );
\adc_data_i1[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_i_r1(3),
      I1 => \rx_data_i1_r2__0\(3),
      I2 => adc_mode_r1,
      O => \adc_data_i1[3]_i_1_n_0\
    );
\adc_data_i1[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_i_r1(4),
      I1 => \rx_data_i1_r2__0\(4),
      I2 => adc_mode_r1,
      O => \adc_data_i1[4]_i_1_n_0\
    );
\adc_data_i1[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_i_r1(5),
      I1 => \rx_data_i1_r2__0\(5),
      I2 => adc_mode_r1,
      O => \adc_data_i1[5]_i_1_n_0\
    );
\adc_data_i1[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_i_r1(6),
      I1 => \rx_data_i1_r2__0\(6),
      I2 => adc_mode_r1,
      O => \adc_data_i1[6]_i_1_n_0\
    );
\adc_data_i1[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_i_r1(7),
      I1 => \rx_data_i1_r2__0\(7),
      I2 => adc_mode_r1,
      O => \adc_data_i1[7]_i_1_n_0\
    );
\adc_data_i1[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_i_r1(8),
      I1 => \rx_data_i1_r2__0\(8),
      I2 => adc_mode_r1,
      O => \adc_data_i1[8]_i_1_n_0\
    );
\adc_data_i1[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_i_r1(9),
      I1 => \rx_data_i1_r2__0\(9),
      I2 => adc_mode_r1,
      O => \adc_data_i1[9]_i_1_n_0\
    );
\adc_data_i1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_i1[0]_i_1_n_0\,
      Q => adc_data_i1(0),
      R => '0'
    );
\adc_data_i1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_i1[10]_i_1_n_0\,
      Q => adc_data_i1(10),
      R => '0'
    );
\adc_data_i1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_i1[11]_i_1_n_0\,
      Q => adc_data_i1(11),
      R => '0'
    );
\adc_data_i1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_i1[1]_i_1_n_0\,
      Q => adc_data_i1(1),
      R => '0'
    );
\adc_data_i1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_i1[2]_i_1_n_0\,
      Q => adc_data_i1(2),
      R => '0'
    );
\adc_data_i1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_i1[3]_i_1_n_0\,
      Q => adc_data_i1(3),
      R => '0'
    );
\adc_data_i1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_i1[4]_i_1_n_0\,
      Q => adc_data_i1(4),
      R => '0'
    );
\adc_data_i1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_i1[5]_i_1_n_0\,
      Q => adc_data_i1(5),
      R => '0'
    );
\adc_data_i1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_i1[6]_i_1_n_0\,
      Q => adc_data_i1(6),
      R => '0'
    );
\adc_data_i1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_i1[7]_i_1_n_0\,
      Q => adc_data_i1(7),
      R => '0'
    );
\adc_data_i1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_i1[8]_i_1_n_0\,
      Q => adc_data_i1(8),
      R => '0'
    );
\adc_data_i1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_i1[9]_i_1_n_0\,
      Q => adc_data_i1(9),
      R => '0'
    );
\adc_data_i2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_i2_r2(0),
      Q => adc_data_i2(0),
      R => adc_mode_r1
    );
\adc_data_i2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_i2_r2(10),
      Q => adc_data_i2(10),
      R => adc_mode_r1
    );
\adc_data_i2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_i2_r2(11),
      Q => adc_data_i2(11),
      R => adc_mode_r1
    );
\adc_data_i2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_i2_r2(1),
      Q => adc_data_i2(1),
      R => adc_mode_r1
    );
\adc_data_i2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_i2_r2(2),
      Q => adc_data_i2(2),
      R => adc_mode_r1
    );
\adc_data_i2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_i2_r2(3),
      Q => adc_data_i2(3),
      R => adc_mode_r1
    );
\adc_data_i2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_i2_r2(4),
      Q => adc_data_i2(4),
      R => adc_mode_r1
    );
\adc_data_i2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_i2_r2(5),
      Q => adc_data_i2(5),
      R => adc_mode_r1
    );
\adc_data_i2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_i2_r2(6),
      Q => adc_data_i2(6),
      R => adc_mode_r1
    );
\adc_data_i2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_i2_r2(7),
      Q => adc_data_i2(7),
      R => adc_mode_r1
    );
\adc_data_i2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_i2_r2(8),
      Q => adc_data_i2(8),
      R => adc_mode_r1
    );
\adc_data_i2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_i2_r2(9),
      Q => adc_data_i2(9),
      R => adc_mode_r1
    );
\adc_data_q1[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_q_r1(0),
      I1 => rx_data_q1_r2(0),
      I2 => adc_mode_r1,
      O => \adc_data_q1[0]_i_1_n_0\
    );
\adc_data_q1[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_q_r1(10),
      I1 => rx_data_q1_r2(10),
      I2 => adc_mode_r1,
      O => \adc_data_q1[10]_i_1_n_0\
    );
\adc_data_q1[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_q_r1(11),
      I1 => rx_data_q1_r2(11),
      I2 => adc_mode_r1,
      O => \adc_data_q1[11]_i_1_n_0\
    );
\adc_data_q1[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_q_r1(1),
      I1 => rx_data_q1_r2(1),
      I2 => adc_mode_r1,
      O => \adc_data_q1[1]_i_1_n_0\
    );
\adc_data_q1[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_q_r1(2),
      I1 => rx_data_q1_r2(2),
      I2 => adc_mode_r1,
      O => \adc_data_q1[2]_i_1_n_0\
    );
\adc_data_q1[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_q_r1(3),
      I1 => rx_data_q1_r2(3),
      I2 => adc_mode_r1,
      O => \adc_data_q1[3]_i_1_n_0\
    );
\adc_data_q1[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_q_r1(4),
      I1 => rx_data_q1_r2(4),
      I2 => adc_mode_r1,
      O => \adc_data_q1[4]_i_1_n_0\
    );
\adc_data_q1[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_q_r1(5),
      I1 => rx_data_q1_r2(5),
      I2 => adc_mode_r1,
      O => \adc_data_q1[5]_i_1_n_0\
    );
\adc_data_q1[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_q_r1(6),
      I1 => rx_data_q1_r2(6),
      I2 => adc_mode_r1,
      O => \adc_data_q1[6]_i_1_n_0\
    );
\adc_data_q1[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_q_r1(7),
      I1 => rx_data_q1_r2(7),
      I2 => adc_mode_r1,
      O => \adc_data_q1[7]_i_1_n_0\
    );
\adc_data_q1[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_q_r1(8),
      I1 => rx_data_q1_r2(8),
      I2 => adc_mode_r1,
      O => \adc_data_q1[8]_i_1_n_0\
    );
\adc_data_q1[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => rx_data_q_r1(9),
      I1 => rx_data_q1_r2(9),
      I2 => adc_mode_r1,
      O => \adc_data_q1[9]_i_1_n_0\
    );
\adc_data_q1_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_q1[0]_i_1_n_0\,
      Q => adc_data_q1(0),
      R => '0'
    );
\adc_data_q1_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_q1[10]_i_1_n_0\,
      Q => adc_data_q1(10),
      R => '0'
    );
\adc_data_q1_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_q1[11]_i_1_n_0\,
      Q => adc_data_q1(11),
      R => '0'
    );
\adc_data_q1_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_q1[1]_i_1_n_0\,
      Q => adc_data_q1(1),
      R => '0'
    );
\adc_data_q1_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_q1[2]_i_1_n_0\,
      Q => adc_data_q1(2),
      R => '0'
    );
\adc_data_q1_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_q1[3]_i_1_n_0\,
      Q => adc_data_q1(3),
      R => '0'
    );
\adc_data_q1_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_q1[4]_i_1_n_0\,
      Q => adc_data_q1(4),
      R => '0'
    );
\adc_data_q1_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_q1[5]_i_1_n_0\,
      Q => adc_data_q1(5),
      R => '0'
    );
\adc_data_q1_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_q1[6]_i_1_n_0\,
      Q => adc_data_q1(6),
      R => '0'
    );
\adc_data_q1_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_q1[7]_i_1_n_0\,
      Q => adc_data_q1(7),
      R => '0'
    );
\adc_data_q1_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_q1[8]_i_1_n_0\,
      Q => adc_data_q1(8),
      R => '0'
    );
\adc_data_q1_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \adc_data_q1[9]_i_1_n_0\,
      Q => adc_data_q1(9),
      R => '0'
    );
\adc_data_q2_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q2_r2(0),
      Q => adc_data_q2(0),
      R => adc_mode_r1
    );
\adc_data_q2_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q2_r2(10),
      Q => adc_data_q2(10),
      R => adc_mode_r1
    );
\adc_data_q2_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q2_r2(11),
      Q => adc_data_q2(11),
      R => adc_mode_r1
    );
\adc_data_q2_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q2_r2(1),
      Q => adc_data_q2(1),
      R => adc_mode_r1
    );
\adc_data_q2_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q2_r2(2),
      Q => adc_data_q2(2),
      R => adc_mode_r1
    );
\adc_data_q2_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q2_r2(3),
      Q => adc_data_q2(3),
      R => adc_mode_r1
    );
\adc_data_q2_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q2_r2(4),
      Q => adc_data_q2(4),
      R => adc_mode_r1
    );
\adc_data_q2_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q2_r2(5),
      Q => adc_data_q2(5),
      R => adc_mode_r1
    );
\adc_data_q2_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q2_r2(6),
      Q => adc_data_q2(6),
      R => adc_mode_r1
    );
\adc_data_q2_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q2_r2(7),
      Q => adc_data_q2(7),
      R => adc_mode_r1
    );
\adc_data_q2_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q2_r2(8),
      Q => adc_data_q2(8),
      R => adc_mode_r1
    );
\adc_data_q2_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q2_r2(9),
      Q => adc_data_q2(9),
      R => adc_mode_r1
    );
adc_status_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_error_r1,
      I1 => adc_mode_r1,
      I2 => rx_error_r2,
      O => adc_status_i_1_n_0
    );
adc_status_reg: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => adc_status_i_1_n_0,
      Q => adc_status,
      R => '0'
    );
adc_valid_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => rx_valid_r1,
      I1 => adc_mode_r1,
      I2 => rx_valid_r2,
      O => adc_valid_i_1_n_0
    );
adc_valid_reg: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => adc_valid_i_1_n_0,
      Q => adc_valid,
      R => '0'
    );
\ap_rst_n_r_reg[14]_srl15\: unisim.vcomponents.SRL16E
     port map (
      A0 => '0',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => '1',
      CLK => \^data_clk\,
      D => rst_n,
      Q => \ap_rst_n_r_reg[14]_srl15_n_0\
    );
\ap_rst_n_r_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \ap_rst_n_r_reg[14]_srl15_n_0\,
      Q => ap_rst_n,
      R => '0'
    );
\genblk1[0].IBUFDS_rx_data_inst\: unisim.vcomponents.IBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => rx_data_in_p(0),
      IB => rx_data_in_n(0),
      O => rx_data_ibuf_0
    );
\genblk1[0].IDDR_rx_frame_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_idelay_0,
      Q1 => p_11_out,
      Q2 => rx_data_iddr_n(0),
      R => '0',
      S => '0'
    );
\genblk1[0].IDELAYE2_rx_frame_inst\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "FALSE",
      IDELAY_TYPE => "VAR_LOAD",
      IDELAY_VALUE => 0,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => idelay_clk_200m,
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => idly_d(4 downto 0),
      CNTVALUEOUT(4 downto 0) => \NLW_genblk1[0].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '1',
      DATAOUT => rx_data_idelay_0,
      IDATAIN => rx_data_ibuf_0,
      INC => '0',
      LD => idly_en(0),
      LDPIPEEN => '0',
      REGRST => '0'
    );
\genblk1[1].IBUFDS_rx_data_inst\: unisim.vcomponents.IBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => rx_data_in_p(1),
      IB => rx_data_in_n(1),
      O => rx_data_ibuf_1
    );
\genblk1[1].IDDR_rx_frame_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_idelay_1,
      Q1 => p_9_out,
      Q2 => rx_data_iddr_n(1),
      R => '0',
      S => '0'
    );
\genblk1[1].IDELAYE2_rx_frame_inst\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "FALSE",
      IDELAY_TYPE => "VAR_LOAD",
      IDELAY_VALUE => 0,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => idelay_clk_200m,
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => idly_d(4 downto 0),
      CNTVALUEOUT(4 downto 0) => \NLW_genblk1[1].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '1',
      DATAOUT => rx_data_idelay_1,
      IDATAIN => rx_data_ibuf_1,
      INC => '0',
      LD => idly_en(1),
      LDPIPEEN => '0',
      REGRST => '0'
    );
\genblk1[2].IBUFDS_rx_data_inst\: unisim.vcomponents.IBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => rx_data_in_p(2),
      IB => rx_data_in_n(2),
      O => rx_data_ibuf_2
    );
\genblk1[2].IDDR_rx_frame_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_idelay_2,
      Q1 => p_7_out,
      Q2 => rx_data_iddr_n(2),
      R => '0',
      S => '0'
    );
\genblk1[2].IDELAYE2_rx_frame_inst\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "FALSE",
      IDELAY_TYPE => "VAR_LOAD",
      IDELAY_VALUE => 0,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => idelay_clk_200m,
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => idly_d(4 downto 0),
      CNTVALUEOUT(4 downto 0) => \NLW_genblk1[2].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '1',
      DATAOUT => rx_data_idelay_2,
      IDATAIN => rx_data_ibuf_2,
      INC => '0',
      LD => idly_en(2),
      LDPIPEEN => '0',
      REGRST => '0'
    );
\genblk1[3].IBUFDS_rx_data_inst\: unisim.vcomponents.IBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => rx_data_in_p(3),
      IB => rx_data_in_n(3),
      O => rx_data_ibuf_3
    );
\genblk1[3].IDDR_rx_frame_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_idelay_3,
      Q1 => p_5_out,
      Q2 => rx_data_iddr_n(3),
      R => '0',
      S => '0'
    );
\genblk1[3].IDELAYE2_rx_frame_inst\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "FALSE",
      IDELAY_TYPE => "VAR_LOAD",
      IDELAY_VALUE => 0,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => idelay_clk_200m,
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => idly_d(4 downto 0),
      CNTVALUEOUT(4 downto 0) => \NLW_genblk1[3].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '1',
      DATAOUT => rx_data_idelay_3,
      IDATAIN => rx_data_ibuf_3,
      INC => '0',
      LD => idly_en(3),
      LDPIPEEN => '0',
      REGRST => '0'
    );
\genblk1[4].IBUFDS_rx_data_inst\: unisim.vcomponents.IBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => rx_data_in_p(4),
      IB => rx_data_in_n(4),
      O => rx_data_ibuf_4
    );
\genblk1[4].IDDR_rx_frame_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_idelay_4,
      Q1 => p_3_out,
      Q2 => rx_data_iddr_n(4),
      R => '0',
      S => '0'
    );
\genblk1[4].IDELAYE2_rx_frame_inst\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "FALSE",
      IDELAY_TYPE => "VAR_LOAD",
      IDELAY_VALUE => 0,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => idelay_clk_200m,
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => idly_d(4 downto 0),
      CNTVALUEOUT(4 downto 0) => \NLW_genblk1[4].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '1',
      DATAOUT => rx_data_idelay_4,
      IDATAIN => rx_data_ibuf_4,
      INC => '0',
      LD => idly_en(4),
      LDPIPEEN => '0',
      REGRST => '0'
    );
\genblk1[5].IBUFDS_rx_data_inst\: unisim.vcomponents.IBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => rx_data_in_p(5),
      IB => rx_data_in_n(5),
      O => rx_data_ibuf_5
    );
\genblk1[5].IDDR_rx_frame_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE_PIPELINED",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_idelay_5,
      Q1 => p_1_out,
      Q2 => rx_data_iddr_n(5),
      R => '0',
      S => '0'
    );
\genblk1[5].IDELAYE2_rx_frame_inst\: unisim.vcomponents.IDELAYE2
    generic map(
      CINVCTRL_SEL => "FALSE",
      DELAY_SRC => "IDATAIN",
      HIGH_PERFORMANCE_MODE => "FALSE",
      IDELAY_TYPE => "VAR_LOAD",
      IDELAY_VALUE => 0,
      IS_C_INVERTED => '0',
      IS_DATAIN_INVERTED => '0',
      IS_IDATAIN_INVERTED => '0',
      PIPE_SEL => "FALSE",
      REFCLK_FREQUENCY => 200.000000,
      SIGNAL_PATTERN => "DATA"
    )
        port map (
      C => idelay_clk_200m,
      CE => '0',
      CINVCTRL => '0',
      CNTVALUEIN(4 downto 0) => idly_d(4 downto 0),
      CNTVALUEOUT(4 downto 0) => \NLW_genblk1[5].IDELAYE2_rx_frame_inst_CNTVALUEOUT_UNCONNECTED\(4 downto 0),
      DATAIN => '1',
      DATAOUT => rx_data_idelay_5,
      IDATAIN => rx_data_ibuf_5,
      INC => '0',
      LD => idly_en(5),
      LDPIPEEN => '0',
      REGRST => '0'
    );
\genblk2[0].OBUFDS_tx_data_inst\: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => tx_data_out_0,
      O => tx_data_out_p(0),
      OB => tx_data_out_n(0)
    );
\genblk2[0].ODDR_tx_data_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D1 => \tx_data_p_reg_n_0_[0]\,
      D2 => \tx_data_n_reg_n_0_[0]\,
      Q => tx_data_out_0,
      R => \NLW_genblk2[0].ODDR_tx_data_inst_R_UNCONNECTED\,
      S => \NLW_genblk2[0].ODDR_tx_data_inst_S_UNCONNECTED\
    );
\genblk2[1].OBUFDS_tx_data_inst\: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => tx_data_out_1,
      O => tx_data_out_p(1),
      OB => tx_data_out_n(1)
    );
\genblk2[1].ODDR_tx_data_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D1 => \tx_data_p_reg_n_0_[1]\,
      D2 => \tx_data_n_reg_n_0_[1]\,
      Q => tx_data_out_1,
      R => \NLW_genblk2[1].ODDR_tx_data_inst_R_UNCONNECTED\,
      S => \NLW_genblk2[1].ODDR_tx_data_inst_S_UNCONNECTED\
    );
\genblk2[2].OBUFDS_tx_data_inst\: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => tx_data_out_2,
      O => tx_data_out_p(2),
      OB => tx_data_out_n(2)
    );
\genblk2[2].ODDR_tx_data_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D1 => \tx_data_p_reg_n_0_[2]\,
      D2 => \tx_data_n_reg_n_0_[2]\,
      Q => tx_data_out_2,
      R => \NLW_genblk2[2].ODDR_tx_data_inst_R_UNCONNECTED\,
      S => \NLW_genblk2[2].ODDR_tx_data_inst_S_UNCONNECTED\
    );
\genblk2[3].OBUFDS_tx_data_inst\: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => tx_data_out_3,
      O => tx_data_out_p(3),
      OB => tx_data_out_n(3)
    );
\genblk2[3].ODDR_tx_data_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D1 => \tx_data_p_reg_n_0_[3]\,
      D2 => \tx_data_n_reg_n_0_[3]\,
      Q => tx_data_out_3,
      R => \NLW_genblk2[3].ODDR_tx_data_inst_R_UNCONNECTED\,
      S => \NLW_genblk2[3].ODDR_tx_data_inst_S_UNCONNECTED\
    );
\genblk2[4].OBUFDS_tx_data_inst\: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => tx_data_out_4,
      O => tx_data_out_p(4),
      OB => tx_data_out_n(4)
    );
\genblk2[4].ODDR_tx_data_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D1 => \tx_data_p_reg_n_0_[4]\,
      D2 => \tx_data_n_reg_n_0_[4]\,
      Q => tx_data_out_4,
      R => \NLW_genblk2[4].ODDR_tx_data_inst_R_UNCONNECTED\,
      S => \NLW_genblk2[4].ODDR_tx_data_inst_S_UNCONNECTED\
    );
\genblk2[5].OBUFDS_tx_data_inst\: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => tx_data_out_5,
      O => tx_data_out_p(5),
      OB => tx_data_out_n(5)
    );
\genblk2[5].ODDR_tx_data_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "SAME_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "SYNC"
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D1 => \tx_data_p_reg_n_0_[5]\,
      D2 => \tx_data_n_reg_n_0_[5]\,
      Q => tx_data_out_5,
      R => \NLW_genblk2[5].ODDR_tx_data_inst_R_UNCONNECTED\,
      S => \NLW_genblk2[5].ODDR_tx_data_inst_S_UNCONNECTED\
    );
rx_data_i1_r2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => rx_frame_shift(3),
      I1 => rx_frame_shift(2),
      I2 => rx_frame_shift(0),
      I3 => rx_frame_shift(1),
      O => rx_data_q1_r2_1
    );
\rx_data_i1_r2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(6),
      Q => \rx_data_i1_r2__0\(0),
      R => '0'
    );
\rx_data_i1_r2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(22),
      Q => \rx_data_i1_r2__0\(10),
      R => '0'
    );
\rx_data_i1_r2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(23),
      Q => \rx_data_i1_r2__0\(11),
      R => '0'
    );
\rx_data_i1_r2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(7),
      Q => \rx_data_i1_r2__0\(1),
      R => '0'
    );
\rx_data_i1_r2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(8),
      Q => \rx_data_i1_r2__0\(2),
      R => '0'
    );
\rx_data_i1_r2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(9),
      Q => \rx_data_i1_r2__0\(3),
      R => '0'
    );
\rx_data_i1_r2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(10),
      Q => \rx_data_i1_r2__0\(4),
      R => '0'
    );
\rx_data_i1_r2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(11),
      Q => \rx_data_i1_r2__0\(5),
      R => '0'
    );
\rx_data_i1_r2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(18),
      Q => \rx_data_i1_r2__0\(6),
      R => '0'
    );
\rx_data_i1_r2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(19),
      Q => \rx_data_i1_r2__0\(7),
      R => '0'
    );
\rx_data_i1_r2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(20),
      Q => \rx_data_i1_r2__0\(8),
      R => '0'
    );
\rx_data_i1_r2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(21),
      Q => \rx_data_i1_r2__0\(9),
      R => '0'
    );
\rx_data_i2_r2[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => rx_frame_shift(3),
      I1 => rx_frame_shift(2),
      I2 => rx_frame_shift(0),
      I3 => rx_frame_shift(1),
      O => rx_data_q2_r2_0
    );
\rx_data_i2_r2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(6),
      Q => rx_data_i2_r2(0),
      R => '0'
    );
\rx_data_i2_r2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(22),
      Q => rx_data_i2_r2(10),
      R => '0'
    );
\rx_data_i2_r2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(23),
      Q => rx_data_i2_r2(11),
      R => '0'
    );
\rx_data_i2_r2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(7),
      Q => rx_data_i2_r2(1),
      R => '0'
    );
\rx_data_i2_r2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(8),
      Q => rx_data_i2_r2(2),
      R => '0'
    );
\rx_data_i2_r2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(9),
      Q => rx_data_i2_r2(3),
      R => '0'
    );
\rx_data_i2_r2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(10),
      Q => rx_data_i2_r2(4),
      R => '0'
    );
\rx_data_i2_r2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(11),
      Q => rx_data_i2_r2(5),
      R => '0'
    );
\rx_data_i2_r2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(18),
      Q => rx_data_i2_r2(6),
      R => '0'
    );
\rx_data_i2_r2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(19),
      Q => rx_data_i2_r2(7),
      R => '0'
    );
\rx_data_i2_r2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(20),
      Q => rx_data_i2_r2(8),
      R => '0'
    );
\rx_data_i2_r2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(21),
      Q => rx_data_i2_r2(9),
      R => '0'
    );
\rx_data_i_r1[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => rx_frame_shift(0),
      I1 => rx_frame_shift(1),
      I2 => rx_frame_shift(3),
      I3 => rx_frame_shift(2),
      O => rx_data_q_r1_2
    );
\rx_data_i_r1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(6),
      Q => rx_data_i_r1(0),
      R => '0'
    );
\rx_data_i_r1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(22),
      Q => rx_data_i_r1(10),
      R => '0'
    );
\rx_data_i_r1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(23),
      Q => rx_data_i_r1(11),
      R => '0'
    );
\rx_data_i_r1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(7),
      Q => rx_data_i_r1(1),
      R => '0'
    );
\rx_data_i_r1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(8),
      Q => rx_data_i_r1(2),
      R => '0'
    );
\rx_data_i_r1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(9),
      Q => rx_data_i_r1(3),
      R => '0'
    );
\rx_data_i_r1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(10),
      Q => rx_data_i_r1(4),
      R => '0'
    );
\rx_data_i_r1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(11),
      Q => rx_data_i_r1(5),
      R => '0'
    );
\rx_data_i_r1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(18),
      Q => rx_data_i_r1(6),
      R => '0'
    );
\rx_data_i_r1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(19),
      Q => rx_data_i_r1(7),
      R => '0'
    );
\rx_data_i_r1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(20),
      Q => rx_data_i_r1(8),
      R => '0'
    );
\rx_data_i_r1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(21),
      Q => rx_data_i_r1(9),
      R => '0'
    );
\rx_data_iddr_n_dly_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_iddr_n(0),
      Q => rx_data_iddr_n_dly(0),
      R => '0'
    );
\rx_data_iddr_n_dly_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_iddr_n(1),
      Q => rx_data_iddr_n_dly(1),
      R => '0'
    );
\rx_data_iddr_n_dly_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_iddr_n(2),
      Q => rx_data_iddr_n_dly(2),
      R => '0'
    );
\rx_data_iddr_n_dly_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_iddr_n(3),
      Q => rx_data_iddr_n_dly(3),
      R => '0'
    );
\rx_data_iddr_n_dly_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_iddr_n(4),
      Q => rx_data_iddr_n_dly(4),
      R => '0'
    );
\rx_data_iddr_n_dly_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_iddr_n(5),
      Q => rx_data_iddr_n_dly(5),
      R => '0'
    );
\rx_data_q1_r2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(0),
      Q => rx_data_q1_r2(0),
      R => '0'
    );
\rx_data_q1_r2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(16),
      Q => rx_data_q1_r2(10),
      R => '0'
    );
\rx_data_q1_r2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(17),
      Q => rx_data_q1_r2(11),
      R => '0'
    );
\rx_data_q1_r2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(1),
      Q => rx_data_q1_r2(1),
      R => '0'
    );
\rx_data_q1_r2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(2),
      Q => rx_data_q1_r2(2),
      R => '0'
    );
\rx_data_q1_r2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(3),
      Q => rx_data_q1_r2(3),
      R => '0'
    );
\rx_data_q1_r2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(4),
      Q => rx_data_q1_r2(4),
      R => '0'
    );
\rx_data_q1_r2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(5),
      Q => rx_data_q1_r2(5),
      R => '0'
    );
\rx_data_q1_r2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(12),
      Q => rx_data_q1_r2(6),
      R => '0'
    );
\rx_data_q1_r2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(13),
      Q => rx_data_q1_r2(7),
      R => '0'
    );
\rx_data_q1_r2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(14),
      Q => rx_data_q1_r2(8),
      R => '0'
    );
\rx_data_q1_r2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q1_r2_1,
      D => rx_data_shift(15),
      Q => rx_data_q1_r2(9),
      R => '0'
    );
\rx_data_q2_r2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(0),
      Q => rx_data_q2_r2(0),
      R => '0'
    );
\rx_data_q2_r2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(16),
      Q => rx_data_q2_r2(10),
      R => '0'
    );
\rx_data_q2_r2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(17),
      Q => rx_data_q2_r2(11),
      R => '0'
    );
\rx_data_q2_r2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(1),
      Q => rx_data_q2_r2(1),
      R => '0'
    );
\rx_data_q2_r2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(2),
      Q => rx_data_q2_r2(2),
      R => '0'
    );
\rx_data_q2_r2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(3),
      Q => rx_data_q2_r2(3),
      R => '0'
    );
\rx_data_q2_r2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(4),
      Q => rx_data_q2_r2(4),
      R => '0'
    );
\rx_data_q2_r2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(5),
      Q => rx_data_q2_r2(5),
      R => '0'
    );
\rx_data_q2_r2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(12),
      Q => rx_data_q2_r2(6),
      R => '0'
    );
\rx_data_q2_r2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(13),
      Q => rx_data_q2_r2(7),
      R => '0'
    );
\rx_data_q2_r2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(14),
      Q => rx_data_q2_r2(8),
      R => '0'
    );
\rx_data_q2_r2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q2_r2_0,
      D => rx_data_shift(15),
      Q => rx_data_q2_r2(9),
      R => '0'
    );
\rx_data_q_r1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(0),
      Q => rx_data_q_r1(0),
      R => '0'
    );
\rx_data_q_r1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(16),
      Q => rx_data_q_r1(10),
      R => '0'
    );
\rx_data_q_r1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(17),
      Q => rx_data_q_r1(11),
      R => '0'
    );
\rx_data_q_r1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(1),
      Q => rx_data_q_r1(1),
      R => '0'
    );
\rx_data_q_r1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(2),
      Q => rx_data_q_r1(2),
      R => '0'
    );
\rx_data_q_r1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(3),
      Q => rx_data_q_r1(3),
      R => '0'
    );
\rx_data_q_r1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(4),
      Q => rx_data_q_r1(4),
      R => '0'
    );
\rx_data_q_r1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(5),
      Q => rx_data_q_r1(5),
      R => '0'
    );
\rx_data_q_r1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(12),
      Q => rx_data_q_r1(6),
      R => '0'
    );
\rx_data_q_r1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(13),
      Q => rx_data_q_r1(7),
      R => '0'
    );
\rx_data_q_r1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(14),
      Q => rx_data_q_r1(8),
      R => '0'
    );
\rx_data_q_r1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => rx_data_q_r1_2,
      D => rx_data_shift(15),
      Q => rx_data_q_r1(9),
      R => '0'
    );
\rx_data_shift_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_iddr_n_dly(0),
      Q => rx_data_shift(0),
      R => '0'
    );
\rx_data_shift_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => p_3_out,
      Q => rx_data_shift(10),
      R => '0'
    );
\rx_data_shift_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => p_1_out,
      Q => rx_data_shift(11),
      R => '0'
    );
\rx_data_shift_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_shift(0),
      Q => rx_data_shift(12),
      R => '0'
    );
\rx_data_shift_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_shift(1),
      Q => rx_data_shift(13),
      R => '0'
    );
\rx_data_shift_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_shift(2),
      Q => rx_data_shift(14),
      R => '0'
    );
\rx_data_shift_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_shift(3),
      Q => rx_data_shift(15),
      R => '0'
    );
\rx_data_shift_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_shift(4),
      Q => rx_data_shift(16),
      R => '0'
    );
\rx_data_shift_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_shift(5),
      Q => rx_data_shift(17),
      R => '0'
    );
\rx_data_shift_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_shift(6),
      Q => rx_data_shift(18),
      R => '0'
    );
\rx_data_shift_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_shift(7),
      Q => rx_data_shift(19),
      R => '0'
    );
\rx_data_shift_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_iddr_n_dly(1),
      Q => rx_data_shift(1),
      R => '0'
    );
\rx_data_shift_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_shift(8),
      Q => rx_data_shift(20),
      R => '0'
    );
\rx_data_shift_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_shift(9),
      Q => rx_data_shift(21),
      R => '0'
    );
\rx_data_shift_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_shift(10),
      Q => rx_data_shift(22),
      R => '0'
    );
\rx_data_shift_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_shift(11),
      Q => rx_data_shift(23),
      R => '0'
    );
\rx_data_shift_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_iddr_n_dly(2),
      Q => rx_data_shift(2),
      R => '0'
    );
\rx_data_shift_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_iddr_n_dly(3),
      Q => rx_data_shift(3),
      R => '0'
    );
\rx_data_shift_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_iddr_n_dly(4),
      Q => rx_data_shift(4),
      R => '0'
    );
\rx_data_shift_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_iddr_n_dly(5),
      Q => rx_data_shift(5),
      R => '0'
    );
\rx_data_shift_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => p_11_out,
      Q => rx_data_shift(6),
      R => '0'
    );
\rx_data_shift_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => p_9_out,
      Q => rx_data_shift(7),
      R => '0'
    );
\rx_data_shift_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => p_7_out,
      Q => rx_data_shift(8),
      R => '0'
    );
\rx_data_shift_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => p_5_out,
      Q => rx_data_shift(9),
      R => '0'
    );
rx_error_r1_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FDBF"
    )
        port map (
      I0 => rx_frame_shift(0),
      I1 => rx_frame_shift(2),
      I2 => rx_frame_shift(3),
      I3 => rx_frame_shift(1),
      O => rx_error_r1_i_1_n_0
    );
rx_error_r1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_error_r1_i_1_n_0,
      Q => rx_error_r1,
      R => '0'
    );
rx_error_r2_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => rx_frame_shift(3),
      I1 => rx_frame_shift(2),
      I2 => rx_frame_shift(0),
      I3 => rx_frame_shift(1),
      O => rx_error_r2_i_1_n_0
    );
rx_error_r2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_error_r2_i_1_n_0,
      Q => rx_error_r2,
      R => '0'
    );
rx_frame_iddr_n_dly_reg: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_frame_iddr_n,
      Q => rx_frame_iddr_n_dly,
      R => '0'
    );
\rx_frame_shift_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_frame_iddr_n_dly,
      Q => rx_frame_shift(0),
      R => '0'
    );
\rx_frame_shift_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_frame_iddr_p,
      Q => rx_frame_shift(1),
      R => '0'
    );
\rx_frame_shift_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_frame_shift(0),
      Q => rx_frame_shift(2),
      R => '0'
    );
\rx_frame_shift_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_frame_shift(1),
      Q => rx_frame_shift(3),
      R => '0'
    );
rx_valid_r1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q_r1_2,
      Q => rx_valid_r1,
      R => '0'
    );
rx_valid_r2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => rx_data_q2_r2_0,
      Q => rx_valid_r2,
      R => '0'
    );
\tx_data_cnt[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => tx_data_sel(2),
      I1 => tx_data_cnt(0),
      O => \tx_data_cnt[0]_i_1_n_0\
    );
\tx_data_cnt[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"52F0"
    )
        port map (
      I0 => tx_data_sel(2),
      I1 => dac_mode_r1,
      I2 => tx_data_cnt(1),
      I3 => tx_data_cnt(0),
      O => \tx_data_cnt[1]_i_1_n_0\
    );
tx_data_cnt_flag_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAAEEEEE"
    )
        port map (
      I0 => dac_valid,
      I1 => tx_data_sel(2),
      I2 => dac_mode_r1,
      I3 => tx_data_cnt(1),
      I4 => tx_data_cnt(0),
      O => tx_data_cnt_flag_i_1_n_0
    );
tx_data_cnt_flag_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => tx_data_cnt_flag_i_1_n_0,
      Q => tx_data_sel(2),
      R => '0'
    );
\tx_data_cnt_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_cnt[0]_i_1_n_0\,
      Q => tx_data_cnt(0),
      R => '0'
    );
\tx_data_cnt_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_cnt[1]_i_1_n_0\,
      Q => tx_data_cnt(1),
      R => '0'
    );
\tx_data_i1_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i1(0),
      Q => \tx_data_i1_d_reg_n_0_[0]\,
      R => '0'
    );
\tx_data_i1_d_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i1(10),
      Q => data0(4),
      R => '0'
    );
\tx_data_i1_d_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i1(11),
      Q => data0(5),
      R => '0'
    );
\tx_data_i1_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i1(1),
      Q => \tx_data_i1_d_reg_n_0_[1]\,
      R => '0'
    );
\tx_data_i1_d_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i1(2),
      Q => \tx_data_i1_d_reg_n_0_[2]\,
      R => '0'
    );
\tx_data_i1_d_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i1(3),
      Q => \tx_data_i1_d_reg_n_0_[3]\,
      R => '0'
    );
\tx_data_i1_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i1(4),
      Q => \tx_data_i1_d_reg_n_0_[4]\,
      R => '0'
    );
\tx_data_i1_d_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i1(5),
      Q => \tx_data_i1_d_reg_n_0_[5]\,
      R => '0'
    );
\tx_data_i1_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i1(6),
      Q => data0(0),
      R => '0'
    );
\tx_data_i1_d_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i1(7),
      Q => data0(1),
      R => '0'
    );
\tx_data_i1_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i1(8),
      Q => data0(2),
      R => '0'
    );
\tx_data_i1_d_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i1(9),
      Q => data0(3),
      R => '0'
    );
\tx_data_i2_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i2(0),
      Q => \tx_data_i2_d_reg_n_0_[0]\,
      R => '0'
    );
\tx_data_i2_d_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i2(10),
      Q => data2(4),
      R => '0'
    );
\tx_data_i2_d_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i2(11),
      Q => data2(5),
      R => '0'
    );
\tx_data_i2_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i2(1),
      Q => \tx_data_i2_d_reg_n_0_[1]\,
      R => '0'
    );
\tx_data_i2_d_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i2(2),
      Q => \tx_data_i2_d_reg_n_0_[2]\,
      R => '0'
    );
\tx_data_i2_d_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i2(3),
      Q => \tx_data_i2_d_reg_n_0_[3]\,
      R => '0'
    );
\tx_data_i2_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i2(4),
      Q => \tx_data_i2_d_reg_n_0_[4]\,
      R => '0'
    );
\tx_data_i2_d_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i2(5),
      Q => \tx_data_i2_d_reg_n_0_[5]\,
      R => '0'
    );
\tx_data_i2_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i2(6),
      Q => data2(0),
      R => '0'
    );
\tx_data_i2_d_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i2(7),
      Q => data2(1),
      R => '0'
    );
\tx_data_i2_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i2(8),
      Q => data2(2),
      R => '0'
    );
\tx_data_i2_d_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_i2(9),
      Q => data2(3),
      R => '0'
    );
\tx_data_n[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => tx_data_q2_d(0),
      I1 => tx_data_q1_d(0),
      I2 => tx_data_cnt(0),
      I3 => tx_data_q2_d(6),
      I4 => tx_data_cnt(1),
      I5 => tx_data_q1_d(6),
      O => \tx_data_n[0]_i_1_n_0\
    );
\tx_data_n[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => tx_data_q2_d(1),
      I1 => tx_data_q1_d(1),
      I2 => tx_data_cnt(0),
      I3 => tx_data_q2_d(7),
      I4 => tx_data_cnt(1),
      I5 => tx_data_q1_d(7),
      O => \tx_data_n[1]_i_1_n_0\
    );
\tx_data_n[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => tx_data_q2_d(2),
      I1 => tx_data_q1_d(2),
      I2 => tx_data_cnt(0),
      I3 => tx_data_q2_d(8),
      I4 => tx_data_cnt(1),
      I5 => tx_data_q1_d(8),
      O => \tx_data_n[2]_i_1_n_0\
    );
\tx_data_n[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => tx_data_q2_d(3),
      I1 => tx_data_q1_d(3),
      I2 => tx_data_cnt(0),
      I3 => tx_data_q2_d(9),
      I4 => tx_data_cnt(1),
      I5 => tx_data_q1_d(9),
      O => \tx_data_n[3]_i_1_n_0\
    );
\tx_data_n[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => tx_data_q2_d(4),
      I1 => tx_data_q1_d(4),
      I2 => tx_data_cnt(0),
      I3 => tx_data_q2_d(10),
      I4 => tx_data_cnt(1),
      I5 => tx_data_q1_d(10),
      O => \tx_data_n[4]_i_1_n_0\
    );
\tx_data_n[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => tx_data_q2_d(5),
      I1 => tx_data_q1_d(5),
      I2 => tx_data_cnt(0),
      I3 => tx_data_q2_d(11),
      I4 => tx_data_cnt(1),
      I5 => tx_data_q1_d(11),
      O => \tx_data_n[5]_i_1_n_0\
    );
\tx_data_n_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_n[0]_i_1_n_0\,
      Q => \tx_data_n_reg_n_0_[0]\,
      R => \tx_data_p[5]_i_1_n_0\
    );
\tx_data_n_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_n[1]_i_1_n_0\,
      Q => \tx_data_n_reg_n_0_[1]\,
      R => \tx_data_p[5]_i_1_n_0\
    );
\tx_data_n_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_n[2]_i_1_n_0\,
      Q => \tx_data_n_reg_n_0_[2]\,
      R => \tx_data_p[5]_i_1_n_0\
    );
\tx_data_n_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_n[3]_i_1_n_0\,
      Q => \tx_data_n_reg_n_0_[3]\,
      R => \tx_data_p[5]_i_1_n_0\
    );
\tx_data_n_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_n[4]_i_1_n_0\,
      Q => \tx_data_n_reg_n_0_[4]\,
      R => \tx_data_p[5]_i_1_n_0\
    );
\tx_data_n_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_n[5]_i_1_n_0\,
      Q => \tx_data_n_reg_n_0_[5]\,
      R => \tx_data_p[5]_i_1_n_0\
    );
\tx_data_p[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \tx_data_i2_d_reg_n_0_[0]\,
      I1 => \tx_data_i1_d_reg_n_0_[0]\,
      I2 => tx_data_cnt(0),
      I3 => data2(0),
      I4 => tx_data_cnt(1),
      I5 => data0(0),
      O => \tx_data_p[0]_i_1_n_0\
    );
\tx_data_p[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \tx_data_i2_d_reg_n_0_[1]\,
      I1 => \tx_data_i1_d_reg_n_0_[1]\,
      I2 => tx_data_cnt(0),
      I3 => data2(1),
      I4 => tx_data_cnt(1),
      I5 => data0(1),
      O => \tx_data_p[1]_i_1_n_0\
    );
\tx_data_p[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \tx_data_i2_d_reg_n_0_[2]\,
      I1 => \tx_data_i1_d_reg_n_0_[2]\,
      I2 => tx_data_cnt(0),
      I3 => data2(2),
      I4 => tx_data_cnt(1),
      I5 => data0(2),
      O => \tx_data_p[2]_i_1_n_0\
    );
\tx_data_p[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \tx_data_i2_d_reg_n_0_[3]\,
      I1 => \tx_data_i1_d_reg_n_0_[3]\,
      I2 => tx_data_cnt(0),
      I3 => data2(3),
      I4 => tx_data_cnt(1),
      I5 => data0(3),
      O => \tx_data_p[3]_i_1_n_0\
    );
\tx_data_p[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \tx_data_i2_d_reg_n_0_[4]\,
      I1 => \tx_data_i1_d_reg_n_0_[4]\,
      I2 => tx_data_cnt(0),
      I3 => data2(4),
      I4 => tx_data_cnt(1),
      I5 => data0(4),
      O => \tx_data_p[4]_i_1_n_0\
    );
\tx_data_p[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D5"
    )
        port map (
      I0 => tx_data_sel(2),
      I1 => dac_mode_r1,
      I2 => tx_data_cnt(1),
      O => \tx_data_p[5]_i_1_n_0\
    );
\tx_data_p[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \tx_data_i2_d_reg_n_0_[5]\,
      I1 => \tx_data_i1_d_reg_n_0_[5]\,
      I2 => tx_data_cnt(0),
      I3 => data2(5),
      I4 => tx_data_cnt(1),
      I5 => data0(5),
      O => \tx_data_p[5]_i_2_n_0\
    );
\tx_data_p_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_p[0]_i_1_n_0\,
      Q => \tx_data_p_reg_n_0_[0]\,
      R => \tx_data_p[5]_i_1_n_0\
    );
\tx_data_p_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_p[1]_i_1_n_0\,
      Q => \tx_data_p_reg_n_0_[1]\,
      R => \tx_data_p[5]_i_1_n_0\
    );
\tx_data_p_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_p[2]_i_1_n_0\,
      Q => \tx_data_p_reg_n_0_[2]\,
      R => \tx_data_p[5]_i_1_n_0\
    );
\tx_data_p_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_p[3]_i_1_n_0\,
      Q => \tx_data_p_reg_n_0_[3]\,
      R => \tx_data_p[5]_i_1_n_0\
    );
\tx_data_p_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_p[4]_i_1_n_0\,
      Q => \tx_data_p_reg_n_0_[4]\,
      R => \tx_data_p[5]_i_1_n_0\
    );
\tx_data_p_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => \tx_data_p[5]_i_2_n_0\,
      Q => \tx_data_p_reg_n_0_[5]\,
      R => \tx_data_p[5]_i_1_n_0\
    );
\tx_data_q1_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q1(0),
      Q => tx_data_q1_d(0),
      R => '0'
    );
\tx_data_q1_d_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q1(10),
      Q => tx_data_q1_d(10),
      R => '0'
    );
\tx_data_q1_d_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q1(11),
      Q => tx_data_q1_d(11),
      R => '0'
    );
\tx_data_q1_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q1(1),
      Q => tx_data_q1_d(1),
      R => '0'
    );
\tx_data_q1_d_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q1(2),
      Q => tx_data_q1_d(2),
      R => '0'
    );
\tx_data_q1_d_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q1(3),
      Q => tx_data_q1_d(3),
      R => '0'
    );
\tx_data_q1_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q1(4),
      Q => tx_data_q1_d(4),
      R => '0'
    );
\tx_data_q1_d_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q1(5),
      Q => tx_data_q1_d(5),
      R => '0'
    );
\tx_data_q1_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q1(6),
      Q => tx_data_q1_d(6),
      R => '0'
    );
\tx_data_q1_d_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q1(7),
      Q => tx_data_q1_d(7),
      R => '0'
    );
\tx_data_q1_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q1(8),
      Q => tx_data_q1_d(8),
      R => '0'
    );
\tx_data_q1_d_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q1(9),
      Q => tx_data_q1_d(9),
      R => '0'
    );
\tx_data_q2_d_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q2(0),
      Q => tx_data_q2_d(0),
      R => '0'
    );
\tx_data_q2_d_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q2(10),
      Q => tx_data_q2_d(10),
      R => '0'
    );
\tx_data_q2_d_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q2(11),
      Q => tx_data_q2_d(11),
      R => '0'
    );
\tx_data_q2_d_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q2(1),
      Q => tx_data_q2_d(1),
      R => '0'
    );
\tx_data_q2_d_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q2(2),
      Q => tx_data_q2_d(2),
      R => '0'
    );
\tx_data_q2_d_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q2(3),
      Q => tx_data_q2_d(3),
      R => '0'
    );
\tx_data_q2_d_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q2(4),
      Q => tx_data_q2_d(4),
      R => '0'
    );
\tx_data_q2_d_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q2(5),
      Q => tx_data_q2_d(5),
      R => '0'
    );
\tx_data_q2_d_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q2(6),
      Q => tx_data_q2_d(6),
      R => '0'
    );
\tx_data_q2_d_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q2(7),
      Q => tx_data_q2_d(7),
      R => '0'
    );
\tx_data_q2_d_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q2(8),
      Q => tx_data_q2_d(8),
      R => '0'
    );
\tx_data_q2_d_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => \^data_clk\,
      CE => dac_valid,
      D => dac_data_q2(9),
      Q => tx_data_q2_d(9),
      R => '0'
    );
tx_frame_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0070"
    )
        port map (
      I0 => dac_mode_r1,
      I1 => tx_data_cnt(0),
      I2 => tx_data_sel(2),
      I3 => tx_data_cnt(1),
      O => tx_frame_i_1_n_0
    );
tx_frame_reg: unisim.vcomponents.FDRE
     port map (
      C => \^data_clk\,
      CE => '1',
      D => tx_frame_i_1_n_0,
      Q => tx_frame,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_ad9361_if_idelay_0_0 is
  port (
    idelay_clk_200m : in STD_LOGIC;
    rst_n : in STD_LOGIC;
    data_clk : out STD_LOGIC;
    ap_rst_n : out STD_LOGIC;
    rx_clk_in_p : in STD_LOGIC;
    rx_clk_in_n : in STD_LOGIC;
    rx_data_in_p : in STD_LOGIC_VECTOR ( 5 downto 0 );
    rx_data_in_n : in STD_LOGIC_VECTOR ( 5 downto 0 );
    rx_frame_in_p : in STD_LOGIC;
    rx_frame_in_n : in STD_LOGIC;
    tx_clk_out_p : out STD_LOGIC;
    tx_clk_out_n : out STD_LOGIC;
    tx_frame_out_p : out STD_LOGIC;
    tx_frame_out_n : out STD_LOGIC;
    tx_data_out_p : out STD_LOGIC_VECTOR ( 5 downto 0 );
    tx_data_out_n : out STD_LOGIC_VECTOR ( 5 downto 0 );
    adc_valid : out STD_LOGIC;
    adc_data_i1 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    adc_data_q1 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    adc_data_i2 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    adc_data_q2 : out STD_LOGIC_VECTOR ( 11 downto 0 );
    adc_status : out STD_LOGIC;
    dac_valid : in STD_LOGIC;
    dac_data_i1 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dac_data_q1 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dac_data_i2 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dac_data_q2 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    idly_en : in STD_LOGIC_VECTOR ( 6 downto 0 );
    idly_d : in STD_LOGIC_VECTOR ( 4 downto 0 );
    data_clk_ce : in STD_LOGIC;
    adc_mode_r1 : in STD_LOGIC;
    dac_mode_r1 : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_ad9361_if_idelay_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_ad9361_if_idelay_0_0 : entity is "design_1_ad9361_if_idelay_0_0,ad9361_if_idelay,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_ad9361_if_idelay_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_ad9361_if_idelay_0_0 : entity is "package_project";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_ad9361_if_idelay_0_0 : entity is "ad9361_if_idelay,Vivado 2019.2";
end design_1_ad9361_if_idelay_0_0;

architecture STRUCTURE of design_1_ad9361_if_idelay_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of data_clk : signal is "xilinx.com:signal:clock:1.0 data_clk CLK";
  attribute X_INTERFACE_PARAMETER of data_clk : signal is "XIL_INTERFACENAME data_clk, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_ad9361_if_idelay_0_0_data_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 rst_n RST";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.design_1_ad9361_if_idelay_0_0_ad9361_if_idelay
     port map (
      adc_data_i1(11 downto 0) => adc_data_i1(11 downto 0),
      adc_data_i2(11 downto 0) => adc_data_i2(11 downto 0),
      adc_data_q1(11 downto 0) => adc_data_q1(11 downto 0),
      adc_data_q2(11 downto 0) => adc_data_q2(11 downto 0),
      adc_mode_r1 => adc_mode_r1,
      adc_status => adc_status,
      adc_valid => adc_valid,
      ap_rst_n => ap_rst_n,
      dac_data_i1(11 downto 0) => dac_data_i1(11 downto 0),
      dac_data_i2(11 downto 0) => dac_data_i2(11 downto 0),
      dac_data_q1(11 downto 0) => dac_data_q1(11 downto 0),
      dac_data_q2(11 downto 0) => dac_data_q2(11 downto 0),
      dac_mode_r1 => dac_mode_r1,
      dac_valid => dac_valid,
      data_clk => data_clk,
      data_clk_ce => data_clk_ce,
      idelay_clk_200m => idelay_clk_200m,
      idly_d(4 downto 0) => idly_d(4 downto 0),
      idly_en(6 downto 0) => idly_en(6 downto 0),
      rst_n => rst_n,
      rx_clk_in_n => rx_clk_in_n,
      rx_clk_in_p => rx_clk_in_p,
      rx_data_in_n(5 downto 0) => rx_data_in_n(5 downto 0),
      rx_data_in_p(5 downto 0) => rx_data_in_p(5 downto 0),
      rx_frame_in_n => rx_frame_in_n,
      rx_frame_in_p => rx_frame_in_p,
      tx_clk_out_n => tx_clk_out_n,
      tx_clk_out_p => tx_clk_out_p,
      tx_data_out_n(5 downto 0) => tx_data_out_n(5 downto 0),
      tx_data_out_p(5 downto 0) => tx_data_out_p(5 downto 0),
      tx_frame_out_n => tx_frame_out_n,
      tx_frame_out_p => tx_frame_out_p
    );
end STRUCTURE;
