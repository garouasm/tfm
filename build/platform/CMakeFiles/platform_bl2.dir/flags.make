# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# compile C with /usr/bin/arm-none-eabi-gcc
C_FLAGS = -mcpu=cortex-m33+nofp -g   -fmacro-prefix-map=/home/bento/trusted-firmware-m/tfm/build/lib/ext/tfm_test_repo-src=TFM_TEST_REPO_PATH --specs=nano.specs -Wall -Wno-format -Wno-return-type -Wno-unused-but-set-variable -c -fdata-sections -ffunction-sections -fno-builtin -fshort-enums -funsigned-char -mthumb -nostdlib -Os -std=c99 -g -mcmse -include /home/bento/trusted-firmware-m/tfm/platform/include/cmsis_override.h

C_DEFINES = -DBL1_HEADER_SIZE=0x000 -DBL1_TRAILER_SIZE=0x000 -DBL2 -DBL2_HEADER_SIZE=0x400 -DBL2_TRAILER_SIZE=0x2000 -DCRYPTO_HW_ACCELERATOR -DDAUTH_CHIP_DEFAULT -DENABLE_HEAP -DMCUBOOT_DIRECT_XIP_REVERT -DMCUBOOT_FIH_PROFILE_OFF -DMCUBOOT_HW_KEY -DMCUBOOT_IMAGE_NUMBER=2 -DMCUBOOT_OVERWRITE_ONLY -DMCUBOOT_SIGN_RSA -DMCUBOOT_SIGN_RSA_LEN=3072 -DOTP_WRITEABLE -DPLATFORM_DEFAULT_BL1 -DPLATFORM_DEFAULT_NV_COUNTERS -DPLATFORM_DEFAULT_OTP -DPLATFORM_NS_NV_COUNTERS=0 -DSTM32L552xx -DTFM_DUMMY_PROVISIONING

C_INCLUDES = -I/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx -I/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/nucleo_l552ze_q/../common/hal/Native_Driver -I/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/nucleo_l552ze_q/../common/hal/CMSIS_Driver -I/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/Device/Include -I/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Inc -I/home/bento/trusted-firmware-m/tfm/build/lib/ext/mcuboot-src/boot/bootutil/include -I/home/bento/trusted-firmware-m/tfm/build/bl2/ext/mcuboot -I/home/bento/trusted-firmware-m/tfm/bl2/ext/mcuboot/include -I/home/bento/trusted-firmware-m/tfm/platform/ext/accelerator/interface -I/home/bento/trusted-firmware-m/tfm/platform/./ext -I/home/bento/trusted-firmware-m/tfm/platform/./ext/cmsis -I/home/bento/trusted-firmware-m/tfm/platform/./ext/common -I/home/bento/trusted-firmware-m/tfm/platform/./ext/driver -I/home/bento/trusted-firmware-m/tfm/platform/./include -I/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/nucleo_l552ze_q/include -I/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/boards -I/home/bento/trusted-firmware-m/tfm/platform/ext/common -I/home/bento/trusted-firmware-m/tfm/bl2/include 

