-makelib ies_lib/xilinx_vip -sv \
  "H:/VIVADO2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "H:/VIVADO2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "H:/VIVADO2019.2/Vivado/2019.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "H:/VIVADO2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "H:/VIVADO2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "H:/VIVADO2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "H:/VIVADO2019.2/Vivado/2019.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "H:/VIVADO2019.2/Vivado/2019.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "H:/VIVADO2019.2/Vivado/2019.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xpm -sv \
  "H:/VIVADO2019.2/Vivado/2019.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "H:/VIVADO2019.2/Vivado/2019.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "H:/VIVADO2019.2/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "H:/VIVADO2019.2/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_4 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../zed_9361.srcs/sources_1/ip/blk_mem_gen_I/sim/blk_mem_gen_I.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

