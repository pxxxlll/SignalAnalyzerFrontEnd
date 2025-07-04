-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Mon Aug 28 11:51:05 2023
-- Host        : MJ_FPGA running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_uifdma_dbuf_0_0_stub.vhdl
-- Design      : design_1_uifdma_dbuf_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    S_AXI_ACLK : in STD_LOGIC;
    S_AXI_ARESETN : in STD_LOGIC;
    S_AXI_AWADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_AWPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_AWVALID : in STD_LOGIC;
    S_AXI_AWREADY : out STD_LOGIC;
    S_AXI_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_WVALID : in STD_LOGIC;
    S_AXI_WREADY : out STD_LOGIC;
    S_AXI_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_BVALID : out STD_LOGIC;
    S_AXI_BREADY : in STD_LOGIC;
    S_AXI_ARADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    S_AXI_ARPROT : in STD_LOGIC_VECTOR ( 2 downto 0 );
    S_AXI_ARVALID : in STD_LOGIC;
    S_AXI_ARREADY : out STD_LOGIC;
    S_AXI_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    S_AXI_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    S_AXI_RVALID : out STD_LOGIC;
    S_AXI_RREADY : in STD_LOGIC;
    ud_wclk : in STD_LOGIC;
    ud_wvs : in STD_LOGIC;
    ud_wde : in STD_LOGIC;
    ud_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    wbuf_sync_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    wbuf_sync_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ud_rclk : in STD_LOGIC;
    ud_rvs : in STD_LOGIC;
    ud_rde : in STD_LOGIC;
    ud_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rbuf_sync_o : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rbuf_sync_i : in STD_LOGIC_VECTOR ( 7 downto 0 );
    fdma_waddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    fdma_wareq : out STD_LOGIC;
    fdma_wsize : out STD_LOGIC_VECTOR ( 15 downto 0 );
    fdma_wbusy : in STD_LOGIC;
    fdma_wdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    fdma_wvalid : in STD_LOGIC;
    fdma_wready : out STD_LOGIC;
    fdma_wirq : out STD_LOGIC;
    fdma_raddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    fdma_rareq : out STD_LOGIC;
    fdma_rsize : out STD_LOGIC_VECTOR ( 15 downto 0 );
    fdma_rbusy : in STD_LOGIC;
    fdma_rdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    fdma_rvalid : in STD_LOGIC;
    fdma_rready : out STD_LOGIC;
    fdma_rirq : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "S_AXI_ACLK,S_AXI_ARESETN,S_AXI_AWADDR[3:0],S_AXI_AWPROT[2:0],S_AXI_AWVALID,S_AXI_AWREADY,S_AXI_WDATA[31:0],S_AXI_WSTRB[3:0],S_AXI_WVALID,S_AXI_WREADY,S_AXI_BRESP[1:0],S_AXI_BVALID,S_AXI_BREADY,S_AXI_ARADDR[3:0],S_AXI_ARPROT[2:0],S_AXI_ARVALID,S_AXI_ARREADY,S_AXI_RDATA[31:0],S_AXI_RRESP[1:0],S_AXI_RVALID,S_AXI_RREADY,ud_wclk,ud_wvs,ud_wde,ud_wdata[31:0],wbuf_sync_o[7:0],wbuf_sync_i[7:0],ud_rclk,ud_rvs,ud_rde,ud_rdata[31:0],rbuf_sync_o[7:0],rbuf_sync_i[7:0],fdma_waddr[31:0],fdma_wareq,fdma_wsize[15:0],fdma_wbusy,fdma_wdata[127:0],fdma_wvalid,fdma_wready,fdma_wirq,fdma_raddr[31:0],fdma_rareq,fdma_rsize[15:0],fdma_rbusy,fdma_rdata[127:0],fdma_rvalid,fdma_rready,fdma_rirq";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "uifdma_dbuf,Vivado 2019.2";
begin
end;
