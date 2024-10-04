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
#include "config_attest.h"
#include "t_cose_standard_constants.h"
#include "tfm_ta_attestation_token_values.h"

#define PSA_INITIAL_ATTEST_TOKEN_MAX_SIZE (0x250)
// #define print2(x, y) for (size_t i = 0; i < y; i++){printf("%c", *x);x++;}printf("\r\n")
#define printif(x)                                        \
    if (x != PSA_SUCCESS)                                 \
    {                                                     \
        printf("[ERR][TA ATTESTATION] STATUS %d\r\n", x); \
    }
#define PSA_KEY_ID_NONCE (PSA_KEY_ID_USER_MIN + 2)
#define PSA_KEY_ID_SIGN  (PSA_KEY_ID_USER_MIN + 3)

/* Only support HMAC as MAC algorithm in COSE_Mac0 so far */
#define SYMMETRIC_IAK_MAX_SIZE PSA_MAC_MAX_SIZE

/* Hash algorithm for calculating Instance ID */
#define INSTANCE_ID_HASH_ALG PSA_ALG_SHA_256

/* Length of kid buffer */
#define KID_BUF_LEN 32

static uint8_t instance_id_buf[PSA_HASH_LENGTH(INSTANCE_ID_HASH_ALG) + 1];
static size_t instance_id_len = 0;
size_t out_msg_nonce_encrypted_size = 0;
uint8_t out_msg_nonce_encrypted[100];


void print(uint8_t *x, size_t y)
{
    for (size_t i = 0; i < y; i++)
    {
        printf("%c", *x);
        x++;
    }
    printf("\r\n");
}

static void dump_token(struct q_useful_buf_c *token)
{
    int i;
    unsigned char num;

    printf("\r\n");
    printf("########### token(len: %d): ###########\r\n", token->len);
    for (i = 0; i < token->len; ++i)
    {
        num = ((unsigned char *)token->ptr)[i];
        printf(" 0x%X%X", (num & 0xF0) >> 4, num & 0x0F);
        if (((i + 1) % 8) == 0)
        {
            printf("\r\n");
        }
    }
    printf("\r\n############## token end  ##############\r\n");
    printf("\r\n");
}

