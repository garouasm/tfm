# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "C"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_C
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/tfm_test_repo-src/log/tfm_log_raw.c" "/home/bento/trusted-firmware-m/tfm/build/tf-m-tests/app/CMakeFiles/tfm_test_app.dir/__/log/tfm_log_raw.o"
  "/home/bento/trusted-firmware-m/tfm/build/lib/ext/tfm_test_repo-src/app/test_app.c" "/home/bento/trusted-firmware-m/tfm/build/tf-m-tests/app/CMakeFiles/tfm_test_app.dir/test_app.o"
  )
set(CMAKE_C_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_C
  "CONFIG_TFM_USE_TRUSTZONE"
  "STM32L552xx"
  "TFM_PARTITION_CRYPTO"
  "TFM_PARTITION_EXAMPLE"
  "TFM_PARTITION_INTERNAL_TRUSTED_STORAGE"
  "TFM_PARTITION_LOG_LEVEL=TFM_PARTITION_LOG_LEVEL_DEBUG"
  "TFM_PARTITION_NS_AGENT_TZ"
  "TFM_SP_LOG_RAW_ENABLED"
  )

# The include file search paths:
set(CMAKE_C_TARGET_INCLUDE_PATH
  "lib/ext/tfm_test_repo-src/app/."
  "../interface/include"
  "generated/interface/include"
  "lib/ext/tfm_test_repo-src/app/../ns_interface"
  "lib/ext/tfm_test_repo-src/app/../ns_interface/ns_client_ext"
  "lib/ext/tfm_test_repo-src/log/."
  "../platform/./ext"
  "../platform/./ext/cmsis"
  "../platform/./ext/common"
  "../platform/./ext/driver"
  "../platform/./include"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  "/home/bento/trusted-firmware-m/tfm/build/tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/secure_fw/CMakeFiles/tfm_s_veneers.dir/DependInfo.cmake"
  "/home/bento/trusted-firmware-m/tfm/build/platform/ns/CMakeFiles/platform_ns.dir/DependInfo.cmake"
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
