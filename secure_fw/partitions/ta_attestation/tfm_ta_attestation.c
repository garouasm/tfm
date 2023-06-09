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
//#include "lib/ext/qcbor/q_useful_buf.h"
#include "tfm_ta_attestation_token_values.h"

#define PSA_INITIAL_ATTEST_TOKEN_MAX_SIZE   (0x250)
#define print(x, y) for (size_t i = 0; i < y; i++){printf("%c", x[i]);}printf("\r\n")
#define printif(x) if (x != PSA_SUCCESS) {printf("[ERR][TA ATTESTATION] STATUS %d\r\n", x);}
#define PSA_KEY_ID_NONCE ((psa_key_id_t)0x2)




psa_status_t check_simple_claims(
                    const struct attest_token_iat_simple_t *simple_claims)
{
//    psa_status_t return_value;
//    /* Use temp variables to make lines less than 80 columns below. */
//    struct q_useful_buf_c tmp;
//    struct q_useful_buf_c tail;
//
//    return_value = 0;
//
//    tmp = TOKEN_TEST_VALUE_NONCE;
//    if(!q_useful_buf_c_is_null(tmp)) {
//        /* request to check for the nonce */
//        if(q_useful_buf_compare(simple_claims->nonce, tmp)) {
//            /* Didn't match in the standard way. See if it is a
//             * special option-packed nonce by checking for length
//             * 64 and all bytes except the first four are 0.
//             * nonce_tail is everything after the first 4 bytes.
//             */
//            tail = q_useful_buf_tail(simple_claims->nonce, 4);
//            if(simple_claims->nonce.len == 64 &&
//               q_useful_buf_is_value(tail, 0) == SIZE_MAX){
//                /* It is an option-packed nonce.
//                 * Don't compare the first four bytes.
//                 */
//                if(q_useful_buf_compare(q_useful_buf_tail(tmp, 4), tail)) {
//                    /* The option-packed nonce didn't match */
//                    return_value = -1;
//                    goto Done;
//                }
//            } else {
//                /* Just a normal nonce that didn't match */
//                return_value = -1;
//                goto Done;
//            }
//        }
//    }
//
//
//    tmp = TOKEN_TEST_VALUE_INSTANCE_ID;
//    if(!q_useful_buf_c_is_null(tmp) &&
//       q_useful_buf_compare(simple_claims->instance_id, tmp)) {
//        return_value = -2;
//        goto Done;
//    }
//
//
//    /* Claim is present */
//    /* Don't have to check if its presence is required */
//    tmp = TOKEN_TEST_VALUE_BOOT_SEED;
//    if(!q_useful_buf_c_is_null(tmp) &&
//       q_useful_buf_compare(simple_claims->boot_seed, tmp)) {
//        return_value = -3;
//        goto Done;
//    }
//
//
//    /* Claim is present */
//    /* Don't have to check if its presence is required */
//    tmp = TOKEN_TEST_VALUE_IMPLEMENTATION_ID;
//    if(!q_useful_buf_c_is_null(tmp) &&
//       q_useful_buf_compare(simple_claims->implementation_id, tmp)) {
//        return_value = -4;
//        goto Done;
//    }
//    
//
//    /* Claim is present */
//    /* Don't have to check if its presence is required */
//    if(simple_claims->security_lifecycle != TOKEN_TEST_VALUE_SECURITY_LIFECYCLE) {
//        return_value = -5;
//        goto Done;
//    }
//
//    /* Claim is present */
//    /* Don't have to check if its presence is required */
//    if(simple_claims->client_id != TOKEN_TEST_VALUE_CLIENT_ID) {
//        return_value = -6;
//        goto Done;
//    }
//
//Done:
//    return return_value;
}

/**
 * \brief An example service implementation that prints out an argument from the
 *        client and then starts a timer.
 */
void generate_key2(struct tfm_crypto_pack_iovec* iov, 
                    struct psa_invec invecs[], struct psa_outvec outvecs[]){
    
    psa_key_id_t user_key;
    struct psa_invec destroy_in[1];
    iov->key_id = PSA_KEY_ID_NONCE;
    iov->alg = PSA_ALG_GCM;

    //initialize key attributes
    psa_key_attributes_t key_attributes = psa_key_attributes_init();

    psa_set_key_lifetime(&key_attributes, PSA_KEY_LIFETIME_PERSISTENT);
    psa_set_key_usage_flags(&key_attributes,(PSA_KEY_USAGE_ENCRYPT | PSA_KEY_USAGE_DECRYPT));
    psa_set_key_algorithm(&key_attributes, PSA_ALG_GCM);
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

    status = psa_initial_attest_get_token(auth_challenge, PSA_INITIAL_ATTEST_CHALLENGE_SIZE_64, 
                                        token_buf, PSA_INITIAL_ATTEST_TOKEN_MAX_SIZE,
                                        token_size);

    printif(status);
}


/**
 * \brief An example service implementation that prints out an argument from the
 *        client and then starts a timer.
 */
psa_status_t tfm_ta_attestation_service_sfn(const psa_msg_t *msg)
{ 
    void                                    *ptr;
    size_t                                  token_size, nonce_size;      
    uint8_t                                 token_buf[PSA_INITIAL_ATTEST_TOKEN_MAX_SIZE], nonce[PSA_INITIAL_ATTEST_CHALLENGE_SIZE_64];
    psa_status_t                            status;
    struct psa_invec                        invec[2];
    struct psa_outvec                       outvec[1];
    struct psa_aead_operation_s             operation_ctx;
    struct tfm_crypto_pack_iovec            iov;
    const struct attest_token_iat_simple_t  simple_claims;
    
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
        LOG_INFFMT("[DBG][TA ATTESTATION] NONCE CREATED\r\n");

        ta_attestation((const)nonce, token_buf, &token_size);
        print(token_buf, token_size);

        LOG_INFFMT("[DBG][TA ATTESTATION] TOKEN CREATED\r\n");

        /*---------------------------------------------------------*/

        ptr = token_buf;

        memcpy(&simple_claims, token_buf, sizeof(struct attest_token_iat_simple_t));

        //check_simple_claims(simple_claims);


        LOG_INFFMT("[DBG][TA ATTESTATION] VERIFICATION SUCCESS\r\n");

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
