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
#include "psa_manifest/tfm_example_partition.h"
#include "tfm_plat_test.h"
#include "tfm_sp_log.h"
#include "tfm_its_defs.h"

#define PSA_KEY_ID_USER_1 ((psa_key_id_t)0x1)
#define PSA_KEY_ID_USER_2 ((psa_key_id_t)0x22222222)
#define IV_SIZE 16

void generate_key(struct tfm_crypto_pack_iovec* iov, 
                    struct psa_invec invecs[], struct psa_outvec outvecs[]){
    
    psa_key_id_t user_key;
    struct psa_invec destroy_in[1];
    iov->key_id = PSA_KEY_ID_USER_1;
    iov->alg = PSA_ALG_CFB;

    //initialize key attributes
    psa_key_attributes_t key_attributes = psa_key_attributes_init();

    psa_set_key_lifetime(&key_attributes, PSA_KEY_LIFETIME_PERSISTENT);
    psa_set_key_usage_flags(&key_attributes,(PSA_KEY_USAGE_ENCRYPT | PSA_KEY_USAGE_DECRYPT));
    psa_set_key_algorithm(&key_attributes,PSA_ALG_CFB);
    psa_set_key_type(&key_attributes, PSA_KEY_TYPE_AES);
    psa_set_key_bits(&key_attributes, 256);
    psa_set_key_id(&key_attributes, PSA_KEY_ID_USER_1);

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
void encrypt(struct tfm_crypto_pack_iovec* iov, uint8_t hello_msg[], struct psa_invec invecs[], 
                struct psa_outvec outvecs[], uint8_t cipher_msg[],
                    size_t out_msg_size, uint8_t iv[IV_SIZE]){
    
    psa_cipher_operation_t op_handle = PSA_CIPHER_OPERATION_INIT;
    
    uint8_t out_finish;
    
    invecs[0].base = iov;
    invecs[0].len = sizeof(struct tfm_crypto_pack_iovec);

    //a call to cipher encrypt setup 
    iov->function_id = TFM_CRYPTO_CIPHER_ENCRYPT_SETUP_SID; 
    iov->op_handle = op_handle.handle;
    outvecs[0].base = &op_handle;
    outvecs[0].len = sizeof(uint32_t);
    psa_call(0x40000100U, PSA_IPC_CALL, invecs, 1, outvecs, 1);

    //a call to generate Initialization vector(IV)
    iov->function_id = TFM_CRYPTO_CIPHER_GENERATE_IV_SID;
    iov->op_handle = op_handle.handle;
    outvecs[0].base = iv;
    outvecs[0].len = IV_SIZE;
    psa_call(0x40000100U, PSA_IPC_CALL, invecs, 1, outvecs, 1);

    //a call to encrypt x blocks
    iov->function_id = TFM_CRYPTO_CIPHER_UPDATE_SID;
    invecs[1].base = hello_msg;
    invecs[1].len = out_msg_size;
    outvecs[0].base = cipher_msg;
    outvecs[0].len = out_msg_size;
    psa_call(0x40000100U, PSA_IPC_CALL, invecs, 2, outvecs, 1);
    
    //finish cipher
    //iov->function_id = TFM_CRYPTO_CIPHER_FINISH_SID;
    //outvecs[0].base = NULL;
    //outvecs[1].base = &out_finish;
    //outvecs[1].len = sizeof(out_finish);
    //psa_call(0x40000100U, PSA_IPC_CALL, invecs, 1, outvecs, 2);     
}

__attribute__ ((optimize("O0")))
void decrypt(struct tfm_crypto_pack_iovec* iov, struct psa_invec invecs[], 
                struct psa_outvec outvecs[], uint8_t cipher_msg[], uint8_t iv[IV_SIZE],
                    uint8_t original_hello_msg[], size_t out_msg_size){

    //initialize decrypt cipher structures
    psa_cipher_operation_t op_handle = PSA_CIPHER_OPERATION_INIT;
    
    invecs[0].base = iov;
    invecs[0].len = sizeof(struct tfm_crypto_pack_iovec);

    //a call to cipher decrypt setup 
    iov->function_id = TFM_CRYPTO_CIPHER_DECRYPT_SETUP_SID; 
    iov->op_handle = op_handle.handle;
    outvecs[0].base = &op_handle;
    outvecs[0].len = sizeof(uint32_t);
    psa_call(0x40000100U, PSA_IPC_CALL, invecs, 1, outvecs, 1);
        
    //a call to set Initialization vector(IV) 
    iov->function_id = TFM_CRYPTO_CIPHER_SET_IV_SID;
    iov->op_handle = op_handle.handle;
    invecs[1].base = iv;
    invecs[1].len = IV_SIZE;
    psa_call(0x40000100U, PSA_IPC_CALL, invecs, 2, NULL, 0);

    // //a call to decrypt x blocks
    iov->function_id = TFM_CRYPTO_CIPHER_UPDATE_SID;
    invecs[1].base = cipher_msg;
    invecs[1].len = out_msg_size;
    outvecs[0].base = original_hello_msg;
    outvecs[0].len = out_msg_size;
    psa_call(0x40000100U, PSA_IPC_CALL, invecs, 2, outvecs, 1);
}

void store(uint8_t msg[], size_t msg_size, psa_storage_uid_t encrypted_data_uid){
    psa_storage_create_flags_t create_flags = PSA_STORAGE_FLAG_NONE;
    psa_its_set(encrypted_data_uid, msg_size, msg, create_flags);
}

void load(uint8_t msg[], size_t msg_size, psa_storage_uid_t encrypted_data_uid, size_t *pdata_size){
    psa_its_get(encrypted_data_uid, 0, msg_size, msg, &pdata_size);
}

/**
 * \brief An example service implementation that prints out an argument from the
 *        client and then starts a timer.
 */
psa_status_t tfm_example_service_sfn(const psa_msg_t *msg)
{ 
    size_t out_msg_size = msg->in_size[0];
    uint8_t hello_msg[out_msg_size];
    psa_read(msg->handle, 0, &hello_msg, out_msg_size);
    size_t out_len = PSA_MAX_IOVEC, i;
    struct psa_outvec ns_out[3];
    struct tfm_crypto_pack_iovec iov;
    uint8_t iv[IV_SIZE];

    uint8_t cipher_msg[out_msg_size];
    uint8_t stored_msg[out_msg_size];
    uint8_t original_hello_msg[out_msg_size];

    //initialize generate key call structures
    struct psa_invec invecs[2];
    struct psa_outvec outvecs[2];

    psa_storage_uid_t encrypted_data_uid = 2;
    size_t *pdata_size = NULL;
    

    generate_key(&iov, invecs, outvecs);
    
    switch (msg->type) {
    case PSA_IPC_CALL:

        encrypt(&iov, hello_msg, invecs, outvecs, cipher_msg, out_msg_size, iv);

        store(cipher_msg, out_msg_size, encrypted_data_uid);
        load(stored_msg, out_msg_size, encrypted_data_uid, pdata_size);

        out_msg_size = PSA_CIPHER_UPDATE_OUTPUT_SIZE(PSA_KEY_TYPE_AES, PSA_ALG_CFB, sizeof(stored_msg));
        decrypt(&iov, invecs, outvecs, stored_msg, iv, original_hello_msg, out_msg_size);

        //send to the ns client the message outputs
        ns_out[0].base = &hello_msg;
        ns_out[0].len = sizeof(hello_msg);

        ns_out[1].base = &stored_msg;
        ns_out[1].len = sizeof(stored_msg);

        ns_out[2].base = &original_hello_msg;
        ns_out[2].len = sizeof(original_hello_msg);

        /* Check the number of out_vec filled */
        //while ((out_len > 0) && (msg->out_size[out_len - 1] == 0)) {
        //    out_len--;
        //}
        for (i = 0; i < 3; i++)
        {
            ns_out[i].len = sizeof(hello_msg);
            psa_write(msg->handle, i, ns_out[i].base, ns_out[i].len);
        }
        /*
        iov.function_id = TFM_CRYPTO_CIPHER_FINISH_SID;
        psa_call(0x40000100U,PSA_IPC_CALL,in_msg, 1, out_msg, 2);*/
        
        //destroy key
        iov.function_id = TFM_CRYPTO_DESTROY_KEY_SID;
        psa_call(0x40000100U, PSA_IPC_CALL, invecs, 1, NULL, 0);

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
