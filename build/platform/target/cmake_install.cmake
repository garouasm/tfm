# Install script for directory: /home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/nucleo_l552ze_q

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/sam/Desktop/trusted-firmware-m/build/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/opt/gcc-arm-none-eabi-10.3-2021.10/bin/arm-none-eabi-objdump")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/sam/Desktop/trusted-firmware-m/build/scripts/stm_tool.py;/home/sam/Desktop/trusted-firmware-m/build/scripts/bin2hex.py;/home/sam/Desktop/trusted-firmware-m/build/scripts/macro_parser.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/sam/Desktop/trusted-firmware-m/build/scripts" TYPE FILE FILES
    "/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/nucleo_l552ze_q/../common/scripts/stm_tool.py"
    "/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/nucleo_l552ze_q/../common/scripts/bin2hex.py"
    "/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/common/stm32l5xx/../../../../../../bl2/ext/mcuboot/scripts/macro_parser.py"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/sam/Desktop/trusted-firmware-m/build/regression.sh;/home/sam/Desktop/trusted-firmware-m/build/preprocess.sh;/home/sam/Desktop/trusted-firmware-m/build/TFM_UPDATE.sh;/home/sam/Desktop/trusted-firmware-m/build/TFM_BIN2HEX.sh;/home/sam/Desktop/trusted-firmware-m/build/postbuild.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/sam/Desktop/trusted-firmware-m/build" TYPE FILE PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ FILES
    "/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/nucleo_l552ze_q/../common/scripts/regression.sh"
    "/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/nucleo_l552ze_q/../common/scripts/gcc/preprocess.sh"
    "/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/nucleo_l552ze_q/../common/scripts/TFM_UPDATE.sh"
    "/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/nucleo_l552ze_q/../common/scripts/TFM_BIN2HEX.sh"
    "/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/nucleo_l552ze_q/../common/scripts/postbuild.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/sam/Desktop/trusted-firmware-m/build/flash_layout.h;/home/sam/Desktop/trusted-firmware-m/build/region_defs.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/sam/Desktop/trusted-firmware-m/build" TYPE FILE FILES
    "/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/nucleo_l552ze_q/include/flash_layout.h"
    "/home/sam/Desktop/trusted-firmware-m/platform/ext/target/stm/nucleo_l552ze_q/include/region_defs.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/sam/Desktop/trusted-firmware-m/build/image_macros_to_preprocess_bl2.c")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/sam/Desktop/trusted-firmware-m/build" TYPE FILE FILES "/home/sam/Desktop/trusted-firmware-m/build/platform/target/image_macros_to_preprocess_bl2.c")
endif()
