# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# compile C with /usr/bin/arm-none-eabi-gcc
C_FLAGS = -mcpu=cortex-m33+nofp -g   -fmacro-prefix-map=/home/bento/trusted-firmware-m/tfm/build/lib/ext/tfm_test_repo-src=TFM_TEST_REPO_PATH --specs=nano.specs -Wall -Wno-format -Wno-return-type -Wno-unused-but-set-variable -c -fdata-sections -ffunction-sections -fno-builtin -fshort-enums -funsigned-char -mthumb -nostdlib -Os -std=c99 -g -E -P -xc

C_DEFINES = -DBL1_HEADER_SIZE=0x000 -DBL1_TRAILER_SIZE=0x000 -DBL2 -DBL2_HEADER_SIZE=0x400 -DBL2_TRAILER_SIZE=0x2000 -DCONFIG_TFM_PARTITION_META -DCONFIG_TFM_USE_TRUSTZONE -DCRYPTO_HW_ACCELERATOR -DDAUTH_CHIP_DEFAULT -DENABLE_HEAP -DMCUBOOT_IMAGE_NUMBER=2 -DMCUBOOT_SIGN_RSA -DMCUBOOT_SIGN_RSA_LEN=3072 -DPLATFORM_DEFAULT_BL1 -DPLATFORM_NS_NV_COUNTERS=0 -DPROJECT_CONFIG_HEADER_FILE=\"/home/bento/trusted-firmware-m/tfm/config/config_base.h\" -DPS_CRYPTO_AEAD_ALG_GCM -DPS_ENCRYPTION -DSTM32L552xx -DTARGET_CONFIG_HEADER_FILE=\"/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/nucleo_l552ze_q/config_tfm_target.h\" -DTFM_LVL=2 -DTFM_PARTITION_CRYPTO -DTFM_PARTITION_EXAMPLE -DTFM_PARTITION_INTERNAL_TRUSTED_STORAGE -DTFM_PARTITION_LOG_LEVEL=TFM_PARTITION_LOG_LEVEL_DEBUG -DTFM_PARTITION_NS_AGENT_TZ -DTFM_SP_LOG_RAW_ENABLED

C_INCLUDES = -I/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/nucleo_l552ze_q/include -I/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/boards -I/home/bento/trusted-firmware-m/tfm/platform/ext/common -I/home/bento/trusted-firmware-m/tfm/interface/include -I/home/bento/trusted-firmware-m/tfm/build/generated/interface/include -I/home/bento/trusted-firmware-m/tfm/secure_fw/include -I/home/bento/trusted-firmware-m/tfm/secure_fw/partitions/crypto -I/home/bento/trusted-firmware-m/tfm/secure_fw/partitions/firmware_update -I/home/bento/trusted-firmware-m/tfm/secure_fw/partitions/initial_attestation -I/home/bento/trusted-firmware-m/tfm/secure_fw/partitions/internal_trusted_storage -I/home/bento/trusted-firmware-m/tfm/secure_fw/partitions/platform -I/home/bento/trusted-firmware-m/tfm/secure_fw/partitions/protected_storage -I/home/bento/trusted-firmware-m/tfm/secure_fw/partitions/example_partition -I/home/bento/trusted-firmware-m/tfm/secure_fw/spm/include 

