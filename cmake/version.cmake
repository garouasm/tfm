#-------------------------------------------------------------------------------
# Copyright (c) 2021-2022, Arm Limited. All rights reserved.
#
# SPDX-License-Identifier: BSD-3-Clause
#
#-------------------------------------------------------------------------------

execute_process(COMMAND git describe --tags --always
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    OUTPUT_VARIABLE TFM_VERSION_FULL
    OUTPUT_STRIP_TRAILING_WHITESPACE)

string(REGEX REPLACE "TF-M" "" TFM_VERSION_FULL ${TFM_VERSION_FULL})
# remove a commit number
string(REGEX REPLACE "-[0-9]+-g" "+" TFM_VERSION_FULL ${TFM_VERSION_FULL})
string(REGEX MATCH "[0-9]+\\.[0-9]+\\.[0-9]+" TFM_VERSION ${TFM_VERSION_FULL})
set(TFM_VERSION "1.6.0")
