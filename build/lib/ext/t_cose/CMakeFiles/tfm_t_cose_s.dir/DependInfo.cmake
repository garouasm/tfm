# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "C"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_C
  "/home/bento/trusted-firmware-m/tfm/lib/ext/t_cose/crypto_adapters/t_cose_psa_crypto.c" "/home/bento/trusted-firmware-m/tfm/build/lib/ext/t_cose/CMakeFiles/tfm_t_cose_s.dir/crypto_adapters/t_cose_psa_crypto.o"
  "/home/bento/trusted-firmware-m/tfm/lib/ext/t_cose/src/t_cose_parameters.c" "/home/bento/trusted-firmware-m/tfm/build/lib/ext/t_cose/CMakeFiles/tfm_t_cose_s.dir/src/t_cose_parameters.o"
  "/home/bento/trusted-firmware-m/tfm/lib/ext/t_cose/src/t_cose_sign1_sign.c" "/home/bento/trusted-firmware-m/tfm/build/lib/ext/t_cose/CMakeFiles/tfm_t_cose_s.dir/src/t_cose_sign1_sign.o"
  "/home/bento/trusted-firmware-m/tfm/lib/ext/t_cose/src/t_cose_sign1_verify.c" "/home/bento/trusted-firmware-m/tfm/build/lib/ext/t_cose/CMakeFiles/tfm_t_cose_s.dir/src/t_cose_sign1_verify.o"
  "/home/bento/trusted-firmware-m/tfm/lib/ext/t_cose/src/t_cose_util.c" "/home/bento/trusted-firmware-m/tfm/build/lib/ext/t_cose/CMakeFiles/tfm_t_cose_s.dir/src/t_cose_util.o"
  )
set(CMAKE_C_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_C
  "CONFIG_TFM_PARTITION_META"
  "CONFIG_TFM_USE_TRUSTZONE"
  "CRYPTO_HW_ACCELERATOR"
  "PROJECT_CONFIG_HEADER_FILE=\"/home/bento/trusted-firmware-m/tfm/config/config_base.h\""
  "PS_CRYPTO_AEAD_ALG_GCM"
  "PS_ENCRYPTION"
  "STM32L552xx"
  "TARGET_CONFIG_HEADER_FILE=\"/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/nucleo_l552ze_q/config_tfm_target.h\""
  "TFM_LVL=2"
  "TFM_PARTITION_CRYPTO"
  "TFM_PARTITION_EXAMPLE"
  "TFM_PARTITION_INTERNAL_TRUSTED_STORAGE"
  "TFM_PARTITION_LOG_LEVEL=TFM_PARTITION_LOG_LEVEL_DEBUG"
  "TFM_PARTITION_NS_AGENT_TZ"
  "TFM_SP_LOG_RAW_ENABLED"
  "T_COSE_COMPILE_TIME_CONFIG"
  "T_COSE_DISABLE_CONTENT_TYPE"
  "T_COSE_DISABLE_ES384"
  "T_COSE_DISABLE_ES512"
  "T_COSE_DISABLE_MAC0"
  "T_COSE_DISABLE_SHORT_CIRCUIT_SIGN"
  "T_COSE_DISABLE_SIGN_VERIFY_TESTS"
  "T_COSE_USE_PSA_CRYPTO"
  "T_COSE_USE_PSA_CRYPTO_FROM_TFM"
  )

# The include file search paths:
set(CMAKE_C_TARGET_INCLUDE_PATH
  "../lib/ext/t_cose/inc"
  "../lib/ext/t_cose/src"
  "lib/ext/qcbor-src/inc"
  "../lib/ext/qcbor"
  "lib/ext/qcbor-src/inc/qcbor"
  "../interface/include"
  "generated/interface/include"
  "../secure_fw/include"
  "../secure_fw/partitions/crypto"
  "../secure_fw/partitions/firmware_update"
  "../secure_fw/partitions/initial_attestation"
  "../secure_fw/partitions/internal_trusted_storage"
  "../secure_fw/partitions/platform"
  "../secure_fw/partitions/protected_storage"
  "../secure_fw/partitions/example_partition"
  "../secure_fw/spm/include"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/qcbor/CMakeFiles/tfm_qcbor_s.dir/DependInfo.cmake"
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
