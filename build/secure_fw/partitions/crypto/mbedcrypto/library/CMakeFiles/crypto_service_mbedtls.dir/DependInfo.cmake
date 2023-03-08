# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "C"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_C
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/debug.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/debug.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/net_sockets.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/net_sockets.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/ssl_cache.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/ssl_cache.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/ssl_ciphersuites.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/ssl_ciphersuites.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/ssl_client.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/ssl_client.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/ssl_cookie.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/ssl_cookie.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/ssl_msg.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/ssl_msg.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/ssl_ticket.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/ssl_ticket.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/ssl_tls.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/ssl_tls.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/ssl_tls12_client.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/ssl_tls12_client.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/ssl_tls12_server.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/ssl_tls12_server.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/ssl_tls13_client.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/ssl_tls13_client.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/ssl_tls13_generic.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/ssl_tls13_generic.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/ssl_tls13_keys.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/ssl_tls13_keys.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src/library/ssl_tls13_server.c" "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/ssl_tls13_server.o"
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
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedx509.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedcrypto.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/CMakeFiles/platform_s.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/CMakeFiles/platform_crypto_keys.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/lib/runtime/CMakeFiles/tfm_sprt.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/partitions/crypto/CMakeFiles/tfm_psa_rot_partition_crypto.dir/DependInfo.cmake"
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
