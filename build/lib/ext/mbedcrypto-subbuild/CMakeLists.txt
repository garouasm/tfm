# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.16.3)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(mbedcrypto-populate NONE)

include(ExternalProject)
ExternalProject_Add(mbedcrypto-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "https://github.com/Mbed-TLS/mbedtls.git" "GIT_TAG" "mbedtls-3.2.1" "GIT_SHALLOW" "TRUE" "GIT_PROGRESS" "TRUE" "GIT_SUBMODULES"
                    SOURCE_DIR          "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-src"
                    BINARY_DIR          "/home/bento/trusted-firmware-m/tfm/build/lib/ext/mbedcrypto-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)
