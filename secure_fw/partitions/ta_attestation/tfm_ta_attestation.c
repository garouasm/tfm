/*
 * Copyright (c) 2020-2021, Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#include <stdint.h>

#include "psa/service.h"
#include "psa/client.h"
#include "stddef.h"
#include "tfm_crypto_defs.h"
#include "tfm_example_partition_api.h"
#include "psa/internal_trusted_storage.h"
#include "tfm_plat_test.h"
#include "tfm_sp_log.h"
#include "tfm_its_defs.h"


/**
 * \brief An example service implementation that prints out an argument from the
 *        client and then starts a timer.
 */
psa_status_t tfm_ta_attestation_service_sfn(const psa_msg_t *msg)
{ 
    return PSA_SUCCESS;
}

/**
 * \brief The example partition's entry function.
 */
psa_status_t tfm_ta_attestation_init(void)
{

    LOG_INFFMT("[DBG][TA ATTESTATION] TFM_ENTRY_POINT...\r\n");
    return PSA_SUCCESS;
}
