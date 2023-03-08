# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.16.3)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(tfm_test_repo-populate NONE)

include(ExternalProject)
ExternalProject_Add(tfm_test_repo-populate
                     "UPDATE_DISCONNECTED" "False" "GIT_REPOSITORY" "https://git.trustedfirmware.org/TF-M/tf-m-tests.git" "GIT_TAG" "4c4b580" "GIT_PROGRESS" "TRUE"
                    SOURCE_DIR          "/home/bento/trusted-firmware-m/tfm/build/lib/ext/tfm_test_repo-src"
                    BINARY_DIR          "/home/bento/trusted-firmware-m/tfm/build/lib/ext/tfm_test_repo-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
)
