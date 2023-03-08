# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "C"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_C
  "/home/bento/trusted-firmware-m/tfm/platform/ext/common/uart_stdout.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/__/ext/common/uart_stdout.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/hal/CMSIS_Driver/low_level_com.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/__/ext/target/stm/common/hal/CMSIS_Driver/low_level_com.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/Device/Source/Templates/system_stm32l5xx.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/__/ext/target/stm/common/stm32l5xx/Device/Source/Templates/system_stm32l5xx.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/__/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_cortex.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/__/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_cortex.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_dma.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/__/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_dma.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_gpio.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/__/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_gpio.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_pwr.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/__/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_pwr.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_pwr_ex.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/__/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_pwr_ex.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_rcc.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/__/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_rcc.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_uart.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/__/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_uart.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_uart_ex.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/__/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_uart_ex.o"
  )
set(CMAKE_C_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_C
  "BL1_HEADER_SIZE=0x000"
  "BL1_TRAILER_SIZE=0x000"
  "BL2"
  "BL2_HEADER_SIZE=0x400"
  "BL2_TRAILER_SIZE=0x2000"
  "CONFIG_TFM_FLOAT_ABI=0"
  "CONFIG_TFM_USE_TRUSTZONE"
  "DAUTH_CHIP_DEFAULT"
  "ENABLE_HEAP"
  "MCUBOOT_IMAGE_NUMBER=2"
  "MCUBOOT_SIGN_RSA"
  "MCUBOOT_SIGN_RSA_LEN=3072"
  "PLATFORM_DEFAULT_BL1"
  "PLATFORM_DEFAULT_CRYPTO_KEYS"
  "PLATFORM_NS_NV_COUNTERS=0"
  "STM32L552xx"
  "TFM_FIH_PROFILE_OFF"
  "TFM_PARTITION_CRYPTO"
  "TFM_PARTITION_EXAMPLE"
  "TFM_PARTITION_INTERNAL_TRUSTED_STORAGE"
  "TFM_PARTITION_LOG_LEVEL=TFM_PARTITION_LOG_LEVEL_DEBUG"
  "TFM_PARTITION_NS_AGENT_TZ"
  "TFM_SP_LOG_RAW_ENABLED"
  )

# The include file search paths:
set(CMAKE_C_TARGET_INCLUDE_PATH
  "../platform/ext/target/stm/common/stm32l5xx/Device/Include"
  "../platform/ext/target/stm/common/stm32l5xx/hal/Inc"
  "../platform/./ext"
  "../platform/./ext/cmsis"
  "../platform/./ext/common"
  "../platform/./ext/driver"
  "../platform/./include"
  "../platform/ext/target/stm/nucleo_l552ze_q/include"
  "../platform/ext/target/stm/common/stm32l5xx/boards"
  "../platform/ext/common"
  "../lib/fih/inc"
  "../interface/include"
  "generated/interface/include"
  "lib/ext/tfm_test_repo-src/app/../ns_interface"
  "lib/ext/tfm_test_repo-src/app/../ns_interface/ns_client_ext"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
