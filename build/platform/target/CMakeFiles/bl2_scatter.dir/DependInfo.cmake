# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "C"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_C
  "/home/bento/trusted-firmware-m/tfm/platform/ext/target/stm/common/hal/template/gcc/bl2.ld" "/home/bento/trusted-firmware-m/tfm/build/platform/target/CMakeFiles/bl2_scatter.dir/__/common/hal/template/gcc/bl2.ld"
  )
set(CMAKE_C_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_C
  "BL1_HEADER_SIZE=0x000"
  "BL1_TRAILER_SIZE=0x000"
  "BL2"
  "BL2_HEADER_SIZE=0x400"
  "BL2_TRAILER_SIZE=0x2000"
  "CONFIG_TFM_PARTITION_META"
  "CONFIG_TFM_USE_TRUSTZONE"
  "CRYPTO_HW_ACCELERATOR"
  "DAUTH_CHIP_DEFAULT"
  "ENABLE_HEAP"
  "MCUBOOT_IMAGE_NUMBER=2"
  "MCUBOOT_SIGN_RSA"
  "MCUBOOT_SIGN_RSA_LEN=3072"
  "PLATFORM_DEFAULT_BL1"
  "PLATFORM_NS_NV_COUNTERS=0"
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
  )

# The include file search paths:
set(CMAKE_C_TARGET_INCLUDE_PATH
  "../platform/ext/target/stm/nucleo_l552ze_q/include"
  "../platform/ext/target/stm/common/stm32l5xx/boards"
  "../platform/ext/common"
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
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
