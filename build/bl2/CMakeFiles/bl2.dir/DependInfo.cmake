# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "C"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_C
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/hal/Native_Driver/tick.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/CMakeFiles/bl2.dir/__/platform/ext/target/stm/common/hal/Native_Driver/tick.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/hal/accelerator/sha1_alt.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/CMakeFiles/bl2.dir/__/platform/ext/target/stm/common/hal/accelerator/sha1_alt.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/hal/accelerator/sha256_alt.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/CMakeFiles/bl2.dir/__/platform/ext/target/stm/common/hal/accelerator/sha256_alt.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/hal/accelerator/stm.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/CMakeFiles/bl2.dir/__/platform/ext/target/stm/common/hal/accelerator/stm.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/Device/Source/startup_stm32l5xx_bl2.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/CMakeFiles/bl2.dir/__/platform/ext/target/stm/common/stm32l5xx/Device/Source/startup_stm32l5xx_bl2.o"
  "/home/bento/trusted-firmware-m/tfm/bl2/ext/mcuboot/bl2_main.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/CMakeFiles/bl2.dir/ext/mcuboot/bl2_main.o"
  "/home/bento/trusted-firmware-m/tfm/bl2/ext/mcuboot/flash_map_extended.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/CMakeFiles/bl2.dir/ext/mcuboot/flash_map_extended.o"
  "/home/bento/trusted-firmware-m/tfm/bl2/ext/mcuboot/flash_map_legacy.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/CMakeFiles/bl2.dir/ext/mcuboot/flash_map_legacy.o"
  "/home/bento/trusted-firmware-m/tfm/bl2/ext/mcuboot/keys.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/CMakeFiles/bl2.dir/ext/mcuboot/keys.o"
  "/home/bento/trusted-firmware-m/tfm/bl2/src/default_flash_map.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/CMakeFiles/bl2.dir/src/default_flash_map.o"
  "/home/bento/trusted-firmware-m/tfm/bl2/src/flash_map.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/CMakeFiles/bl2.dir/src/flash_map.o"
  "/home/bento/trusted-firmware-m/tfm/bl2/src/provisioning.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/CMakeFiles/bl2.dir/src/provisioning.o"
  "/home/bento/trusted-firmware-m/tfm/bl2/src/security_cnt.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/CMakeFiles/bl2.dir/src/security_cnt.o"
  )
set(CMAKE_C_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_C
  "BL1_HEADER_SIZE=0x000"
  "BL1_TRAILER_SIZE=0x000"
  "BL2"
  "BL2_HEADER_SIZE=0x400"
  "BL2_TRAILER_SIZE=0x2000"
  "CONFIG_TFM_BOOT_STORE_MEASUREMENTS"
  "CRYPTO_HW_ACCELERATOR"
  "DAUTH_CHIP_DEFAULT"
  "DEFAULT_MCUBOOT_FLASH_MAP"
  "ENABLE_HEAP"
  "MBEDTLS_CONFIG_FILE=\"/home/bento/trusted-firmware-m/tfm/bl2/ext/mcuboot/config/mcuboot-mbedtls-cfg.h\""
  "MCUBOOT_DIRECT_XIP_REVERT"
  "MCUBOOT_FIH_PROFILE_OFF"
  "MCUBOOT_HW_KEY"
  "MCUBOOT_IMAGE_NUMBER=2"
  "MCUBOOT_OVERWRITE_ONLY"
  "MCUBOOT_SIGN_RSA"
  "MCUBOOT_SIGN_RSA_LEN=3072"
  "OTP_WRITEABLE"
  "PLATFORM_DEFAULT_BL1"
  "PLATFORM_DEFAULT_NV_COUNTERS"
  "PLATFORM_DEFAULT_OTP"
  "PLATFORM_NS_NV_COUNTERS=0"
  "STM32L552xx"
  "TFM_DUMMY_PROVISIONING"
  )

# The include file search paths:
set(CMAKE_C_TARGET_INCLUDE_PATH
  "../bl2/ext/mcuboot/include"
  "../bl2/include"
  "lib/ext/mcuboot-src/boot/bootutil/src"
  "lib/ext/mcuboot-src/boot/bootutil/include"
  "../bl2/ext/mcuboot/config"
  "bl2/ext/mcuboot"
  "../platform/ext/target/stm/common/stm32l5xx"
  "../platform/ext/target/stm/nucleo_l552ze_q/../common/hal/Native_Driver"
  "../platform/ext/target/stm/nucleo_l552ze_q/../common/hal/CMSIS_Driver"
  "../platform/ext/target/stm/common/stm32l5xx/Device/Include"
  "../platform/ext/target/stm/common/stm32l5xx/hal/Inc"
  "../platform/ext/accelerator/interface"
  "../platform/./ext"
  "../platform/./ext/cmsis"
  "../platform/./ext/common"
  "../platform/./ext/driver"
  "../platform/./include"
  "../platform/ext/target/stm/nucleo_l552ze_q/include"
  "../platform/ext/target/stm/common/stm32l5xx/boards"
  "../platform/ext/common"
  "lib/ext/mbedcrypto-src/include"
  "lib/ext/mbedcrypto-src/library"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/nucleo_l552ze_q/accelerator"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/common/hal/accelerator"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/nucleo_l552ze_q/include"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/common/stm32l5xx/hal/Inc"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/common/stm32l5xx/Device/Include"
  "../platform/ext/accelerator/stm/../../../ext/cmsis"
  "../secure_fw/spm/include/boot"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  "/home/bento/trusted-firmware-m/tfm/build/bl2/ext/mcuboot/bootutil/CMakeFiles/bootutil.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/CMakeFiles/platform_bl2.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/bl2/mbedcrypto/library/CMakeFiles/bl2_mbedcrypto.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/bl2_crypto_hw.dir/DependInfo.cmake"
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
