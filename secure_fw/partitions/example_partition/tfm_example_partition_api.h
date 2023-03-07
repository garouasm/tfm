/*
 * Copyright (c) 2020, Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#ifndef __TFM_EXAMPLE_PARTITION_API_H__
#define __TFM_EXAMPLE_PARTITION_API_H__

#include <stdint.h>

#include "psa/error.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 * \brief Makes a psa_call to the example partition.
 *
 * \param[in] arg  Example parameter
 *
 * \return Returns error code as specified in \ref psa_status_t
 */
psa_status_t tfm_example_service_sfn(const psa_msg_t *msg);


psa_status_t tfm_example_partition_init(void);

#ifdef __cplusplus
}
#endif

#endif /* __TFM_EXAMPLE_PARTITION_API_H__ */
