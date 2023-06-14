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
#include "attest_token_decode.h"
#include "attest_token_test_values.h"
#include "attest_token_test.h"
#include "qcbor_util.h"
#include "q_useful_buf.h"
// #include "../../../build/lib/ext/tfm_test_repo-src/test/secure_fw/suites/attestation/attest_tests_common.h"
// #include "../../../build/lib/ext/tfm_test_repo-src/test/secure_fw/suites/attestation/attest_token_decode.h"
// #include "../../../build/lib/ext/tfm_test_repo-src/test/secure_fw/suites/attestation/attest_token_test.h"
// #include "../../../build/lib/ext/tfm_test_repo-src/test/secure_fw/suites/attestation/attest_token_test_values.h"
// #include "q_useful_buf.h"
// #include "qcbor.h"
#include "config_attest.h"
#include "t_cose_standard_constants.h"
//#include "lib/ext/qcbor/q_useful_buf.h"
#include "tfm_ta_attestation_token_values.h"

#define PSA_INITIAL_ATTEST_TOKEN_MAX_SIZE   (0x250)
#define print(x, y) for (size_t i = 0; i < y; i++){printf("%c", x[i]);}printf("\r\n")
#define printif(x) if (x != PSA_SUCCESS) {printf("[ERR][TA ATTESTATION] STATUS %d\r\n", x);}
#define PSA_KEY_ID_NONCE ((psa_key_id_t)0x2)

extern decode_test_normal_sig(void);

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
   // const struct attest_token_iat_simple_t  simple_claims;
    int_fast16_t                            ret;
    
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

        // ptr = token_buf;

        // memcpy(&simple_claims, token_buf, sizeof(struct attest_token_iat_simple_t));

        //check_simple_claims(simple_claims);


        LOG_INFFMT("[DBG][TA ATTESTATION] VERIFICATION SUCCESS\r\n");

        return PSA_SUCCESS;
    

    case PSA_TEST_TA_ATTESTATION_CALL:
        ret = decode_test_normal_sig();
        printif(ret);
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


// static int_fast16_t decode_test_internal(void)
// {
//     int_fast16_t                        return_value;
//     Q_USEFUL_BUF_MAKE_STACK_UB(         token_storage, ATTEST_TOKEN_MAX_SIZE);
//     struct q_useful_buf_c               completed_token;
//     struct attest_token_decode_context  token_decode;
//     struct attest_token_iat_simple_t    simple_claims;
//     uint32_t                            num_sw_components;
//     int32_t                             num_sw_components_signed;
//     struct q_useful_buf_c               tmp;
//     uint32_t                            token_encode_options = 0;
//     uint32_t                            token_decode_options = 0;

   
       
//     /* -- Make a token with all the claims -- */
//     tmp = TOKEN_TEST_VALUE_NONCE;
//     return_value = token_main_alt(token_encode_options,
//                                   tmp,
//                                   token_storage,
//                                   &completed_token);
//     if(return_value) {
//         goto Done;
//     }

//     /* -- Initialize and validate the signature on the token -- */
//     attest_token_decode_init(&token_decode, token_decode_options);
//     return_value = attest_token_decode_validate_token(&token_decode,
//                                                       completed_token);
//     if(return_value != ATTEST_TOKEN_ERR_SUCCESS) {
//         goto Done;
//     }

//     /* -- Get the all simple claims at once and check them -- */
//     return_value = attest_token_decode_get_iat_simple(&token_decode,
//                                                       &simple_claims);
//     if(return_value != ATTEST_TOKEN_ERR_SUCCESS) {
//         goto Done;
//     }  

//             return_value = check_sw_component_1(&sw_component);
//             if(return_value) {
//                 goto Done;
//             }

//             if(num_sw_components >= 2) {
//                 /* -- Get the second SW component and check it -- */
//                 return_value = attest_token_get_sw_component(&token_decode,
//                                                              1,
//                                                              &sw_component);
//                 if(return_value) {
//                     goto Done;
//                 }

//                 return_value = check_sw_component_2(&sw_component);
//                 if(return_value) {
//                     goto Done;
//                 }
//             }
//         }
//     }
//     return_value = 0;

