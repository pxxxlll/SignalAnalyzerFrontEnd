#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=H:/VIVADO2019.2/Vitis/2019.2/bin;H:/VIVADO2019.2/Vivado/2019.2/ids_lite/ISE/bin/nt64;H:/VIVADO2019.2/Vivado/2019.2/ids_lite/ISE/lib/nt64:H:/VIVADO2019.2/Vivado/2019.2/bin
else
  PATH=H:/VIVADO2019.2/Vitis/2019.2/bin;H:/VIVADO2019.2/Vivado/2019.2/ids_lite/ISE/bin/nt64;H:/VIVADO2019.2/Vivado/2019.2/ids_lite/ISE/lib/nt64:H:/VIVADO2019.2/Vivado/2019.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='F:/Ming_Jian/16QAM/16M_16QAM/zed_9361_1107_1Msys/zed_9361_1107_1Msys/zed_9361.runs/impl_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

# pre-commands:
/bin/touch .init_design.begin.rst
EAStep vivado -log system_wrapper.vdi -applog -m64 -product Vivado -messageDb vivado.pb -mode batch -source system_wrapper.tcl -notrace


