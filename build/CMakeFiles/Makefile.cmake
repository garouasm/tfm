# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# The generator used is:
set(CMAKE_DEPENDS_GENERATOR "Unix Makefiles")

# The top level Makefile was generated from the following files:
set(CMAKE_MAKEFILE_DEPENDS
  "CMakeCache.txt"
  "../CMakeLists.txt"
  "../bl2/CMakeLists.txt"
  "../bl2/ext/mcuboot/CMakeLists.txt"
  "../bl2/ext/mcuboot/include/mcuboot_config/mcuboot_config.h.in"
  "../bl2/ext/mcuboot/mcuboot_default_config.cmake"
  "../bl2/ext/mcuboot/signing_layout.c.in"
  "CMakeFiles/3.22.1/CMakeASMCompiler.cmake"
  "CMakeFiles/3.22.1/CMakeCCompiler.cmake"
  "CMakeFiles/3.22.1/CMakeSystem.cmake"
  "generated/tools/config_impl.cmake"
  "lib/ext/mbedcrypto-src/3rdparty/CMakeLists.txt"
  "lib/ext/mbedcrypto-src/CMakeLists.txt"
  "lib/ext/mbedcrypto-src/include/CMakeLists.txt"
  "lib/ext/mbedcrypto-src/library/CMakeLists.txt"
  "lib/ext/mcuboot-src/boot/bootutil/CMakeLists.txt"
  "lib/ext/tfm_test_repo-src/CMakeLists.txt"
  "lib/ext/tfm_test_repo-src/app/CMakeLists.txt"
  "lib/ext/tfm_test_repo-src/log/CMakeLists.txt"
  "lib/ext/tfm_test_repo-src/test/CMakeLists.txt"
  "tools/manifest_config.h.in"
  "../cmake/disable_compiler_detection.cmake"
  "../cmake/install.cmake"
  "../cmake/remote_library.cmake"
  "../cmake/set_extensions.cmake"
  "../cmake/utils.cmake"
  "../cmake/version.cmake"
  "../config/build_type/debug.cmake"
  "../config/check_config.cmake"
  "../config/config_base.cmake"
  "../config/cp_check.cmake"
  "../config/cp_config_default.cmake"
  "../config/kconfig.cmake"
  "../config/set_config.cmake"
  "../config/tfm_build_log_config.cmake"
  "../config/tfm_fwu_config.cmake"
  "../config/tfm_ipc_config_default.cmake"
  "../config/tfm_platform.cmake"
  "../config/tfm_secure_log.cmake"
  "../interface/CMakeLists.txt"
  "../interface/include/psa/framework_feature.h.in"
  "../lib/ext/CMSIS_5/CMakeLists.txt"
  "../lib/ext/CMakeLists.txt"
  "../lib/ext/mbedcrypto/CMakeLists.txt"
  "../lib/ext/mcuboot/CMakeLists.txt"
  "../lib/ext/qcbor/CMakeLists.txt"
  "../lib/ext/t_cose/CMakeLists.txt"
  "../lib/ext/tf-m-extras/CMakeLists.txt"
  "../lib/ext/tf-m-tests/fetch_repo.cmake"
  "../lib/ext/tf-m-tests/reg_parse.cmake"
  "../lib/ext/tf-m-tests/repo_config_default.cmake"
  "../lib/fih/CMakeLists.txt"
  "../platform/CMakeLists.txt"
  "../platform/ext/accelerator/CMakeLists.txt"
  "../platform/ext/accelerator/stm/CMakeLists.txt"
  "../platform/ext/target/stm/common/stm32l5xx/CMakeLists.txt"
  "../platform/ext/target/stm/nucleo_l552ze_q/CMakeLists.txt"
  "../platform/ext/target/stm/nucleo_l552ze_q/accelerator/CMakeLists.txt"
  "../platform/ext/target/stm/nucleo_l552ze_q/config.cmake"
  "../platform/ext/target/stm/nucleo_l552ze_q/preload.cmake"
  "../platform/ns/CMakeLists.txt"
  "../secure_fw/CMakeLists.txt"
  "../secure_fw/partitions/CMakeLists.txt"
  "../secure_fw/partitions/crypto/CMakeLists.txt"
  "../secure_fw/partitions/example_partition/CMakeLists.txt"
  "../secure_fw/partitions/firmware_update/CMakeLists.txt"
  "../secure_fw/partitions/idle_partition/CMakeLists.txt"
  "../secure_fw/partitions/initial_attestation/CMakeLists.txt"
  "../secure_fw/partitions/internal_trusted_storage/CMakeLists.txt"
  "../secure_fw/partitions/lib/runtime/CMakeLists.txt"
  "../secure_fw/partitions/ns_agent_mailbox/CMakeLists.txt"
  "../secure_fw/partitions/ns_agent_tz/CMakeLists.txt"
  "../secure_fw/partitions/platform/CMakeLists.txt"
  "../secure_fw/partitions/protected_storage/CMakeLists.txt"
  "../secure_fw/spm/CMakeLists.txt"
  "../secure_fw/spm/include/tfm_version.h.in"
  "../toolchain_GNUARM.cmake"
  "../tools/CMakeLists.txt"
  "/usr/share/cmake-3.22/Modules/CMakeASMCompiler.cmake.in"
  "/usr/share/cmake-3.22/Modules/CMakeASMInformation.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeCCompiler.cmake.in"
  "/usr/share/cmake-3.22/Modules/CMakeCInformation.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeCheckCompilerFlagCommonPatterns.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeCommonLanguageInclude.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeCompilerIdDetection.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeDetermineASMCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeDetermineCCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeDetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeDetermineCompilerId.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeDetermineSystem.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeFindBinUtils.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeGenericSystem.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeInitializeConfigs.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeLanguageInformation.cmake"
  "/usr/share/cmake-3.22/Modules/CMakePackageConfigHelpers.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeSystem.cmake.in"
  "/usr/share/cmake-3.22/Modules/CMakeSystemSpecificInformation.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeSystemSpecificInitialize.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeTestASMCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeTestCCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/CMakeUnixFindMake.cmake"
  "/usr/share/cmake-3.22/Modules/CheckCCompilerFlag.cmake"
  "/usr/share/cmake-3.22/Modules/CheckCSourceCompiles.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/ADSP-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/ARMCC-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/ARMClang-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/AppleClang-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/Borland-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/Bruce-C-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/CMakeCommonCompilerMacros.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/Clang-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/Clang-DetermineCompilerInternal.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/Compaq-C-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/Cray-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/Embarcadero-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/Fujitsu-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/FujitsuClang-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/GHS-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/GNU-ASM.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/GNU-C-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/GNU-C.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/GNU-FindBinUtils.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/GNU.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/HP-C-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/IAR-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/IBMCPP-C-DetermineVersionInternal.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/Intel-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/IntelLLVM-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/MSVC-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/NVHPC-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/NVIDIA-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/OpenWatcom-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/PGI-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/PathScale-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/SCO-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/SDCC-C-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/SunPro-C-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/TI-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/TinyCC-C-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/VisualAge-C-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/Watcom-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/XL-C-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/XLClang-C-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/Compiler/zOS-C-DetermineCompiler.cmake"
  "/usr/share/cmake-3.22/Modules/FetchContent.cmake"
  "/usr/share/cmake-3.22/Modules/FetchContent/CMakeLists.cmake.in"
  "/usr/share/cmake-3.22/Modules/FindGit.cmake"
  "/usr/share/cmake-3.22/Modules/FindPackageHandleStandardArgs.cmake"
  "/usr/share/cmake-3.22/Modules/FindPackageMessage.cmake"
  "/usr/share/cmake-3.22/Modules/FindPython/Support.cmake"
  "/usr/share/cmake-3.22/Modules/FindPython3.cmake"
  "/usr/share/cmake-3.22/Modules/GNUInstallDirs.cmake"
  "/usr/share/cmake-3.22/Modules/Internal/CheckCompilerFlag.cmake"
  "/usr/share/cmake-3.22/Modules/Internal/CheckSourceCompiles.cmake"
  "/usr/share/cmake-3.22/Modules/Platform/Generic.cmake"
  "/usr/share/cmake-3.22/Modules/WriteBasicConfigVersionFile.cmake"
  )

