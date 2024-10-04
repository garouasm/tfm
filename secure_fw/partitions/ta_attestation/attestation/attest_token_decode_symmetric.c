/*
 * attest_symmetric_iat_decode.c
 *
 * Copyright (c) 2019, Laurence Lundblade.
 * Copyright (c) 2020-2022, Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 * See BSD-3-Clause license in README.md
 */

#include "attest_token_decode.h"
#include "attest.h"
#include "psa/crypto.h"
#include "q_useful_buf.h"
#include "qcbor_util.h"
#include "t_cose_common.h"
#include "t_cose_mac0_verify.h"
#include "tfm_crypto_defs.h"
#include "psa/client.h"
#include "tfm_sp_log.h"

/* Only support HMAC as MAC algorithm in COSE_Mac0 so far */
#define SYMMETRIC_IAK_MAX_SIZE        PSA_MAC_MAX_SIZE

#define PSA_KEY_ID_NONCE              (PSA_KEY_ID_USER_MIN+13)
#define PSA_KEY_ID_SIGN  (PSA_KEY_ID_USER_MIN + 3)

void generate_key3(struct tfm_crypto_pack_iovec* iov, 
                    struct psa_invec invecs[], struct psa_outvec outvecs[]){
    
    psa_key_id_t user_key;
    struct psa_invec destroy_in[1];
    iov->key_id = PSA_KEY_ID_SIGN;
    iov->alg = PSA_ALG_SHA_256;

    //initialize key attributes
    psa_key_attributes_t key_attributes = psa_key_attributes_init();

    psa_set_key_lifetime(&key_attributes, PSA_KEY_LIFETIME_PERSISTENT);
    psa_set_key_usage_flags(&key_attributes, PSA_KEY_USAGE_VERIFY_MESSAGE);//(PSA_KEY_USAGE_SIGN_MESSAGE | PSA_KEY_USAGE_VERIFY_MESSAGE | PSA_KEY_USAGE_SIGN_HASH | PSA_KEY_USAGE_VERIFY_HASH));
    psa_set_key_algorithm(&key_attributes, T_COSE_ALGORITHM_HMAC256);
    psa_set_key_type(&key_attributes, PSA_KEY_TYPE_CATEGORY_SYMMETRIC);
    psa_set_key_bits(&key_attributes, 256);
    psa_set_key_id(&key_attributes, PSA_KEY_ID_SIGN);

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

#if DOMAIN_NS == 1U
/*
 * Public function. See attest_token_decode.h
 * It is not allowed to let NS side fetch the symmetric IAK and perform the MAC
 * verification.
 */
enum attest_token_err_t
attest_token_decode_validate_token(struct attest_token_decode_context *me,
                                   struct q_useful_buf_c               token)
{
    enum t_cose_err_t              t_cose_error;
    enum attest_token_err_t        return_value;
    /* Decode only without signature verification */
    int32_t                        t_cose_options = T_COSE_OPT_DECODE_ONLY;
    struct t_cose_mac0_verify_ctx  verify_ctx;
    struct t_cose_key              attest_key = T_COSE_NULL_KEY;

    t_cose_mac0_verify_init(&verify_ctx, t_cose_options);

    t_cose_mac0_set_verify_key(&verify_ctx, attest_key);

    t_cose_error = t_cose_mac0_verify(&verify_ctx,
                                      token, /* COSE to verify */
                                      &me->payload, /* Payload from token */
                                      NULL
                                     );

    return_value = map_t_cose_errors(t_cose_error);
    me->last_error = return_value;

    return return_value;
}

#else /* DOMAIN_NS == 1U */

/*
 * Public function. See attest_token_decode.h
 * Decode the received COSE_Mac0 structure and verify the tag. Authentication
 * tag verification in tests is for debug purpose only. The symmetric Initial
 * Attestation key (IAK) should not be able to be used by anything other than
 * the Attestation partition in real products.
 */
enum attest_token_err_t
attest_token_decode_validate_token(struct attest_token_decode_context *me,
                                   struct q_useful_buf_c               token)
{
    enum t_cose_err_t              t_cose_error;
    enum attest_token_err_t        return_value;
    int32_t                        t_cose_options = 0;
    struct t_cose_mac0_verify_ctx  verify_ctx;
    struct t_cose_key              attest_key;
    psa_key_handle_t               key_handle = TFM_BUILTIN_KEY_ID_IAK;

    struct psa_invec                        invec[2];
    struct psa_outvec                       outvec[1];
    struct tfm_crypto_pack_iovec            iov;

    struct q_useful_buf cose_pub_key;


    //LOG_INFFMT("[DBG][TA ATTESTATION] SFN OPERATION 1\r\n");
    generate_key3(&iov, invec, outvec);

    // cose_pub_key.ptr = outvec[0].base;
    // cose_pub_key.len = outvec[0].len;
    // t_cose_error = attest_token_decode_set_cose_pub_key(me,cose_pub_key );
    //LOG_INFFMT("[DBG][TA ATTESTATION] GENERATE KEY DONE\r\n");

    if (me->options & TOKEN_OPT_SHORT_CIRCUIT_SIGN) {
        t_cose_options |= T_COSE_OPT_ALLOW_SHORT_CIRCUIT;
    }

    t_cose_mac0_verify_init(&verify_ctx, t_cose_options);

    attest_key.crypto_lib = T_COSE_CRYPTO_LIB_PSA;
    attest_key.k.key_handle = (uint64_t)key_handle;
    t_cose_mac0_set_verify_key(&verify_ctx, attest_key);

    t_cose_error = t_cose_mac0_verify(&verify_ctx,
                                      token, /* COSE to verify */
                                      &me->payload, /* Payload from token */
                                      NULL);

    return_value = map_t_cose_errors(t_cose_error);
    me->last_error = return_value;

    return return_value;
}
#endif /* DOMAIN_NS == 1U */
