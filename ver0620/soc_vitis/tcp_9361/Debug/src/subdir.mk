################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/ad9361.c \
../src/ad9361_api.c \
../src/ad9361_conv.c \
../src/axi_lite.c \
../src/i2c_access.c \
../src/iic_phyreset.c \
../src/main.c \
../src/pl_intr.c \
../src/platform.c \
../src/platform_zynq.c \
../src/sccb_iic.c \
../src/sfp.c \
../src/si5324.c \
../src/sys_intr.c \
../src/tcp_client.c \
../src/util.c 

OBJS += \
./src/ad9361.o \
./src/ad9361_api.o \
./src/ad9361_conv.o \
./src/axi_lite.o \
./src/i2c_access.o \
./src/iic_phyreset.o \
./src/main.o \
./src/pl_intr.o \
./src/platform.o \
./src/platform_zynq.o \
./src/sccb_iic.o \
./src/sfp.o \
./src/si5324.o \
./src/sys_intr.o \
./src/tcp_client.o \
./src/util.o 

C_DEPS += \
./src/ad9361.d \
./src/ad9361_api.d \
./src/ad9361_conv.d \
./src/axi_lite.d \
./src/i2c_access.d \
./src/iic_phyreset.d \
./src/main.d \
./src/pl_intr.d \
./src/platform.d \
./src/platform_zynq.d \
./src/sccb_iic.d \
./src/sfp.d \
./src/si5324.d \
./src/sys_intr.d \
./src/tcp_client.d \
./src/util.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -IF:/Ming_Jian/16QAM/16M_16QAM/zed_9361_1107_1Msys/soc_vitis/zed_9361_tcp/export/zed_9361_tcp/sw/zed_9361_tcp/standalone_domain/bspinclude/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