# The corresponding makefile is:
set(CMAKE_MAKEFILE_OUTPUTS
  "Makefile"
  "CMakeFiles/cmake.check_cache"
  )

# Byproducts of CMake generate step:
set(CMAKE_MAKEFILE_PRODUCTS
  "lib/ext/tfm_test_repo-subbuild/CMakeLists.txt"
  "CMakeFiles/3.22.1/CMakeSystem.cmake"
  "CMakeFiles/3.22.1/CMakeCCompiler.cmake"
  "CMakeFiles/3.22.1/CMakeASMCompiler.cmake"
  "CMakeFiles/CMakeDirectoryInformation.cmake"
  "lib/ext/CMakeFiles/CMakeDirectoryInformation.cmake"
  "lib/ext/qcbor-subbuild/CMakeLists.txt"
  "lib/ext/qcbor/CMakeFiles/CMakeDirectoryInformation.cmake"
  "lib/ext/t_cose/CMakeFiles/CMakeDirectoryInformation.cmake"
  "lib/ext/mbedcrypto-subbuild/CMakeLists.txt"
  "lib/ext/mbedcrypto/CMakeFiles/CMakeDirectoryInformation.cmake"
  "lib/ext/CMSIS_5/CMakeFiles/CMakeDirectoryInformation.cmake"
  "lib/ext/mcuboot-subbuild/CMakeLists.txt"
  "lib/ext/mcuboot/CMakeFiles/CMakeDirectoryInformation.cmake"
  "lib/ext/tf-m-extras/CMakeFiles/CMakeDirectoryInformation.cmake"
  "lib/fih/CMakeFiles/CMakeDirectoryInformation.cmake"
  "tools/manifest_config.h"
  "tools/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/CMakeFiles/CMakeDirectoryInformation.cmake"
  "generated/secure_fw/spm/include/tfm_version.h"
  "secure_fw/spm/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/lib/runtime/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/crypto/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/crypto/mbedcrypto/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/crypto/mbedcrypto/include/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/crypto/mbedcrypto/3rdparty/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/example_partition/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/initial_attestation/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/protected_storage/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/internal_trusted_storage/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/platform/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/firmware_update/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/ns_agent_tz/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/ns_agent_mailbox/CMakeFiles/CMakeDirectoryInformation.cmake"
  "secure_fw/partitions/idle_partition/CMakeFiles/CMakeDirectoryInformation.cmake"
  "tf-m-tests/CMakeFiles/CMakeDirectoryInformation.cmake"
  "tf-m-tests/log/CMakeFiles/CMakeDirectoryInformation.cmake"
  "tf-m-tests/app/CMakeFiles/CMakeDirectoryInformation.cmake"
  "tf-m-tests/test/CMakeFiles/CMakeDirectoryInformation.cmake"
  "generated/interface/include/psa/framework_feature.h"
  "interface/CMakeFiles/CMakeDirectoryInformation.cmake"
  "bl2/CMakeFiles/CMakeDirectoryInformation.cmake"
  "bl2/ext/mcuboot/mcuboot_config/mcuboot_config.h"
  "bl2/ext/mcuboot/signing_layout_s.c"
  "bl2/ext/mcuboot/signing_layout_ns.c"
  "bl2/ext/mcuboot/CMakeFiles/CMakeDirectoryInformation.cmake"
  "bl2/ext/mcuboot/bootutil/CMakeFiles/CMakeDirectoryInformation.cmake"
  "bl2/mbedcrypto/CMakeFiles/CMakeDirectoryInformation.cmake"
  "bl2/mbedcrypto/include/CMakeFiles/CMakeDirectoryInformation.cmake"
  "bl2/mbedcrypto/3rdparty/CMakeFiles/CMakeDirectoryInformation.cmake"
  "bl2/mbedcrypto/library/CMakeFiles/CMakeDirectoryInformation.cmake"
  "platform/CMakeFiles/CMakeDirectoryInformation.cmake"
  "platform/ns/CMakeFiles/CMakeDirectoryInformation.cmake"
  "platform/target/CMakeFiles/CMakeDirectoryInformation.cmake"
  "platform/ext/accelerator/CMakeFiles/CMakeDirectoryInformation.cmake"
  "platform/ext/accelerator/stm/CMakeFiles/CMakeDirectoryInformation.cmake"
  )

