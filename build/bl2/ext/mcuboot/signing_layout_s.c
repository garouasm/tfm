/*
 * Copyright (c) 2020-2022, Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */
#include "region_defs.h"
/* Enumeration that is used by the assemble.py and imgtool.py scripts
 * for correct binary generation when nested macros are used
 */
enum image_attributes {
    RE_SECURE_IMAGE_OFFSET       = SECURE_IMAGE_OFFSET,
    RE_SECURE_IMAGE_MAX_SIZE     = SECURE_IMAGE_MAX_SIZE,
    RE_NON_SECURE_IMAGE_OFFSET   = NON_SECURE_IMAGE_OFFSET,
    RE_NON_SECURE_IMAGE_MAX_SIZE = NON_SECURE_IMAGE_MAX_SIZE,
#ifdef S_IMAGE_LOAD_ADDRESS
    RE_IMAGE_LOAD_ADDRESS        = S_IMAGE_LOAD_ADDRESS,
#endif
    RE_SIGN_BIN_SIZE = FLASH_AREA_0_SIZE,
#ifdef IMAGE_ROM_FIXED
    RE_IMAGE_ROM_FIXED = S_IMAGE_PRIMARY_PARTITION_OFFSET
#endif
};
