# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "C"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_C
  "/home/bento/trusted-firmware-m/tfm/build/bl2/ext/mcuboot/signing_layout_ns.c" "/home/bento/trusted-firmware-m/tfm/build/bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/signing_layout_ns.o"
  )
set(CMAKE_C_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_C
  "BL1_HEADER_SIZE=0x000"
  "BL1_TRAILER_SIZE=0x000"
  "BL2"
  "BL2_HEADER_SIZE=0x400"
  "BL2_TRAILER_SIZE=0x2000"
  "DAUTH_CHIP_DEFAULT"
  "ENABLE_HEAP"
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
  "../platform/ext/target/stm/common/stm32l5xx"
  "../platform/ext/target/stm/nucleo_l552ze_q/../common/hal/Native_Driver"
  "../platform/ext/target/stm/nucleo_l552ze_q/../common/hal/CMSIS_Driver"
  "../platform/ext/target/stm/common/stm32l5xx/Device/Include"
  "../platform/ext/target/stm/common/stm32l5xx/hal/Inc"
  "lib/ext/mcuboot-src/boot/bootutil/include"
  "bl2/ext/mcuboot"
  "../bl2/ext/mcuboot/include"
  "../platform/ext/accelerator/interface"
  "../platform/./ext"
  "../platform/./ext/cmsis"
  "../platform/./ext/common"
  "../platform/./ext/driver"
  "../platform/./include"
  "../platform/ext/target/stm/nucleo_l552ze_q/include"
  "../platform/ext/target/stm/common/stm32l5xx/boards"
  "../platform/ext/common"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