# Dependency information for all targets:
set(CMAKE_DEPEND_INFO_FILES
  "lib/ext/qcbor/CMakeFiles/tfm_qcbor_s.dir/DependInfo.cmake"
  "lib/ext/t_cose/CMakeFiles/tfm_t_cose_s.dir/DependInfo.cmake"
  "lib/fih/CMakeFiles/tfm_fih.dir/DependInfo.cmake"
  "secure_fw/CMakeFiles/tfm_s.dir/DependInfo.cmake"
  "secure_fw/CMakeFiles/tfm_s_bin.dir/DependInfo.cmake"
  "secure_fw/CMakeFiles/tfm_s_elf.dir/DependInfo.cmake"
  "secure_fw/CMakeFiles/tfm_s_hex.dir/DependInfo.cmake"
  "secure_fw/CMakeFiles/tfm_s_binaries.dir/DependInfo.cmake"
  "secure_fw/CMakeFiles/tfm_s_veneers.dir/DependInfo.cmake"
  "secure_fw/spm/CMakeFiles/tfm_spm.dir/DependInfo.cmake"
  "secure_fw/partitions/lib/runtime/CMakeFiles/tfm_sprt.dir/DependInfo.cmake"
  "secure_fw/partitions/crypto/CMakeFiles/tfm_psa_rot_partition_crypto.dir/DependInfo.cmake"
  "secure_fw/partitions/crypto/mbedcrypto/CMakeFiles/crypto_service_apidoc.dir/DependInfo.cmake"
  "secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedcrypto.dir/DependInfo.cmake"
  "secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedx509.dir/DependInfo.cmake"
  "secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_mbedtls.dir/DependInfo.cmake"
  "secure_fw/partitions/crypto/mbedcrypto/library/CMakeFiles/crypto_service_lib.dir/DependInfo.cmake"
  "secure_fw/partitions/example_partition/CMakeFiles/tfm_app_rot_partition_example.dir/DependInfo.cmake"
  "secure_fw/partitions/internal_trusted_storage/CMakeFiles/tfm_psa_rot_partition_its.dir/DependInfo.cmake"
  "tf-m-tests/app/CMakeFiles/tfm_api_ns.dir/DependInfo.cmake"
  "tf-m-tests/app/CMakeFiles/tfm_test_app.dir/DependInfo.cmake"
  "tf-m-tests/app/CMakeFiles/tfm_ns.dir/DependInfo.cmake"
  "tf-m-tests/app/CMakeFiles/tfm_ns_bin.dir/DependInfo.cmake"
  "tf-m-tests/app/CMakeFiles/tfm_ns_elf.dir/DependInfo.cmake"
  "tf-m-tests/app/CMakeFiles/tfm_ns_hex.dir/DependInfo.cmake"
  "tf-m-tests/app/CMakeFiles/tfm_ns_binaries.dir/DependInfo.cmake"
  "bl2/CMakeFiles/bl2.dir/DependInfo.cmake"
  "bl2/CMakeFiles/bl2_bin.dir/DependInfo.cmake"
  "bl2/CMakeFiles/bl2_elf.dir/DependInfo.cmake"
  "bl2/CMakeFiles/bl2_hex.dir/DependInfo.cmake"
  "bl2/CMakeFiles/bl2_binaries.dir/DependInfo.cmake"
  "bl2/ext/mcuboot/CMakeFiles/signing_layout_s.dir/DependInfo.cmake"
  "bl2/ext/mcuboot/CMakeFiles/tfm_s_ns_bin.dir/DependInfo.cmake"
  "bl2/ext/mcuboot/CMakeFiles/tfm_s_signed_bin.dir/DependInfo.cmake"
  "bl2/ext/mcuboot/CMakeFiles/signing_layout_ns.dir/DependInfo.cmake"
  "bl2/ext/mcuboot/CMakeFiles/tfm_ns_signed_bin.dir/DependInfo.cmake"
  "bl2/ext/mcuboot/CMakeFiles/tfm_s_ns_signed_bin.dir/DependInfo.cmake"
  "bl2/ext/mcuboot/CMakeFiles/signed_images.dir/DependInfo.cmake"
  "bl2/ext/mcuboot/bootutil/CMakeFiles/bootutil.dir/DependInfo.cmake"
  "bl2/mbedcrypto/CMakeFiles/bl2_apidoc.dir/DependInfo.cmake"
  "bl2/mbedcrypto/library/CMakeFiles/bl2_mbedcrypto.dir/DependInfo.cmake"
  "bl2/mbedcrypto/library/CMakeFiles/bl2_mbedx509.dir/DependInfo.cmake"
  "bl2/mbedcrypto/library/CMakeFiles/bl2_mbedtls.dir/DependInfo.cmake"
  "bl2/mbedcrypto/library/CMakeFiles/bl2_lib.dir/DependInfo.cmake"
  "platform/CMakeFiles/platform_s.dir/DependInfo.cmake"
  "platform/CMakeFiles/platform_bl2.dir/DependInfo.cmake"
  "platform/CMakeFiles/platform_crypto_keys.dir/DependInfo.cmake"
  "platform/ns/CMakeFiles/platform_ns.dir/DependInfo.cmake"
  "platform/target/CMakeFiles/tfm_s_scatter.dir/DependInfo.cmake"
  "platform/target/CMakeFiles/tfm_ns_scatter.dir/DependInfo.cmake"
  "platform/target/CMakeFiles/bl2_scatter.dir/DependInfo.cmake"
  "platform/ext/accelerator/CMakeFiles/bl2_crypto_hw.dir/DependInfo.cmake"
  "platform/ext/accelerator/CMakeFiles/crypto_service_crypto_hw.dir/DependInfo.cmake"
  )