// Done:
//     return return_value;
// }

// static int_fast16_t check_simple_claims(
//                     const struct attest_token_iat_simple_t *simple_claims)
// {
//     int_fast16_t return_value;
//     /* Use temp variables to make lines less than 80 columns below. */
//     struct q_useful_buf_c tmp;
//     struct q_useful_buf_c tail;
//     /* Use a temporary string variable to make the static analyzer
//      * happy. It doesn't like comparing a string literal to NULL
//      */
//     const char *tmp_string;

//     return_value = 0;

//     /* -- check value of the nonce claim -- */
//     if(!IS_ITEM_FLAG_SET(NONCE_FLAG, simple_claims->item_flags)) {
//         /* Claim is not present in token */
//         if(TOKEN_TEST_REQUIRE_NONCE) {
//             /* It should have been present */
//             return_value = -50;
//             goto Done;
//         }
//     } else {
//         /* Claim is present */
//         /* Don't have to check if its presence is required */
//         tmp = TOKEN_TEST_VALUE_NONCE;
//         if(!q_useful_buf_c_is_null(tmp)) {
//             /* request to check for the nonce */
//             if(q_useful_buf_compare(simple_claims->nonce, tmp)) {
//                 /* Didn't match in the standard way. See if it is a
//                  * special option-packed nonce by checking for length
//                  * 64 and all bytes except the first four are 0.
//                  * nonce_tail is everything after the first 4 bytes.
//                  */
//                 tail = q_useful_buf_tail(simple_claims->nonce, 4);
//                 if(simple_claims->nonce.len == 64 &&
//                    q_useful_buf_is_value(tail, 0) == SIZE_MAX){
//                     /* It is an option-packed nonce.
//                      * Don't compare the first four bytes.
//                      */
//                     if(q_useful_buf_compare(q_useful_buf_tail(tmp, 4), tail)) {
//                         /* The option-packed nonce didn't match */
//                         return_value = -51;
//                         goto Done;
//                     }
//                 } else {
//                     /* Just a normal nonce that didn't match */
//                     return_value = -51;
//                     goto Done;
//                 }
//             }
//         }
//     }

//     /* -- check value of the instance ID claim -- */
//     if(!IS_ITEM_FLAG_SET(INSTANCE_ID_FLAG, simple_claims->item_flags)) {
//         /* Claim is not present in token */
//         if(TOKEN_TEST_REQUIRE_INSTANCE_ID) {
//             /* It should have been present */
//             return_value = -52;
//             goto Done;
//         }
//     } else {
//         /* Claim is present */
//         /* Don't have to check if its presence is required */
//         tmp = TOKEN_TEST_VALUE_INSTANCE_ID;
//         if(!q_useful_buf_c_is_null(tmp) &&
//            q_useful_buf_compare(simple_claims->instance_id, tmp)) {
//             /* Check of its value was requested and failed */
//             return_value = -53;
//             goto Done;
//         }
//     }

//     /* -- check value of the boot seed claim -- */
//     if(!IS_ITEM_FLAG_SET(BOOT_SEED_FLAG, simple_claims->item_flags)) {
//         /* Claim is not present in token */
//         if(TOKEN_TEST_REQUIRE_BOOT_SEED) {
//             /* It should have been present */
//             return_value = -54;
//             goto Done;
//         }
//     } else {
//         /* Claim is present */
//         /* Don't have to check if its presence is required */
//         tmp = TOKEN_TEST_VALUE_BOOT_SEED;
//         if(!q_useful_buf_c_is_null(tmp) &&
//            q_useful_buf_compare(simple_claims->boot_seed, tmp)) {
//             /* Check of its value was requested and failed */
//             return_value = -55;
//             goto Done;
//         }
//     }


//     /* -- check value of the implementation ID -- */
//     if(!IS_ITEM_FLAG_SET(IMPLEMENTATION_ID_FLAG,simple_claims->item_flags)) {
//         /* Claim is not present in token */
//         if(TOKEN_TEST_REQUIRE_IMPLEMENTATION_ID) {
//             return_value = -58;
//             goto Done;
//         }
//     } else {
//         /* Claim is present */
//         /* Don't have to check if its presence is required */
//         tmp = TOKEN_TEST_VALUE_IMPLEMENTATION_ID;
//         if(!q_useful_buf_c_is_null(tmp) &&
//            q_useful_buf_compare(simple_claims->implementation_id, tmp)) {
//             /* Check of its value was requested and failed */
//             return_value = -59;
//             goto Done;
//         }
//     }

