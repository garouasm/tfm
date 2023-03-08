# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "C"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_C
  "/home/bento/trusted-firmware-m/tfm/interface/src/tfm_crypto_api.c" "/home/bento/trusted-firmware-m/tfm/build/tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/interface/src/tfm_crypto_api.o"
  "/home/bento/trusted-firmware-m/tfm/interface/src/tfm_its_api.c" "/home/bento/trusted-firmware-m/tfm/build/tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/interface/src/tfm_its_api.o"
  "/home/bento/trusted-firmware-m/tfm/interface/src/tfm_psa_ns_api.c" "/home/bento/trusted-firmware-m/tfm/build/tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/__/__/__/interface/src/tfm_psa_ns_api.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/tfm_test_repo-src/app/tfm_ns_interface.c" "/home/bento/trusted-firmware-m/tfm/build/tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/tfm_ns_interface.o"
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
  "../interface/include"
  "generated/interface/include"
  "lib/ext/tfm_test_repo-src/app/../ns_interface"
  "lib/ext/tfm_test_repo-src/app/../ns_interface/ns_client_ext"
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
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/CMakeFiles/tfm_s_veneers.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/DependInfo.cmake"
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
