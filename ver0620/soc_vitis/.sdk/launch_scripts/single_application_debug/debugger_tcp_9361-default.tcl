connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248A39C1E" && level==0} -index 1
fpga -file F:/Ming_Jian/16QAM/16M_16QAM/zed_9361_1107_1Msys/zed_9361_1107_1Msys/zed_9361.runs/impl_1/system_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw F:/Ming_Jian/16QAM/16M_16QAM/zed_9361_1107_1Msys/soc_vitis/zed_9361_tcp/export/zed_9361_tcp/hw/system_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source F:/Ming_Jian/16QAM/16M_16QAM/zed_9361_1107_1Msys/soc_vitis/tcp_9361/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow F:/Ming_Jian/16QAM/16M_16QAM/zed_9361_1107_1Msys/soc_vitis/tcp_9361/Debug/tcp_9361.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
