// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:uifdma_dbuf:3.0
// IP Revision: 6

(* X_CORE_INFO = "uifdma_dbuf,Vivado 2019.2" *)
(* CHECK_LICENSE_TYPE = "design_1_uifdma_dbuf_0_0,uifdma_dbuf,{}" *)
(* CORE_GENERATION_INFO = "design_1_uifdma_dbuf_0_0,uifdma_dbuf,{x_ipProduct=Vivado 2019.2,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=uifdma_dbuf,x_ipVersion=3.0,x_ipCoreRevision=6,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,AXI_Lite=true,VIDEO_ENABLE=false,ENABLE_WRITE=true,ENABLE_READ=false,AXI_DATA_WIDTH=128,AXI_ADDR_WIDTH=32,W_BUFDEPTH=2048,W_DATAWIDTH=128,W_BASEADDR=0x08000000,W_DSIZEBITS=23,W_XSIZE=2048,W_XSTRIDE=2048,W_YSIZE=32,W_XDIV=2,W_BUFSIZE=3,R_BUFDEPTH=2048,R_DATAWIDTH=32,R_BASEADDR=0x10000000,R_DSIZEBIT\
S=24,R_XSIZE=1920,R_XSTRIDE=1920,R_YSIZE=1080,R_XDIV=2,R_BUFSIZE=3}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_uifdma_dbuf_0_0 (
  S_AXI_ACLK,
  S_AXI_ARESETN,
  S_AXI_AWADDR,
  S_AXI_AWPROT,
  S_AXI_AWVALID,
  S_AXI_AWREADY,
  S_AXI_WDATA,
  S_AXI_WSTRB,
  S_AXI_WVALID,
  S_AXI_WREADY,
  S_AXI_BRESP,
  S_AXI_BVALID,
  S_AXI_BREADY,
  S_AXI_ARADDR,
  S_AXI_ARPROT,
  S_AXI_ARVALID,
  S_AXI_ARREADY,
  S_AXI_RDATA,
  S_AXI_RRESP,
  S_AXI_RVALID,
  S_AXI_RREADY,
  ud_wclk,
  ud_wvs,
  ud_wde,
  ud_wdata,
  wbuf_sync_o,
  wbuf_sync_i,
  ud_rclk,
  ud_rvs,
  ud_rde,
  ud_rdata,
  rbuf_sync_o,
  rbuf_sync_i,
  fdma_waddr,
  fdma_wareq,
  fdma_wsize,
  fdma_wbusy,
  fdma_wdata,
  fdma_wvalid,
  fdma_wready,
  fdma_wirq,
  fdma_raddr,
  fdma_rareq,
  fdma_rsize,
  fdma_rbusy,
  fdma_rdata,
  fdma_rvalid,
  fdma_rready,
  fdma_rirq
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI, ASSOCIATED_RESET S_AXI_ARESETN, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK" *)
input wire S_AXI_ACLK;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST" *)
input wire S_AXI_ARESETN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *)
input wire [3 : 0] S_AXI_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWPROT" *)
input wire [2 : 0] S_AXI_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *)
input wire S_AXI_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *)
output wire S_AXI_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *)
input wire [31 : 0] S_AXI_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *)
input wire [3 : 0] S_AXI_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *)
input wire S_AXI_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *)
output wire S_AXI_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *)
output wire [1 : 0] S_AXI_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *)
output wire S_AXI_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *)
input wire S_AXI_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *)
input wire [3 : 0] S_AXI_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARPROT" *)
input wire [2 : 0] S_AXI_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *)
input wire S_AXI_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *)
output wire S_AXI_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *)
output wire [31 : 0] S_AXI_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *)
output wire [1 : 0] S_AXI_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *)
output wire S_AXI_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, NUM_READ_THREADS\
 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *)
