// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Aug 29 09:36:46 2023
// Host        : MJ_FPGA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/12_RFMU/05_coding/RFMU_v0_6_0/soc_prj/zed_9361/zed_9361.srcs/sources_1/bd/design_1/ip/design_1_uifdma_dbuf_0_0/design_1_uifdma_dbuf_0_0_stub.v
// Design      : design_1_uifdma_dbuf_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "uifdma_dbuf,Vivado 2019.2" *)
module design_1_uifdma_dbuf_0_0(S_AXI_ACLK, S_AXI_ARESETN, S_AXI_AWADDR, 
  S_AXI_AWPROT, S_AXI_AWVALID, S_AXI_AWREADY, S_AXI_WDATA, S_AXI_WSTRB, S_AXI_WVALID, 
  S_AXI_WREADY, S_AXI_BRESP, S_AXI_BVALID, S_AXI_BREADY, S_AXI_ARADDR, S_AXI_ARPROT, 
  S_AXI_ARVALID, S_AXI_ARREADY, S_AXI_RDATA, S_AXI_RRESP, S_AXI_RVALID, S_AXI_RREADY, ud_wclk, 
  ud_wvs, ud_wde, ud_wdata, wbuf_sync_o, wbuf_sync_i, ud_rclk, ud_rvs, ud_rde, ud_rdata, rbuf_sync_o, 
  rbuf_sync_i, fdma_waddr, fdma_wareq, fdma_wsize, fdma_wbusy, fdma_wdata, fdma_wvalid, 
  fdma_wready, fdma_wirq, fdma_raddr, fdma_rareq, fdma_rsize, fdma_rbusy, fdma_rdata, 
  fdma_rvalid, fdma_rready, fdma_rirq)
/* synthesis syn_black_box black_box_pad_pin="S_AXI_ACLK,S_AXI_ARESETN,S_AXI_AWADDR[3:0],S_AXI_AWPROT[2:0],S_AXI_AWVALID,S_AXI_AWREADY,S_AXI_WDATA[31:0],S_AXI_WSTRB[3:0],S_AXI_WVALID,S_AXI_WREADY,S_AXI_BRESP[1:0],S_AXI_BVALID,S_AXI_BREADY,S_AXI_ARADDR[3:0],S_AXI_ARPROT[2:0],S_AXI_ARVALID,S_AXI_ARREADY,S_AXI_RDATA[31:0],S_AXI_RRESP[1:0],S_AXI_RVALID,S_AXI_RREADY,ud_wclk,ud_wvs,ud_wde,ud_wdata[127:0],wbuf_sync_o[7:0],wbuf_sync_i[7:0],ud_rclk,ud_rvs,ud_rde,ud_rdata[31:0],rbuf_sync_o[7:0],rbuf_sync_i[7:0],fdma_waddr[31:0],fdma_wareq,fdma_wsize[15:0],fdma_wbusy,fdma_wdata[127:0],fdma_wvalid,fdma_wready,fdma_wirq,fdma_raddr[31:0],fdma_rareq,fdma_rsize[15:0],fdma_rbusy,fdma_rdata[127:0],fdma_rvalid,fdma_rready,fdma_rirq" */;
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [3:0]S_AXI_AWADDR;
  input [2:0]S_AXI_AWPROT;
  input S_AXI_AWVALID;
  output S_AXI_AWREADY;
  input [31:0]S_AXI_WDATA;
  input [3:0]S_AXI_WSTRB;
  input S_AXI_WVALID;
  output S_AXI_WREADY;
  output [1:0]S_AXI_BRESP;
  output S_AXI_BVALID;
  input S_AXI_BREADY;
  input [3:0]S_AXI_ARADDR;
  input [2:0]S_AXI_ARPROT;
  input S_AXI_ARVALID;
  output S_AXI_ARREADY;
  output [31:0]S_AXI_RDATA;
  output [1:0]S_AXI_RRESP;
  output S_AXI_RVALID;
  input S_AXI_RREADY;
  input ud_wclk;
  input ud_wvs;
  input ud_wde;
  input [127:0]ud_wdata;
  output [7:0]wbuf_sync_o;
  input [7:0]wbuf_sync_i;
  input ud_rclk;
  input ud_rvs;
  input ud_rde;
  output [31:0]ud_rdata;
  output [7:0]rbuf_sync_o;
  input [7:0]rbuf_sync_i;
  output [31:0]fdma_waddr;
  output fdma_wareq;
  output [15:0]fdma_wsize;
  input fdma_wbusy;
  output [127:0]fdma_wdata;
  input fdma_wvalid;
  output fdma_wready;
  output fdma_wirq;
  output [31:0]fdma_raddr;
  output fdma_rareq;
  output [15:0]fdma_rsize;
  input fdma_rbusy;
  input [127:0]fdma_rdata;
  input fdma_rvalid;
  output fdma_rready;
  output fdma_rirq;
endmodule
