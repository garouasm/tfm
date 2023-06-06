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
#include "psa/initial_attestation.h"
#include "tfm_plat_test.h"
#include "tfm_sp_log.h"
#include "tfm_its_defs.h"


#define print(x, y) for (size_t i = 0; i < y; i++){printf("%c",*x);}printf("\r\n")
#define printif(x)     if (x == PSA_SUCCESS) {LOG_INFFMT("TA Attestation error\r\n");}
#define PSA_KEY_ID_NONCE ((psa_key_id_t)0x2)

/**
 * \brief An example service implementation that prints out an argument from the
 *        client and then starts a timer.
 */
void generate_key2(struct tfm_crypto_pack_iovec* iov, 
                    struct psa_invec invecs[], struct psa_outvec outvecs[]){
    
    psa_key_id_t user_key;
    struct psa_invec destroy_in[1];
    iov->key_id = PSA_KEY_ID_NONCE;
    iov->alg = PSA_ALG_CFB;

    //initialize key attributes
    psa_key_attributes_t key_attributes = psa_key_attributes_init();

    psa_set_key_lifetime(&key_attributes, PSA_KEY_LIFETIME_PERSISTENT);
    psa_set_key_usage_flags(&key_attributes,(PSA_KEY_USAGE_ENCRYPT | PSA_KEY_USAGE_DECRYPT));
    psa_set_key_algorithm(&key_attributes,PSA_ALG_CFB);
    psa_set_key_type(&key_attributes, PSA_KEY_TYPE_AES);
    psa_set_key_bits(&key_attributes, 256);
    psa_set_key_id(&key_attributes, PSA_KEY_ID_NONCE);

    destroy_in[0].base = iov;
    destroy_in[0].len = sizeof(struct tfm_crypto_pack_iovec);

    invecs[0].base = iov;
    invecs[0].len = sizeof(struct tfm_crypto_pack_iovec);

    invecs[1].base = &key_attributes;
    invecs[1].len = sizeof(struct psa_client_key_attributes_s);

    outvecs[0].base = &user_key;
    outvecs[0].len = sizeof(psa_key_id_t);

    // a call to destroy a previously stored key
    iov->function_id = TFM_CRYPTO_DESTROY_KEY_SID;
    psa_call(0x40000100U, PSA_IPC_CALL, destroy_in, 1, NULL, 0);

    //a call to generate key
    iov->function_id = TFM_CRYPTO_GENERATE_KEY_SID;
    psa_call(0x40000100U, PSA_IPC_CALL, invecs, 2, outvecs, 1);
}


void ta_attestation(const uint8_t *auth_challenge, uint8_t *token_buf,
                    size_t *token_size)
{
    psa_status_t status;

    status = psa_initial_attest_get_token(auth_challenge, PSA_AEAD_NONCE_MAX_SIZE, 
                                        token_buf, PSA_INITIAL_ATTEST_MAX_TOKEN_SIZE,
                                        token_size);

    printif(status);
}


/**
 * \brief An example service implementation that prints out an argument from the
 *        client and then starts a timer.
 */
psa_status_t tfm_ta_attestation_service_sfn(const psa_msg_t *msg)
{ 
    size_t                              *token_size, nonce_size;      
    uint8_t                             *token_buf, *nonce;
    psa_status_t                        status;
    struct psa_invec                    invec[2];
    struct psa_outvec                   outvec[1];
    struct psa_aead_operation_s         operation_ctx;
    struct tfm_crypto_pack_iovec        iov;

    
    switch (msg->type) {
    case PSA_TA_ATTESTATION_CALL:
        LOG_INFFMT("[DBG][TA ATTESTATION] SFN OPERATION 1\r\n");
        generate_key2(&iov, invec, outvec);
        LOG_INFFMT("[DBG][TA ATTESTATION] GENERATE KEY DONE\r\n");


        nonce_size = PSA_AEAD_NONCE_MAX_SIZE;
        operation_ctx = psa_aead_operation_init();

        iov.function_id = TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID;
        iov.op_handle = operation_ctx.handle;

        invec[0].base = &iov;
        invec[0].len = sizeof(struct tfm_crypto_pack_iovec);
        outvec[0].base = &(operation_ctx.handle);
        outvec[0].len = sizeof(uint32_t);

        status = psa_call(0x40000100U, PSA_IPC_CALL, invec, 1, outvec, 1);
        printif(status);
        LOG_INFFMT("[DBG][TA ATTESTATION] ENCRYPT SETUP DONE\r\n");


        iov.function_id = TFM_CRYPTO_AEAD_GENERATE_NONCE_SID;
        iov.op_handle = operation_ctx.handle;

        invec[0].base = &iov;
        invec[0].len = sizeof(struct tfm_crypto_pack_iovec);

        outvec[0].base = nonce;
        outvec[0].len = nonce_size;

        status = psa_call(0x40000100U, PSA_IPC_CALL, invec, 1, outvec, 1);
        printif(status);
        LOG_INFFMT("[DBG][TA ATTESTATION] NONCE CREATION DONE\r\n");


        print(token_buf, *token_size);
        ta_attestation((const)nonce, token_buf, token_size);
        print(token_buf, *token_size);

        LOG_INFFMT("[DBG][TA ATTESTATION] SUCCESS\r\n");

        return PSA_SUCCESS;
    

    case PSA_TEST_TA_ATTESTATION_CALL:
        LOG_INFFMT("TA Attestation test sucess\r\n");
        
        return PSA_SUCCESS;
    default:
        LOG_INFFMT("TA Attestation error\r\n");
        return PSA_ERROR_NOT_SUPPORTED;
    }
}

/**
 * \brief The example partition's entry function.
 */
psa_status_t tfm_ta_attestation_init(void)
{

    LOG_INFFMT("[DBG][TA ATTESTATION] TFM_ENTRY_POINT...\r\n");
    return PSA_SUCCESS;
}
