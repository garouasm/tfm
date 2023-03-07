# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# compile C with /opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-gcc
C_DEFINES = -DCONFIG_TFM_USE_TRUSTZONE -DSTM32L552xx -DTFM_PARTITION_CRYPTO -DTFM_PARTITION_EXAMPLE -DTFM_PARTITION_INTERNAL_TRUSTED_STORAGE -DTFM_PARTITION_LOG_LEVEL=TFM_PARTITION_LOG_LEVEL_DEBUG -DTFM_PARTITION_NS_AGENT_TZ -DTFM_SP_LOG_RAW_ENABLED

C_INCLUDES = -I/home/sam/Desktop/trusted-firmware-m/build/lib/ext/tfm_test_repo-src/app/. -I/home/sam/Desktop/trusted-firmware-m/interface/include -I/home/sam/Desktop/trusted-firmware-m/build/generated/interface/include -I/home/sam/Desktop/trusted-firmware-m/build/lib/ext/tfm_test_repo-src/app/../ns_interface -I/home/sam/Desktop/trusted-firmware-m/build/lib/ext/tfm_test_repo-src/app/../ns_interface/ns_client_ext -I/home/sam/Desktop/trusted-firmware-m/build/lib/ext/tfm_test_repo-src/log/. -I/home/sam/Desktop/trusted-firmware-m/platform/./ext -I/home/sam/Desktop/trusted-firmware-m/platform/./ext/cmsis -I/home/sam/Desktop/trusted-firmware-m/platform/./ext/common -I/home/sam/Desktop/trusted-firmware-m/platform/./ext/driver -I/home/sam/Desktop/trusted-firmware-m/platform/./include

C_FLAGS = -mcpu=cortex-m33+nofp -g -fmacro-prefix-map=/home/sam/Desktop/trusted-firmware-m/build/lib/ext/tfm_test_repo-src=TFM_TEST_REPO_PATH --specs=nano.specs -Wall -Wno-format -Wno-return-type -Wno-unused-but-set-variable -c -fdata-sections -ffunction-sections -fno-builtin -fshort-enums -funsigned-char -mthumb -nostdlib -Os -std=c99 -g -mfloat-abi=soft
