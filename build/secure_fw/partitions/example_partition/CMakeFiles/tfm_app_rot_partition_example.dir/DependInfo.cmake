# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "C"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_C
  "/home/bento/trusted-firmware-m/tfm/build/generated/secure_fw/partitions/example_partition/auto_generated/intermedia_tfm_example_partition.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/example_partition/CMakeFiles/tfm_app_rot_partition_example.dir/__/__/__/generated/secure_fw/partitions/example_partition/auto_generated/intermedia_tfm_example_partition.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/hal/Native_Driver/low_level_rng.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/example_partition/CMakeFiles/tfm_app_rot_partition_example.dir/__/__/__/platform/ext/target/stm/common/hal/Native_Driver/low_level_rng.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_cryp.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/example_partition/CMakeFiles/tfm_app_rot_partition_example.dir/__/__/__/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_cryp.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_cryp_ex.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/example_partition/CMakeFiles/tfm_app_rot_partition_example.dir/__/__/__/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_cryp_ex.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_hash.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/example_partition/CMakeFiles/tfm_app_rot_partition_example.dir/__/__/__/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_hash.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_hash_ex.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/example_partition/CMakeFiles/tfm_app_rot_partition_example.dir/__/__/__/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_hash_ex.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_pka.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/example_partition/CMakeFiles/tfm_app_rot_partition_example.dir/__/__/__/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_pka.o"
  "/home/bento/trusted-firmware-m/tfm/secure_fw/partitions/example_partition/tfm_example_partition.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/example_partition/CMakeFiles/tfm_app_rot_partition_example.dir/tfm_example_partition.o"
  )
set(CMAKE_C_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_C
  "BL1_HEADER_SIZE=0x000"
  "BL1_TRAILER_SIZE=0x000"
  "BL2"
  "BL2_HEADER_SIZE=0x400"
  "BL2_TRAILER_SIZE=0x2000"
  "CONFIG_TFM_BUILDING_SPE=1"
  "CONFIG_TFM_ENABLE_MEMORY_PROTECT"
  "CONFIG_TFM_FLOAT_ABI=0"
  "CONFIG_TFM_PARTITION_META"
  "CONFIG_TFM_USE_TRUSTZONE"
  "CRYPTO_HW_ACCELERATOR"
  "DAUTH_CHIP_DEFAULT"
  "ENABLE_HEAP"
  "MCUBOOT_IMAGE_NUMBER=2"
  "MCUBOOT_SIGN_RSA"
  "MCUBOOT_SIGN_RSA_LEN=3072"
  "PLATFORM_DEFAULT_BL1"
  "PLATFORM_DEFAULT_CRYPTO_KEYS"
  "PLATFORM_DEFAULT_OTP"
  "PLATFORM_NS_NV_COUNTERS=0"
  "PROJECT_CONFIG_HEADER_FILE=\"/home/bento/trusted-firmware-m/tfm/config/config_base.h\""
  "PS_CRYPTO_AEAD_ALG_GCM"
  "PS_ENCRYPTION"
  "STM32L552xx"
  "TARGET_CONFIG_HEADER_FILE=\"/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/nucleo_l552ze_q/config_tfm_target.h\""
  "TFM_FIH_PROFILE_OFF"
  "TFM_LVL=2"
  "TFM_PARTITION_CRYPTO"
  "TFM_PARTITION_EXAMPLE"
  "TFM_PARTITION_INTERNAL_TRUSTED_STORAGE"
  "TFM_PARTITION_LOG_LEVEL=TFM_PARTITION_LOG_LEVEL_DEBUG"
  "TFM_PARTITION_NS_AGENT_TZ"
  "TFM_SPM_LOG_LEVEL=TFM_SPM_LOG_LEVEL_DEBUG"
  "TFM_SPM_LOG_RAW_ENABLED"
  "TFM_SP_LOG_RAW_ENABLED"
  )

# The include file search paths:
set(CMAKE_C_TARGET_INCLUDE_PATH
  "../secure_fw/partitions/example_partition"
  "generated/secure_fw/partitions/example_partition"
  "../interface/include"
  "generated/interface/include"
  "../secure_fw/include"
  "../secure_fw/partitions/crypto"
  "../secure_fw/partitions/firmware_update"
  "../secure_fw/partitions/initial_attestation"
  "../secure_fw/partitions/internal_trusted_storage"
  "../secure_fw/partitions/platform"
  "../secure_fw/partitions/protected_storage"
  "../secure_fw/spm/include"
  "../platform/ext/target/stm/common/stm32l5xx"
  "../platform/ext/target/stm/nucleo_l552ze_q/../common/hal/Native_Driver"
  "../platform/ext/target/stm/nucleo_l552ze_q/../common/hal/CMSIS_Driver"
  "../platform/ext/target/stm/common/stm32l5xx/Device/Include"
  "../platform/ext/target/stm/common/stm32l5xx/hal/Inc"
  "lib/ext/mbedcrypto-src/library"
  "../platform/ext/accelerator/interface"
  "../platform/./ext"
  "../platform/./ext/cmsis"
  "../platform/./ext/common"
  "../platform/./ext/driver"
  "../platform/./include"
  "../platform/ext/target/stm/nucleo_l552ze_q/include"
  "../platform/ext/target/stm/common/stm32l5xx/boards"
  "../platform/ext/common"
  "../lib/fih/inc"
  "../secure_fw/partitions/lib/runtime/include"
  "../secure_fw/spm/cmsis_psa"
  "../secure_fw/spm/include/boot"
  "../secure_fw/spm/include/interface"
  "../secure_fw/spm/cmsis_psa/arch"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  "/home/bento/trusted-firmware-m/tfm/build/platform/CMakeFiles/platform_s.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/lib/runtime/CMakeFiles/tfm_sprt.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/CMakeFiles/platform_crypto_keys.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedcrypto.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/CMakeFiles/tfm_psa_rot_partition_crypto.dir/DependInfo.cmake"
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
