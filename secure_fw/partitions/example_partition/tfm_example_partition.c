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

#define PSA_KEY_ID_USER_1 ((psa_key_id_t)0x1)
#define PSA_KEY_ID_USER_2 ((psa_key_id_t)0x22222222)

/**
 * \brief An example service implementation that prints out an argument from the
 *        client and then starts a timer.
 */
psa_status_t tfm_example_service_sfn(const psa_msg_t *msg)
{ 
    psa_status_t status = PSA_ERROR_CONNECTION_REFUSED;

    struct tfm_crypto_pack_iovec iov;
    iov.key_id = PSA_KEY_ID_USER_1;

    //initialize key attributes
    psa_key_attributes_t key_attributes = psa_key_attributes_init();

    psa_set_key_lifetime(&key_attributes, PSA_KEY_LIFETIME_PERSISTENT);
    psa_set_key_usage_flags(&key_attributes,PSA_KEY_USAGE_ENCRYPT);
    psa_set_key_algorithm(&key_attributes,PSA_ALG_CFB);
    psa_set_key_type(&key_attributes, PSA_KEY_TYPE_AES);
    psa_set_key_bits(&key_attributes, 256);
    psa_set_key_id(&key_attributes, PSA_KEY_ID_USER_1);
    
    // initialize destroy key call structures
    struct psa_invec destroy_in[1];

    destroy_in[0].base = &iov;
    destroy_in[0].len = sizeof(struct tfm_crypto_pack_iovec);

    //initialize generate key call structures
    struct psa_invec invecs[2];
    struct psa_outvec outvecs[1];
    psa_key_id_t user_key;

    invecs[0].base = &iov;
    invecs[0].len = sizeof(struct tfm_crypto_pack_iovec);

    invecs[1].base = &key_attributes;
    invecs[1].len = sizeof(struct psa_client_key_attributes_s);

    outvecs[0].base = &user_key;
    outvecs[0].len = sizeof(psa_key_id_t);

    switch (msg->type) {
    case PSA_IPC_CALL:

        LOG_INFFMT("Hello secure world! \r\n");

        // a call to destroy a previously stored key
        iov.function_id = TFM_CRYPTO_DESTROY_KEY_SID;
        status = psa_call(0x40000100U,PSA_IPC_CALL,destroy_in, 1, NULL, 0);

        //a call to generate key
        iov.function_id = TFM_CRYPTO_GENERATE_KEY_SID;
        status = psa_call(0x40000100U,PSA_IPC_CALL,invecs, 2, outvecs, 1);

        if (status != PSA_SUCCESS){
            LOG_INFFMT("Error generating key\r\n");
            return PSA_ERROR_PROGRAMMER_ERROR;
            }

        else {
                LOG_INFFMT("Key generated successfully\r\n");
                psa_destroy_key(PSA_KEY_ID_USER_1);
        }
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
