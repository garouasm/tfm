# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "C"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_C
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/x509.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedx509.dir/x509.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/x509_create.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedx509.dir/x509_create.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/x509_crl.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedx509.dir/x509_crl.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/x509_crt.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedx509.dir/x509_crt.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/x509_csr.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedx509.dir/x509_csr.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/x509write_crt.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedx509.dir/x509write_crt.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/x509write_csr.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedx509.dir/x509write_csr.o"
  )
set(CMAKE_C_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_C
  "CRYPTO_HW_ACCELERATOR"
  "MBEDTLS_CONFIG_FILE=\"/home/bento/trusted-firmware-m/tfm/lib/ext/mbedcrypto/mbedcrypto_config/tfm_mbedcrypto_config_default.h\""
  "MBEDTLS_PSA_CRYPTO_BUILTIN_KEYS"
  "MBEDTLS_PSA_CRYPTO_CONFIG_FILE=\"/home/bento/trusted-firmware-m/tfm/lib/ext/mbedcrypto/mbedcrypto_config/crypto_config_default.h\""
  "MBEDTLS_PSA_CRYPTO_DRIVERS"
  "PLATFORM_DEFAULT_CRYPTO_KEYS"
  "PLATFORM_DEFAULT_NV_SEED"
  "PROJECT_CONFIG_HEADER_FILE=\"/home/bento/trusted-firmware-m/tfm/config/config_base.h\""
  "PSA_CRYPTO_DRIVER_TFM_BUILTIN_KEY_LOADER"
  "PSA_CRYPTO_SECURE"
  "PS_CRYPTO_AEAD_ALG_GCM"
  "PS_ENCRYPTION"
  "STM32L552xx"
  "TARGET_CONFIG_HEADER_FILE=\"/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/nucleo_l552ze_q/config_tfm_target.h\""
  )

# The include file search paths:
set(CMAKE_C_TARGET_INCLUDE_PATH
  "lib/ext/mbedcrypto-src/include"
  "lib/ext/mbedcrypto-src/library"
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
  "generated/interface/include"
  "../platform/./ext"
  "../platform/./ext/cmsis"
  "../platform/./ext/common"
  "../platform/./ext/driver"
  "../platform/./include"
  "../platform/ext/accelerator/interface"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedcrypto.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/CMakeFiles/platform_s.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/CMakeFiles/platform_crypto_keys.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/lib/runtime/CMakeFiles/tfm_sprt.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/CMakeFiles/tfm_psa_rot_partition_crypto.dir/DependInfo.cmake"
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