/**
 * \brief An example service implementation that prints out an argument from the
 *        client and then starts a timer.
 */
 void generate_key_nonce(struct tfm_crypto_pack_iovec* iov,
                     struct psa_invec invecs[], struct psa_outvec outvecs[]){

     psa_key_id_t user_key;
     struct psa_invec destroy_in[1];
     iov->key_id = PSA_KEY_ID_NONCE;
     iov->alg =  PSA_ALG_GCM;                       //PSA_ALG_IS_HASH_AND_SIGN(PSA_ALG_ANY_HASH);

     //initialize key attributes
     psa_key_attributes_t key_attributes = psa_key_attributes_init();

     psa_set_key_lifetime(&key_attributes, PSA_KEY_LIFETIME_PERSISTENT);
     psa_set_key_usage_flags(&key_attributes,(PSA_KEY_USAGE_ENCRYPT | PSA_KEY_USAGE_DECRYPT ));     //| PSA_KEY_USAGE_SIGN_MESSAGE | PSA_KEY_USAGE_VERIFY_MESSAGE | PSA_KEY_USAGE_SIGN_HASH | PSA_KEY_USAGE_VERIFY_HASH));
     psa_set_key_algorithm(&key_attributes, PSA_ALG_GCM);                                           //PSA_ALG_IS_HASH_AND_SIGN(PSA_ALG_ANY_HASH));
     psa_set_key_type(&key_attributes, PSA_KEY_TYPE_AES);                                          //PSA_KEY_TYPE_HMAC
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
 __attribute__ ((optimize("O0")))
static int_fast16_t check_simple_claims(
    const struct attest_token_iat_simple_t *simple_claims)
{
    int_fast16_t return_value;
    /* Use temp variables to make lines less than 80 columns below. */
    struct q_useful_buf_c tmp;
    struct q_useful_buf_c tail;
    /* Use a temporary string variable to make the static analyzer
     * happy. It doesn't like comparing a string literal to NULL
     */
    const char *tmp_string;

    return_value = 0;

    /* -- check value of the nonce claim -- */
    if (!IS_ITEM_FLAG_SET(NONCE_FLAG, simple_claims->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_NONCE)
        {
            /* It should have been present */
            return_value = -50;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp.ptr = out_msg_nonce_encrypted;
        tmp.len = out_msg_nonce_encrypted_size;
        if (!q_useful_buf_c_is_null(tmp))
        {
           /* request to check for the nonce */
           if (q_useful_buf_compare(simple_claims->nonce, tmp))
           {
               /* Didn't match in the standard way. See if it is a
                * special option-packed nonce by checking for length
                * 64 and all bytes except the first four are 0.
                * nonce_tail is everything after the first 4 bytes.
                */
               tail = q_useful_buf_tail(simple_claims->nonce, 4);
               if (simple_claims->nonce.len == 64 &&
                   q_useful_buf_is_value(tail, 0) == SIZE_MAX)
               {
                   /* It is an option-packed nonce.
                    * Don't compare the first four bytes.
                    */
                   if (q_useful_buf_compare(q_useful_buf_tail(tmp, 4), tail))
                   {
                       /* The option-packed nonce didn't match */
                       return_value = -51;
                       goto Done;
                   }
               }
               else
               {
                   /* Just a normal nonce that didn't match */
                   return_value = -51;
                   goto Done;
               }
           }
        }
    }

    /* -- check value of the instance ID claim -- */
    if (!IS_ITEM_FLAG_SET(INSTANCE_ID_FLAG, simple_claims->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_INSTANCE_ID)
        {
            /* It should have been present */
            return_value = -52;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_INSTANCE_ID;
        if (!q_useful_buf_c_is_null(tmp) &&
            q_useful_buf_compare(simple_claims->instance_id, tmp))
        {
            /* Check of its value was requested and failed */
            return_value = -53;
            goto Done;
        }
    }

    /* -- check value of the boot seed claim -- */
    if (!IS_ITEM_FLAG_SET(BOOT_SEED_FLAG, simple_claims->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_BOOT_SEED)
        {
            /* It should have been present */
            return_value = -54;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_BOOT_SEED;
        if (!q_useful_buf_c_is_null(tmp) &&
            q_useful_buf_compare(simple_claims->boot_seed, tmp))
        {
            /* Check of its value was requested and failed */
            return_value = -55;
            goto Done;
        }
    }

    /* -- check value of the cert_ref claim -- */
    if (!IS_ITEM_FLAG_SET(CERT_REF_FLAG, simple_claims->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_CERT_REF)
        {
            /* It should have been present */
            return_value = -56;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_CERT_REF;
        if (tmp_string != NULL)
        {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(TOKEN_TEST_VALUE_CERT_REF);
            if (q_useful_buf_compare(simple_claims->cert_ref, tmp))
            {
                /* Check of its value was requested and failed */
                return_value = -57;
                goto Done;
            }
        }
    }

    /* -- check value of the implementation ID -- */
    if (!IS_ITEM_FLAG_SET(IMPLEMENTATION_ID_FLAG, simple_claims->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_IMPLEMENTATION_ID)
        {
            return_value = -58;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_IMPLEMENTATION_ID;
        if (!q_useful_buf_c_is_null(tmp) &&
            q_useful_buf_compare(simple_claims->implementation_id, tmp))
        {
            /* Check of its value was requested and failed */
            return_value = -59;
            goto Done;
        }
    }

    /* -- check value of the security lifecycle claim -- */
    if (!IS_ITEM_FLAG_SET(SECURITY_LIFECYCLE_FLAG, simple_claims->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_SECURITY_LIFECYCLE)
        {
            /* It should have been present */
            return_value = -60;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        if (TOKEN_TEST_VALUE_SECURITY_LIFECYCLE != INT32_MAX &&
            simple_claims->security_lifecycle !=
                TOKEN_TEST_VALUE_SECURITY_LIFECYCLE)
        {
            /* Check of its value was requested and failed */
            return_value = -61;
            goto Done;
        }
    }

    /* -- check value of the client_id claim -- */
    if (!IS_ITEM_FLAG_SET(CLIENT_ID_FLAG, simple_claims->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_CLIENT_ID)
        {
            return_value = -62;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        if (TOKEN_TEST_VALUE_CLIENT_ID != INT32_MAX &&
            simple_claims->client_id != TOKEN_TEST_VALUE_CLIENT_ID)
        {
#if DOMAIN_NS == 1U
            /* Non-secure caller client ID has to be negative */
            if (simple_claims->client_id > -1)
            {
#else
            /* Secure caller client ID has to be positive */
            if (simple_claims->client_id < 1)
            {
#endif
                return_value = -63;
                goto Done;
            }
        }
    }

    /* -- check value of the profile_definition claim -- */
    if (!IS_ITEM_FLAG_SET(PROFILE_DEFINITION_FLAG, simple_claims->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_PROFILE_DEFINITION)
        {
            /* It should have been present */
            return_value = -64;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_PROFILE_DEFINITION;
        if (tmp_string != NULL)
        {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(
                TOKEN_TEST_VALUE_PROFILE_DEFINITION);
            if (q_useful_buf_compare(simple_claims->profile_definition, tmp))
            {
                /* Check of its value was requested and failed */
                return_value = -65;
                goto Done;
            }
        }
    }

    /* -- check value of the verification_service claim -- */
    if (!IS_ITEM_FLAG_SET(VERIFICATION_SERVICE_FLAG, simple_claims->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_VERIFICATION_SERVICE)
        {
            /* It should have been present */
            return_value = -66;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_VERIFICATION_SERVICE;
        if (tmp_string != NULL)
        {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(TOKEN_TEST_VALUE_VERIFICATION_SERVICE);
            if (q_useful_buf_compare(simple_claims->verif_serv, tmp))
            {
                /* Check of its value was requested and failed */
                return_value = -67;
                goto Done;
            }
        }
    }

Done:
    return return_value;
}
__attribute__ ((optimize("O0")))
static int_fast16_t check_sw_component_1(
    const struct attest_token_sw_component_t *sw_component)
{
    int_fast16_t return_value;
    /* Use a temp variable to make lines less than 80 columns below. */
    struct q_useful_buf_c tmp;
    /* Use a temporary string variable to make the static analyzer
     * happy. It doesn't like comparing a string literal to NULL
     */
    const char *tmp_string;

    return_value = 0;

    /* -- Check first type -- */
    if (!IS_ITEM_FLAG_SET(SW_MEASUREMENT_TYPE_FLAG, sw_component->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_SWC1_MEASUREMENT_TYPE)
        {
            /* It should have been present */
            return_value = -100;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_SWC1_MEASUREMENT_TYPE;
        if (tmp_string != NULL)
        {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(
                TOKEN_TEST_VALUE_SWC1_MEASUREMENT_TYPE);
            if (q_useful_buf_compare(sw_component->measurement_type, tmp))
            {
                /* Check of its value was requested and failed */
                return_value = -101;
                goto Done;
            }
        }
    }

    /* -- Check first measurement -- */
    if (!IS_ITEM_FLAG_SET(SW_MEASURMENT_VAL_FLAG, sw_component->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_SWC1_MEASUREMENT_VAL)
        {
            /* It should have been present */
            return_value = -102;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_SWC1_MEASUREMENT_VAL;
        if (!q_useful_buf_c_is_null(tmp) &&
            q_useful_buf_compare(sw_component->measurement_val, tmp))
        {
            /* Check of its value was requested and failed */
            return_value = -103;
            goto Done;
        }
    }

    /* -- Check first version -- */
    if (!IS_ITEM_FLAG_SET(SW_VERSION_FLAG, sw_component->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_SWC1_VERSION)
        {
            /* It should have been present */
            return_value = -106;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_SWC1_VERSION;
        if (tmp_string != NULL)
        {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(TOKEN_TEST_VALUE_SWC1_VERSION);
            if (q_useful_buf_compare(sw_component->version, tmp))
            {
                /* Check of its value was requested and failed */
                return_value = -107;
                goto Done;
            }
        }
    }

    /* -- Check first signer ID -- */
    if (!IS_ITEM_FLAG_SET(SW_SIGNER_ID_FLAG, sw_component->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_SWC1_SIGNER_ID)
        {
            /* It should have been present */
            return_value = -108;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_SWC1_SIGNER_ID;
        if (!q_useful_buf_c_is_null(tmp) &&
            q_useful_buf_compare(sw_component->signer_id, tmp))
        {
            /* Check of its value was requested and failed */
            return_value = -109;
            goto Done;
        }
    }

    /* -- Check first measurement description -- */
    if (!IS_ITEM_FLAG_SET(SW_MEASUREMENT_DESC_FLAG, sw_component->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_SWC1_MEASUREMENT_DESC)
        {
            /* It should have been present */
            return_value = -110;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_SWC1_MEASUREMENT_DESC;
        if (tmp_string != NULL)
        {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(
                TOKEN_TEST_VALUE_SWC1_MEASUREMENT_DESC);
            if (q_useful_buf_compare(sw_component->measurement_desc, tmp))
            {
                /* Check of its value was requested and failed */
                return_value = -111;
                goto Done;
            }
        }
    }

Done:
    return return_value;
}
__attribute__ ((optimize("O0")))
static int_fast16_t check_sw_component_2(
    const struct attest_token_sw_component_t *sw_component)
{
    int_fast16_t return_value;

    /* Use a temp variable to make lines less than 80 columns below. */
    struct q_useful_buf_c tmp;
    /* Use a temporary string variable to make the static analyzer
     * happy. It doesn't like comparing a string literal to NULL
     */
    const char *tmp_string;

    return_value = 0;

    /* -- Check second type -- */
    if (!IS_ITEM_FLAG_SET(SW_MEASUREMENT_TYPE_FLAG, sw_component->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_SWC2_MEASUREMENT_TYPE)
        {
            /* It should have been present */
            return_value = -100;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_SWC2_MEASUREMENT_TYPE;
        if (tmp_string != NULL)
        {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(
                TOKEN_TEST_VALUE_SWC2_MEASUREMENT_TYPE);
            if (q_useful_buf_compare(sw_component->measurement_type, tmp))
            {
                /* Check of its value was requested and failed */
                return_value = -101;
                goto Done;
            }
        }
    }

    /* -- Check second measurement -- */
    if (!IS_ITEM_FLAG_SET(SW_MEASURMENT_VAL_FLAG, sw_component->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_SWC2_MEASUREMENT_VAL)
        {
            /* It should have been present */
            return_value = -102;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_SWC2_MEASUREMENT_VAL;
        if (!q_useful_buf_c_is_null(tmp) &&
            q_useful_buf_compare(sw_component->measurement_val, tmp))
        {
            /* Check of its value was requested and failed */
            return_value = -103;
            goto Done;
        }
    }

    /* -- Check second version -- */
    if (!IS_ITEM_FLAG_SET(SW_VERSION_FLAG, sw_component->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_SWC2_VERSION)
        {
            /* It should have been present */
            return_value = -106;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_SWC2_VERSION;
        if (tmp_string != NULL)
        {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(TOKEN_TEST_VALUE_SWC2_VERSION);
            if (q_useful_buf_compare(sw_component->version, tmp))
            {
                /* Check of its value was requested and failed */
                return_value = -107;
                goto Done;
            }
        }
    }

    /* -- Check second signer ID -- */
    if (!IS_ITEM_FLAG_SET(SW_SIGNER_ID_FLAG, sw_component->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_SWC2_SIGNER_ID)
        {
            /* It should have been present */
            return_value = -108;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp = TOKEN_TEST_VALUE_SWC2_SIGNER_ID;
        if (!q_useful_buf_c_is_null(tmp) &&
            q_useful_buf_compare(sw_component->signer_id, tmp))
        {
            /* Check of its value was requested and failed */
            return_value = -109;
            goto Done;
        }
    }

    /* -- Check second measurement description -- */
    if (!IS_ITEM_FLAG_SET(SW_MEASUREMENT_DESC_FLAG, sw_component->item_flags))
    {
        /* Claim is not present in token */
        if (TOKEN_TEST_REQUIRE_SWC2_MEASUREMENT_DESC)
        {
            /* It should have been present */
            return_value = -110;
            goto Done;
        }
    }
    else
    {
        /* Claim is present */
        /* Don't have to check if its presence is required */
        tmp_string = TOKEN_TEST_VALUE_SWC2_MEASUREMENT_DESC;
        if (tmp_string != NULL)
        {
            tmp = Q_USEFUL_BUF_FROM_SZ_LITERAL(
                TOKEN_TEST_VALUE_SWC2_MEASUREMENT_DESC);
            if (q_useful_buf_compare(sw_component->measurement_desc, tmp))
            {
                /* Check of its value was requested and failed */
                return_value = -111;
                goto Done;
            }
        }
    }

Done:
    return return_value;
}

void ta_attestation(uint32_t option_flags,
                    struct q_useful_buf_c nonce,
                    struct q_useful_buf buffer,
                    struct q_useful_buf_c *completed_token)
{
    psa_status_t status;
    size_t token_buf_size;
    size_t completed_token_size;
    struct q_useful_buf_c actual_nonce;
    Q_USEFUL_BUF_MAKE_STACK_UB(actual_nonce_storage, 64);

    if (nonce.len == 64 && (q_useful_buf_is_value(nonce, 0) == SIZE_MAX))
    {
        /* Go into special option-packed nonce mode */
        actual_nonce = q_useful_buf_copy(actual_nonce_storage, nonce);
        /* Use memcpy as it always works and avoids type punning */
        memcpy((uint8_t *)actual_nonce_storage.ptr,
               &option_flags,
               sizeof(uint32_t));
    }
    else
    {
        actual_nonce = nonce;
    }

    status = psa_initial_attest_get_token(nonce.ptr,
                                          PSA_INITIAL_ATTEST_CHALLENGE_SIZE_64,
                                          buffer.ptr,
                                          ATTEST_TOKEN_MAX_SIZE,
                                          &completed_token_size);

    *completed_token =
        (struct q_useful_buf_c){buffer.ptr, completed_token_size};

    printif(status);
}

/**
 * \brief An example service implementation that prints out an argument from the
 *        client and then starts a timer.
 */
psa_status_t tfm_ta_attestation_service_sfn(const psa_msg_t *msg)
{
    void *ptr;
    size_t token_size, nonce_size;
    struct q_useful_buf token_buf;
    uint8_t nonce[PSA_INITIAL_ATTEST_CHALLENGE_SIZE_64];
    psa_status_t status;
    struct psa_invec invec[2];
    struct psa_invec invec_nonce_encrypted[1];
    struct psa_outvec outvec[1];
    struct psa_outvec outvecs_nonce[1];
    struct psa_outvec outvecs_nonce_encrypted[1];
    struct psa_outvec outvecs_token_encrypted[1];

    struct psa_aead_operation_s operation_ctx;
    struct tfm_crypto_pack_iovec iov;

    int_fast16_t ret;
    struct q_useful_buf_c tmp;
    struct q_useful_buf_c tmp_nonce;
    struct q_useful_buf_c nonce_enc;
    struct q_useful_buf_c tmp_token;
    struct q_useful_buf_c completed_token;
    struct q_useful_buf_c token_encrypted;
    Q_USEFUL_BUF_MAKE_STACK_UB(token_storage, ATTEST_TOKEN_MAX_SIZE);
    struct attest_token_decode_context token_decode;
    uint32_t token_encode_options;
    uint32_t token_decode_options;
    struct attest_token_iat_simple_t simple_claims;

    struct attest_token_sw_component_t sw_component;
    uint32_t num_sw_components;
    int32_t num_sw_components_signed;

    /* Leave the first byte for UEID type byte */
    uint8_t *id_ptr = instance_id_buf + 1;
    size_t id_len = sizeof(instance_id_buf) - 1;
    uint8_t iak_buf[SYMMETRIC_IAK_MAX_SIZE];
    size_t iak_len;

    size_t out_msg_nonce_size = 0;
    uint8_t out_msg_nonce[100];





    size_t out_msg_token_size = 0;
    uint8_t out_msg_token[592];

    switch (msg->type)
    {
    case PSA_TA_ATTESTATION_CREATE_NONCE_CALL:

        LOG_INFFMT("[DBG][TA ATTESTATION] SFN OPERATION 1\r\n");
        generate_key_nonce(&iov, invec, outvec);
        LOG_INFFMT("[DBG][TA ATTESTATION] GENERATE KEY DONE\r\n");

        /* --- */

        tmp             = TOKEN_TEST_VALUE_NONCE;
        nonce_size      = PSA_AEAD_NONCE_MAX_SIZE;
        operation_ctx   = psa_aead_operation_init();
        
        iov.function_id = TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID;
        iov.op_handle   = operation_ctx.handle;

        invec[0].base   = &iov;
        invec[0].len    = sizeof(struct tfm_crypto_pack_iovec);
        outvec[0].base  = &(operation_ctx.handle);
        outvec[0].len   = sizeof(uint32_t);
    
        status = psa_call(0x40000100U, PSA_IPC_CALL, invec, 1, outvec, 1);
        printif(status);
        LOG_INFFMT("[DBG][TA ATTESTATION] ENCRYPT SETUP DONE\r\n");

        /* --- */

        iov.function_id = TFM_CRYPTO_AEAD_GENERATE_NONCE_SID;
        iov.op_handle   = operation_ctx.handle;
        invec[0].base   = &iov;
        invec[0].len    = sizeof(struct tfm_crypto_pack_iovec);
        outvec[0].base  = tmp.ptr;
        outvec[0].len   = tmp.len;

        status = psa_call(0x40000100U, PSA_IPC_CALL, invec, 1, outvec, 1);

        printif(status);
        LOG_INFFMT("[DBG][TA ATTESTATION] NONCE CREATED\r\n");

        //encriptar aqui

        //invec_nonce_encrypted[0].base = tmp.ptr;
        //invec_nonce_encrypted[0].len = tmp.len;

        //outvecs_nonce_encrypted[0].base = nonce_enc.ptr;
        //outvecs_nonce_encrypted[0].len = tmp.len;

        //psa_call(0x40000101U, PSA_CRYPTO_GENERATE_KEY_CALL, NULL, 0, NULL, 0);
        //printf("GENERATE KEY TO ENCRYPT DONE\r\n");

        //printf("encrypt2\r\n");
        //psa_call(0x40000101U, PSA_CRYPTO_ENCRYPTION_CALL, invec_nonce_encrypted, 1, outvecs_nonce_encrypted, 1);
        //printf("encrypt done2\r\n");

        //psa_write(msg->handle, 0, outvecs_nonce_encrypted[0].base, outvecs_nonce_encrypted[0].len);
        psa_write(msg->handle, 0, tmp.ptr, tmp.len);

        return PSA_SUCCESS;

    case PSA_TA_ATTESTATION_CREATE_TOKEN_CALL:

        out_msg_nonce_size= msg->in_size[0];

        psa_read(msg->handle, 0, &out_msg_nonce, out_msg_nonce_size);



        //invec_nonce_encrypted[0].base = &out_msg_nonce;
        //invec_nonce_encrypted[0].len = out_msg_nonce_size;

        //outvecs_nonce[0].base = tmp_nonce.ptr;
        //outvecs_nonce[0].len = out_msg_nonce_size;

        //printf("decrypt2\r\n");
        //psa_call(0x40000101U, PSA_CRYPTO_DECRYPTION_CALL, invec_nonce_encrypted, 1, outvecs_nonce, 1);
        //printf("decrypt2 done\r\n");

        //tmp_nonce.ptr = outvecs_nonce[0].base;
        //tmp_nonce.len = outvecs_nonce[0].len;

        /* --- */
        token_encode_options = 0;

        tmp_nonce.ptr = &out_msg_nonce;
        tmp_nonce.len = out_msg_nonce_size;
        

        // ta_attestation(TOKEN_OPT_SHORT_CIRCUIT_SIGN | TOKEN_OPT_OMIT_CLAIMS, tmp, token_storage, &completed_token);
        // dump_token(&completed_token);
        // LOG_INFFMT("[DBG][TA ATTESTATION] TOKEN CREATED\r\n");
        status = token_main_alt(token_encode_options,
                                tmp_nonce,
                                token_storage,
                                &completed_token);
        printif(status);
        dump_token(&completed_token);
        LOG_INFFMT("[DBG][TA ATTESTATION] TOKEN CREATED\r\n");

        //invec[0].base = completed_token.ptr;
        //invec[0].len = completed_token.len;

        //outvecs_token_encrypted[0].base = token_encrypted.ptr;
        //outvecs_token_encrypted[0].len = token_encrypted.len;

        //printf("encrypt3\r\n");
        //psa_call(0x40000101U, PSA_CRYPTO_ENCRYPTION_CALL, invec, 1, outvecs_token_encrypted, 1);
        //printf("encrypt done3\r\n");

        //psa_write(msg->handle, 0, token_encrypted.ptr, token_encrypted.len);
        psa_write(msg->handle, 0, completed_token.ptr, completed_token.len);

        return PSA_SUCCESS;

    case PSA_TA_ATTESTATION_VERIFICATION_CALL:

        out_msg_token_size= msg->in_size[0];
        psa_read(msg->handle, 0, &out_msg_token, out_msg_token_size);
        out_msg_nonce_encrypted_size= msg->in_size[1];
        psa_read(msg->handle, 1, &out_msg_nonce_encrypted, out_msg_nonce_encrypted_size);

        /* --- */
        LOG_INFFMT("[DBG][TA ATTESTATION] VALIDATION\r\n");
        token_decode_options = 0;
        tmp_token.ptr = &out_msg_token;
        tmp_token.len = out_msg_token_size;

        //dump_token(&out_msg_token);

        attest_token_decode_init(&token_decode, token_decode_options);
        status = attest_token_decode_validate_token(&token_decode, tmp_token);
        printif(status);

        /* --- */

        status = attest_token_decode_get_iat_simple(&token_decode, &simple_claims);
        printif(status);

        status = check_simple_claims(&simple_claims);
        if (status != ATTEST_TOKEN_ERR_SUCCESS)
        {
            printif(status);
        }

        /* -- SW components -- */
        if (TOKEN_TEST_REQUIRED_NUM_SWC != INT32_MAX)
        {
            /* -- Configured to check for SW components, so do that -- */

            /* -- Get num SW components -- */
            status = attest_token_get_num_sw_components(&token_decode,
                                                        &num_sw_components);
            if (status)
            {
                printif(status);
            }
            /* This conversion to signed avoids a compiler warning
             * when TOKEN_TEST_REQUIRED_NUM_SWC is defined as 0 */
            num_sw_components_signed = (int32_t)num_sw_components;
            if (num_sw_components_signed < TOKEN_TEST_REQUIRED_NUM_SWC)
            {
                status = -5;
                printif(status);
            }

            if (num_sw_components >= 1)
            {
                /* -- Get the first SW component and check it -- */
                status = attest_token_get_sw_component(&token_decode,
                                                       0,
                                                       &sw_component);
                if (status)
                {
                    printif(status);
                }

                status = check_sw_component_1(&sw_component);
                if (status)
                {
                    printif(status);
                }

                if (num_sw_components >= 2)
                {
                    /* -- Get the second SW component and check it -- */
                    status = attest_token_get_sw_component(&token_decode,
                                                           1,
                                                           &sw_component);
                    if (status)
                    {
                        printif(status);
                    }

                    status = check_sw_component_2(&sw_component);
                    if (status)
                    {
                        printif(status);
                    }
                }
            }
        }

        /* --- */

        LOG_INFFMT("[DBG][TA ATTESTATION] VERIFICATION SUCCESS\r\n");

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
