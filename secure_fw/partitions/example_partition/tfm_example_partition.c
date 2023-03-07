/*
 * Copyright (c) 2020-2021, Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#include <stdint.h>

#include "psa/service.h"
#include "psa/client.h"
#include "tfm_crypto_defs.h"
#include "tfm_example_partition_api.h"
#include "psa_manifest/tfm_example_partition.h"
#include "tfm_plat_test.h"
#include "tfm_sp_log.h"

/**
 * \brief An example service implementation that prints out an argument from the
 *        client and then starts a timer.
 */
psa_status_t tfm_example_service_sfn(const psa_msg_t *msg)
{ 
    struct tfm_crypto_pack_iovec iov = {
        .function_id = TFM_CRYPTO_HASH_COMPUTE_SID,
        .alg = PSA_ALG_SHA_512,
    };
    const int BUFFER_LEN = 32;
    //int i;
    struct psa_invec invecs[1];
    invecs[0].base = &iov;
    invecs[0].len = sizeof(struct tfm_crypto_pack_iovec);
    uint8_t rec_buf[BUFFER_LEN];
    uint8_t send_buf[] = "Hello World bento e samuel";
    LOG_INFFMT("Hello secure world! \r\n");
    /* Decode the message */
    switch (msg->type) {
    case PSA_IPC_CALL:

        LOG_INFFMT("Hello secure world! \r\n");
   
    if (msg->in_size[1] != 0) {
        psa_read(msg->handle, 1, rec_buf, BUFFER_LEN);
        LOG_INFFMT("READ! \r\n");
    }
    if (msg->in_size[0] != 0) { 
        psa_read(msg->handle, 0, rec_buf, BUFFER_LEN);
        LOG_INFFMT("READ! \r\n");
    }
    if (msg->out_size[0] != 0) {
        psa_write(msg->handle, 0, send_buf, sizeof(send_buf));
    }
    if (msg->out_size[1] != 0) {
        psa_write(msg->handle, 1, send_buf, sizeof(send_buf));
    }

        psa_call(0x40000100U,PSA_IPC_CALL,invecs, 1, NULL, 0);
        // tfm_crypto_sfn(msg);
        return PSA_SUCCESS;
    default:
        LOG_INFFMT("Secure World error\r\n");
        return PSA_ERROR_NOT_SUPPORTED;
    }
}

/**
 * \brief The example partition's entry function.
 */
psa_status_t tfm_example_partition_init(void)
{

    LOG_INFFMT("[DBG][Example] TFM_ENTRY_POINT...\r\n");
    return PSA_SUCCESS;
}
