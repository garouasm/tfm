# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.16.3)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(mcuboot-populate NONE)

include(ExternalProject)
ExternalProject_Add(mcuboot-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "https://github.com/mcu-tools/mcuboot.git" "GIT_TAG" "v1.9.0" "GIT_SHALLOW" "FALSE" "GIT_PROGRESS" "TRUE" "GIT_SUBMODULES" "docs"
                    SOURCE_DIR          "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mcuboot-src"
                    BINARY_DIR          "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mcuboot-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)
