# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "C"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_C
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/hal/Native_Driver/low_level_rng.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/__/target/stm/common/hal/Native_Driver/low_level_rng.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/hal/accelerator/sha1_alt.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/__/target/stm/common/hal/accelerator/sha1_alt.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/hal/accelerator/sha256_alt.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/__/target/stm/common/hal/accelerator/sha256_alt.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/hal/accelerator/stm.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/__/target/stm/common/hal/accelerator/stm.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_cryp.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/__/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_cryp.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_cryp_ex.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/__/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_cryp_ex.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_hash.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/__/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_hash.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_hash_ex.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/__/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_hash_ex.o"
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_pka.c" "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/__/target/stm/common/stm32l5xx/hal/Src/stm32l5xx_hal_pka.o"
  )
set(CMAKE_C_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_C
  "BL1_HEADER_SIZE=0x000"
  "BL1_TRAILER_SIZE=0x000"
  "BL2"
  "BL2_HEADER_SIZE=0x400"
  "BL2_TRAILER_SIZE=0x2000"
  "CONFIG_TFM_ENABLE_MEMORY_PROTECT"
  "CONFIG_TFM_FLOAT_ABI=0"
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
  "PSA_CRYPTO_DRIVER_TFM_BUILTIN_KEY_LOADER"
  "PSA_CRYPTO_SECURE"
  "PS_CRYPTO_AEAD_ALG_GCM"
  "PS_ENCRYPTION"
  "STM32L552xx"
  "ST_HW_CONTEXT_SAVING"
  "TARGET_CONFIG_HEADER_FILE=\"/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/nucleo_l552ze_q/config_tfm_target.h\""
  "TFM_FIH_PROFILE_OFF"
  "TFM_SPM_LOG_LEVEL=TFM_SPM_LOG_LEVEL_DEBUG"
  "TFM_SPM_LOG_RAW_ENABLED"
  )

# The include file search paths:
set(CMAKE_C_TARGET_INCLUDE_PATH
  "../platform/ext/accelerator/stm/../../../ext/target/stm/nucleo_l552ze_q/accelerator"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/common/hal/accelerator"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/nucleo_l552ze_q/include"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/common/stm32l5xx/hal/Inc"
  "../platform/ext/accelerator/stm/../../../ext/target/stm/common/stm32l5xx/Device/Include"
  "../platform/ext/accelerator/stm/../../../ext/cmsis"
  "../platform/ext/accelerator/interface"
  "lib/ext/mbedcrypto-src/include"
  "../secure_fw/partitions/crypto"
  "../secure_fw/partitions/crypto/psa_driver_api"
  "../platform/ext/accelerator/stm/../../../include"
  "../secure_fw/include"
  "../secure_fw/partitions/firmware_update"
  "../secure_fw/partitions/initial_attestation"
  "../secure_fw/partitions/internal_trusted_storage"
  "../secure_fw/partitions/platform"
  "../secure_fw/partitions/protected_storage"
  "../secure_fw/partitions/example_partition"
  "../secure_fw/spm/include"
  "generated/interface/include"
  "../platform/./ext"
  "../platform/./ext/cmsis"
  "../platform/./ext/common"
  "../platform/./ext/driver"
  "../platform/./include"
  "../platform/ext/target/stm/common/stm32l5xx"
  "../platform/ext/target/stm/nucleo_l552ze_q/../common/hal/Native_Driver"
  "../platform/ext/target/stm/nucleo_l552ze_q/../common/hal/CMSIS_Driver"
  "../platform/ext/target/stm/common/stm32l5xx/Device/Include"
  "../platform/ext/target/stm/common/stm32l5xx/hal/Inc"
  "lib/ext/mbedcrypto-src/library"
  "../platform/ext/target/stm/nucleo_l552ze_q/include"
  "../platform/ext/target/stm/common/stm32l5xx/boards"
  "../platform/ext/common"
  "../lib/fih/inc"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedcrypto.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/CMakeFiles/platform_s.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/CMakeFiles/platform_crypto_keys.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/lib/runtime/CMakeFiles/tfm_sprt.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/CMakeFiles/tfm_psa_rot_partition_crypto.dir/DependInfo.cmake"
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