input wire S_AXI_RREADY;
input wire ud_wclk;
input wire ud_wvs;
input wire ud_wde;
input wire [127 : 0] ud_wdata;
output wire [7 : 0] wbuf_sync_o;
input wire [7 : 0] wbuf_sync_i;
input wire ud_rclk;
input wire ud_rvs;
input wire ud_rde;
output wire [31 : 0] ud_rdata;
output wire [7 : 0] rbuf_sync_o;
input wire [7 : 0] rbuf_sync_i;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_waddr" *)
output wire [31 : 0] fdma_waddr;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_wareq" *)
output wire fdma_wareq;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_wsize" *)
output wire [15 : 0] fdma_wsize;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_wbusy" *)
input wire fdma_wbusy;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_wdata" *)
output wire [127 : 0] fdma_wdata;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_wvalid" *)
input wire fdma_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_wready" *)
output wire fdma_wready;
output wire fdma_wirq;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_raddr" *)
output wire [31 : 0] fdma_raddr;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_rareq" *)
output wire fdma_rareq;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_rsize" *)
output wire [15 : 0] fdma_rsize;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_rbusy" *)
input wire fdma_rbusy;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_rdata" *)
input wire [127 : 0] fdma_rdata;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_rvalid" *)
input wire fdma_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:user:FDMA:1.0 FDMA_M fdma_rready" *)
output wire fdma_rready;
output wire fdma_rirq;

  uifdma_dbuf #(
    .AXI_Lite(1'B1),
    .VIDEO_ENABLE(1'B0),
    .ENABLE_WRITE(1'B1),
    .ENABLE_READ(1'B0),
    .AXI_DATA_WIDTH(128),
    .AXI_ADDR_WIDTH(32),
    .W_BUFDEPTH(2048),
    .W_DATAWIDTH(128),
    .W_BASEADDR('H08000000),
    .W_DSIZEBITS(23),
    .W_XSIZE(2048),
    .W_XSTRIDE(2048),
    .W_YSIZE(32),
    .W_XDIV(2),
    .W_BUFSIZE(3),
    .R_BUFDEPTH(2048),
    .R_DATAWIDTH(32),
    .R_BASEADDR('H10000000),
    .R_DSIZEBITS(24),
    .R_XSIZE(1920),
    .R_XSTRIDE(1920),
    .R_YSIZE(1080),
    .R_XDIV(2),
    .R_BUFSIZE(3)
  ) inst (
    .S_AXI_ACLK(S_AXI_ACLK),
    .S_AXI_ARESETN(S_AXI_ARESETN),
    .S_AXI_AWADDR(S_AXI_AWADDR),
    .S_AXI_AWPROT(S_AXI_AWPROT),
    .S_AXI_AWVALID(S_AXI_AWVALID),
    .S_AXI_AWREADY(S_AXI_AWREADY),
    .S_AXI_WDATA(S_AXI_WDATA),
    .S_AXI_WSTRB(S_AXI_WSTRB),
    .S_AXI_WVALID(S_AXI_WVALID),
    .S_AXI_WREADY(S_AXI_WREADY),
    .S_AXI_BRESP(S_AXI_BRESP),
    .S_AXI_BVALID(S_AXI_BVALID),
    .S_AXI_BREADY(S_AXI_BREADY),
    .S_AXI_ARADDR(S_AXI_ARADDR),
    .S_AXI_ARPROT(S_AXI_ARPROT),
    .S_AXI_ARVALID(S_AXI_ARVALID),
    .S_AXI_ARREADY(S_AXI_ARREADY),
    .S_AXI_RDATA(S_AXI_RDATA),
    .S_AXI_RRESP(S_AXI_RRESP),
    .S_AXI_RVALID(S_AXI_RVALID),
    .S_AXI_RREADY(S_AXI_RREADY),
    .ud_wclk(ud_wclk),
    .ud_wvs(ud_wvs),
    .ud_wde(ud_wde),
    .ud_wdata(ud_wdata),
    .wbuf_sync_o(wbuf_sync_o),
    .wbuf_sync_i(wbuf_sync_i),
    .ud_rclk(ud_rclk),
    .ud_rvs(ud_rvs),
    .ud_rde(ud_rde),
    .ud_rdata(ud_rdata),
    .rbuf_sync_o(rbuf_sync_o),
    .rbuf_sync_i(rbuf_sync_i),
    .fdma_waddr(fdma_waddr),
    .fdma_wareq(fdma_wareq),
    .fdma_wsize(fdma_wsize),
    .fdma_wbusy(fdma_wbusy),
    .fdma_wdata(fdma_wdata),
    .fdma_wvalid(fdma_wvalid),
    .fdma_wready(fdma_wready),
    .fdma_wirq(fdma_wirq),
    .fdma_raddr(fdma_raddr),
    .fdma_rareq(fdma_rareq),
    .fdma_rsize(fdma_rsize),
    .fdma_rbusy(fdma_rbusy),
    .fdma_rdata(fdma_rdata),
    .fdma_rvalid(fdma_rvalid),
    .fdma_rready(fdma_rready),
    .fdma_rirq(fdma_rirq)
  );
endmodule
