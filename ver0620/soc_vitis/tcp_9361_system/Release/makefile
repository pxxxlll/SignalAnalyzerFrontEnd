#
# This file was created by Xilinx Vitis tool.
#


#
# tools
#

RM = rm -f
RMDIR = rm -rf

#
# variables
#

SDCARD_GEN = sdcard_gen
GENERATE_BIF = ::scw::generate_bif

XPFM_PATH = D:/12_RFMU/05_coding/RFMU_v0_6_3/soc_vitis/zed_9361_tcp/export/zed_9361_tcp/zed_9361_tcp.xpfm
SYS_CONFIG = zed_9361_tcp
DOMAINS = standalone_domain
BIF_PATH = D:/Vivado_2019/Ming_Jian/16QAM/16M_16QAM/zed_9361_1107_1Msys/soc_vitis/tcp_9361_system/Release/system.bif

SD_FILES = --elf D:/Vivado_2019/Ming_Jian/16QAM/16M_16QAM/zed_9361_1107_1Msys/soc_vitis/tcp_9361/Release/tcp_9361.elf,ps7_cortexa9_0

#
# primary build targets
#

all: sd_card

sd_card:
	-@echo Generating bif file for the system project
	generate_system_bif.bat 57979 ${XPFM_PATH} ${DOMAINS} ${BIF_PATH}
	${SDCARD_GEN} --xpfm ${XPFM_PATH} --sys_config ${SYS_CONFIG} --bif ${BIF_PATH} --no_bitstream ${SD_FILES}

clean:
	$(RMDIR) ./_sds
	${RMDIR} sd_card
	${RM} system.bif

.PHONY: all sd_card clean


