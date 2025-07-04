-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Mon Aug 28 11:51:01 2023
-- Host        : MJ_FPGA running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/12_RFMU/RFMU_v0_5_3/soc_prj/zed_9361/zed_9361.srcs/sources_1/bd/design_1/ip/design_1_ad9361_if_idelay_0_0/design_1_ad9361_if_idelay_0_0_stub.vhdl
-- Design      : design_1_ad9361_if_idelay_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_ad9361_if_idelay_0_0 is
  Port ( 
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

end design_1_ad9361_if_idelay_0_0;

architecture stub of design_1_ad9361_if_idelay_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "idelay_clk_200m,rst_n,data_clk,ap_rst_n,rx_clk_in_p,rx_clk_in_n,rx_data_in_p[5:0],rx_data_in_n[5:0],rx_frame_in_p,rx_frame_in_n,tx_clk_out_p,tx_clk_out_n,tx_frame_out_p,tx_frame_out_n,tx_data_out_p[5:0],tx_data_out_n[5:0],adc_valid,adc_data_i1[11:0],adc_data_q1[11:0],adc_data_i2[11:0],adc_data_q2[11:0],adc_status,dac_valid,dac_data_i1[11:0],dac_data_q1[11:0],dac_data_i2[11:0],dac_data_q2[11:0],idly_en[6:0],idly_d[4:0],data_clk_ce,adc_mode_r1,dac_mode_r1";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "ad9361_if_idelay,Vivado 2019.2";
begin
end;
