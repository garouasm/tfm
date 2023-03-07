# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# compile C with /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc
C_DEFINES = -DBL1_HEADER_SIZE=0x000 -DBL1_TRAILER_SIZE=0x000 -DBL2 -DBL2_HEADER_SIZE=0x400 -DBL2_TRAILER_SIZE=0x2000 -DCRYPTO_HW_ACCELERATOR -DDAUTH_CHIP_DEFAULT -DENABLE_HEAP -DMBEDTLS_CONFIG_FILE=\"/home/sam/Desktop/trusted-firmware-m/bl2/ext/mcuboot/config/mcuboot-mbedtls-cfg.h\" -DMCUBOOT_DIRECT_XIP_REVERT -DMCUBOOT_FIH_PROFILE_OFF -DMCUBOOT_HW_KEY -DMCUBOOT_IMAGE_NUMBER=2 -DMCUBOOT_OVERWRITE_ONLY -DMCUBOOT_SIGN_RSA -DMCUBOOT_SIGN_RSA_LEN=3072 -DOTP_WRITEABLE -DPLATFORM_DEFAULT_BL1 -DPLATFORM_DEFAULT_NV_COUNTERS -DPLATFORM_DEFAULT_OTP -DPLATFORM_NS_NV_COUNTERS=0 -DSTM32L552xx -DTFM_DUMMY_PROVISIONING

C_INCLUDES = -I/home/sam/Desktop/trusted-firmware-m/platform/ext/accelerator/stm/../../../ext/target/stm/nucleo_l552ze_q/accelerator -I/home/sam/Desktop/trusted-firmware-m/platform/ext/accelerator/stm/../../../ext/target/stm/common/hal/accelerator -I/home/sam/Desktop/trusted-firmware-m/platform/ext/accelerator/stm/../../../ext/target/stm/nucleo_l552ze_q/include -I/home/sam/Desktop/trusted-firmware-m/platform/ext/accelerator/stm/../../../ext/target/stm/common/stm32l5xx/hal/Inc -I/home/sam/Desktop/trusted-firmware-m/platform/ext/accelerator/stm/../../../ext/target/stm/common/stm32l5xx/Device/Include -I/home/sam/Desktop/trusted-firmware-m/platform/ext/accelerator/stm/../../../ext/cmsis -I/home/sam/Desktop/trusted-firmware-m/platform/ext/accelerator/interface -I/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/include -I/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mbedcrypto-src/library -I/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/stm32l5xx -I/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/nucleo_l552ze_q/../common/hal/Native_Driver -I/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/nucleo_l552ze_q/../common/hal/CMSIS_Driver -I/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/stm32l5xx/Device/Include -I/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/stm32l5xx/hal/Inc -I/home/sam/Desktop/trusted-firmware-m/build/lib/ext/mcuboot-src/boot/bootutil/include -I/home/sam/Desktop/trusted-firmware-m/build/bl2/ext/mcuboot -I/home/sam/Desktop/trusted-firmware-m/bl2/ext/mcuboot/include -I/home/sam/Desktop/trusted-firmware-m/platform/./ext -I/home/sam/Desktop/trusted-firmware-m/platform/./ext/cmsis -I/home/sam/Desktop/trusted-firmware-m/platform/./ext/common -I/home/sam/Desktop/trusted-firmware-m/platform/./ext/driver -I/home/sam/Desktop/trusted-firmware-m/platform/./include -I/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/nucleo_l552ze_q/include -I/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/stm32l5xx/boards -I/home/sam/Desktop/trusted-firmware-m/platform/ext/common

C_FLAGS = -mcpu=cortex-m33+nofp -g -fmacro-prefix-map=/home/sam/Desktop/trusted-firmware-m/build/lib/ext/tfm_test_repo-src=TFM_TEST_REPO_PATH --specs=nano.specs -Wall -Wno-format -Wno-return-type -Wno-unused-but-set-variable -c -fdata-sections -ffunction-sections -fno-builtin -fshort-enums -funsigned-char -mthumb -nostdlib -Os -std=c99 -g -mcmse -include /home/sam/Desktop/trusted-firmware-m/platform/include/cmsis_override.h

