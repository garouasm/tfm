# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "C"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_C
  "/home/bento/trusted-firmware-m/tfm/platform/ext/common/template/crypto_keys.c" "/home/bento/trusted-firmware-m/tfm/build/platform/CMakeFiles/platform_crypto_keys.dir/ext/common/template/crypto_keys.o"
  )
set(CMAKE_C_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_C
  "BL1_HEADER_SIZE=0x000"
  "BL1_TRAILER_SIZE=0x000"
  "BL2"
  "BL2_HEADER_SIZE=0x400"
  "BL2_TRAILER_SIZE=0x2000"
  "CRYPTO_HW_ACCELERATOR"
  "DAUTH_CHIP_DEFAULT"
  "ENABLE_HEAP"
  "MBEDTLS_CONFIG_FILE=\"/home/bento/trusted-firmware-m/tfm/lib/ext/mbedcrypto/mbedcrypto_config/tfm_mbedcrypto_config_default.h\""
  "MBEDTLS_PSA_CRYPTO_BUILTIN_KEYS"
  "MBEDTLS_PSA_CRYPTO_CONFIG_FILE=\"/home/bento/trusted-firmware-m/tfm/lib/ext/mbedcrypto/mbedcrypto_config/crypto_config_default.h\""
  "MBEDTLS_PSA_CRYPTO_DRIVERS"
  "MCUBOOT_IMAGE_NUMBER=2"
  "MCUBOOT_SIGN_RSA"
  "MCUBOOT_SIGN_RSA_LEN=3072"
  "PLATFORM_DEFAULT_BL1"
  "PLATFORM_DEFAULT_CRYPTO_KEYS"
  "PLATFORM_DEFAULT_NV_SEED"
  "PLATFORM_DEFAULT_OTP"
  "PLATFORM_NS_NV_COUNTERS=0"
  "PROJECT_CONFIG_HEADER_FILE=\"/home/bento/trusted-firmware-m/tfm/config/config_base.h\""
  "PSA_CRYPTO_DRIVER_TFM_BUILTIN_KEY"
  "PSA_CRYPTO_DRIVER_TFM_BUILTIN_KEY_LOADER"
  "PSA_CRYPTO_SECURE"
  "PS_CRYPTO_AEAD_ALG_GCM"
  "PS_ENCRYPTION"
  "STM32L552xx"
  "TARGET_CONFIG_HEADER_FILE=\"/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/nucleo_l552ze_q/config_tfm_target.h\""
  "TFM_PARTITION_CRYPTO"
  "TFM_PARTITION_EXAMPLE"
  "TFM_PARTITION_INTERNAL_TRUSTED_STORAGE"
  "TFM_PARTITION_LOG_LEVEL=TFM_PARTITION_LOG_LEVEL_DEBUG"
  "TFM_PARTITION_NS_AGENT_TZ"
  "TFM_SP_LOG_RAW_ENABLED"
  )

# The include file search paths:
set(CMAKE_C_TARGET_INCLUDE_PATH
  "../interface/include/crypto_keys"
  "generated/interface/include"
  "lib/ext/mbedcrypto-src/include"
  "../secure_fw/partitions/crypto"
  "../secure_fw/partitions/crypto/psa_driver_api"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/nucleo_l552ze_q/accelerator"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/common/hal/accelerator"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/nucleo_l552ze_q/include"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/common/stm32l5xx/hal/Inc"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/common/stm32l5xx/Device/Include"
  "../platform/ext/accelerator/stm/../../../ext/cmsis"
  "../platform/ext/accelerator/stm/../../../include"
  "../secure_fw/include"
  "../secure_fw/partitions/firmware_update"
  "../secure_fw/partitions/initial_attestation"
  "../secure_fw/partitions/internal_trusted_storage"
  "../secure_fw/partitions/platform"
  "../secure_fw/partitions/protected_storage"
  "../secure_fw/partitions/example_partition"
  "../secure_fw/spm/include"
  "../platform/./ext"
  "../platform/./ext/cmsis"
  "../platform/./ext/common"
  "../platform/./ext/driver"
  "../platform/./include"
  "../platform/ext/accelerator/interface"
  "../platform/ext/target/stm/nucleo_l552ze_q/include"
  "../platform/ext/target/stm/common/stm32l5xx/boards"
  "../platform/ext/common"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedcrypto.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/CMakeFiles/tfm_psa_rot_partition_crypto.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/CMakeFiles/platform_s.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/lib/runtime/CMakeFiles/tfm_sprt.dir/DependInfo.cmake"
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