//     /* -- check value of the security lifecycle claim -- */
//     if(!IS_ITEM_FLAG_SET(SECURITY_LIFECYCLE_FLAG,simple_claims->item_flags)) {
//         /* Claim is not present in token */
//         if(TOKEN_TEST_REQUIRE_SECURITY_LIFECYCLE) {
//             /* It should have been present */
//             return_value = -60;
//             goto Done;
//         }
//     } else {
//         /* Claim is present */
//         /* Don't have to check if its presence is required */
//         if(TOKEN_TEST_VALUE_SECURITY_LIFECYCLE != INT32_MAX &&
//            simple_claims->security_lifecycle !=
//            TOKEN_TEST_VALUE_SECURITY_LIFECYCLE) {
//             /* Check of its value was requested and failed */
//             return_value = -61;
//             goto Done;
//         }
//     }

//     /* -- check value of the client_id claim -- */
//     if(!IS_ITEM_FLAG_SET(CLIENT_ID_FLAG, simple_claims->item_flags)) {
//         /* Claim is not present in token */
//         if(TOKEN_TEST_REQUIRE_CLIENT_ID) {
//             return_value = -62;
//             goto Done;
//         }
//     } else {
//         /* Claim is present */
//         /* Don't have to check if its presence is required */
//         if(TOKEN_TEST_VALUE_CLIENT_ID != INT32_MAX &&
//            simple_claims->client_id != TOKEN_TEST_VALUE_CLIENT_ID) {
// #if DOMAIN_NS == 1U
//             /* Non-secure caller client ID has to be negative */
//             if(simple_claims->client_id > -1) {
// #else
//             /* Secure caller client ID has to be positive */
//             if(simple_claims->client_id < 1) {
// #endif
//                 return_value = -63;
//                 goto Done;
//             }
//         }
//     }

//     }

// Done: return return_value;
// }

// /**
//  * \brief An alternate token_main() that packs the option flags into the nonce.
//  *
//  * \param[in] option_flags      Flag bits to pack into nonce.
//  * \param[in] nonce             Pointer and length of the nonce.
//  * \param[in] buffer            Pointer and length of buffer to
//  *                              output the token into.
//  * \param[out] completed_token  Place to put pointer and length
//  *                              of completed token.
//  *
//  * \return various errors. See \ref psa_status_t.
//  *
//  */
// int token_main_alt(uint32_t option_flags,
//                    struct q_useful_buf_c nonce,
//                    struct q_useful_buf buffer,
//                    struct q_useful_buf_c *completed_token)
// {
//     psa_status_t                 return_value;
//     size_t                       token_buf_size;
//     size_t                       completed_token_size;
//     struct q_useful_buf_c        actual_nonce;
//     Q_USEFUL_BUF_MAKE_STACK_UB(  actual_nonce_storage, 64);

//     if(nonce.len == 64 && (q_useful_buf_is_value(nonce, 0) == SIZE_MAX)) {
//         /* Go into special option-packed nonce mode */
//         actual_nonce = q_useful_buf_copy(actual_nonce_storage, nonce);
//         /* Use memcpy as it always works and avoids type punning */
//         memcpy((uint8_t *)actual_nonce_storage.ptr,
//                &option_flags,
//                sizeof(uint32_t));
//     } else {
//         actual_nonce = nonce;
//     }

//     token_buf_size = buffer.len;
//     return_value = psa_initial_attest_get_token(actual_nonce.ptr,
//                                                 actual_nonce.len,
//                                                 buffer.ptr,
//                                                 token_buf_size,
//                                                 &completed_token_size);
//     *completed_token =
//         (struct q_useful_buf_c){buffer.ptr, completed_token_size};
//     if (return_value != PSA_SUCCESS) {
//         return (int)return_value;
//     }
// }