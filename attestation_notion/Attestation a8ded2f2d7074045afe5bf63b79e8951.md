# Attestation

TA tfm_ta_attestation:

```c
#define PSA_TA_ATTESTATION_CREATE_NONCE_CALL    (1)
#define PSA_TA_ATTESTATION_CREATE_TOKEN_CALL    (2)
#define PSA_TA_ATTESTATION_VERIFICATION_CALL    (3)
```

These are the essential services required to perform authentication. The first one is used for generating a nonce, the second one for creating the token, and the third one for verifying the token.

PSA_TA_ATTESTATION_CREATE_NONCE_CALL:
* function generate_key_nonce: Function to generate nonce
* TFM_CRYPTO_AEAD_ENCRYPT_SETUP_SID
* TFM_CRYPTO_AEAD_GENERATE_NONCE_SID

PSA_TA_ATTESTATION_CREATE_TOKEN_CALL:
* function token_main_alt: n alternate token_main() that packs the option flags into the nonce.

PSA_TA_ATTESTATION_VERIFICATION_CALL:
* function attest_token_decode_init: Initialize token decoder
* function attest_token_decode_validate_token: Attestation token decoder for COSE_Sign1.
* function attest_token_decode_get_iat_simple: Batch fetch of all simple data items in a token.
* function check_simple_claims: Check the simple IAT claims against compiled-in known values
* function check_sw_component: Check a SW component claims against compiled-in known values.

TA tfm_example_partition:

```c
#define PSA_CRYPTO_GENERATE_KEY_CALL            (1)
#define PSA_CRYPTO_ENCRYPTION_CALL              (2)
#define PSA_CRYPTO_DECRYPTION_CALL              (3)
#define PSA_CRYPTO_STORAGE_CALL                 (4)
```

Test code:

```c
psa_call(0x40000101U, PSA_CRYPTO_GENERATE_KEY_CALL, NULL, 0, NULL, 0);

psa_call(0x40000104U, PSA_TA_ATTESTATION_CREATE_NONCE_CALL, NULL, 0, outvecs_nonce, 1);

invecs[0].base = &nonce;
invecs[0].len = outvecs_nonce[0].len;
outvecs_nonce_encrypted[0].len = outvecs_nonce[0].len;
psa_call(0x40000101U, PSA_CRYPTO_ENCRYPTION_CALL, invecs, 1, outvecs_nonce_encrypted, 1);

invecs[0].base = outvecs_nonce_encrypted[0].base;
invecs[0].len = outvecs_nonce_encrypted[0].len;
outvecs_nonce_decrypted[0].len = outvecs_nonce_encrypted[0].len;
psa_call(0x40000101U, PSA_CRYPTO_DECRYPTION_CALL, invecs, 1, outvecs_nonce_decrypted, 1);

invecs[0].base = outvecs_nonce_decrypted[0].base;
invecs[0].len = outvecs_nonce_decrypted[0].len
psa_call(0x40000104U, PSA_TA_ATTESTATION_CREATE_TOKEN_CALL, invecs, 1, outvecs_token, 1);
```

Run [script.sh](http://script.sh) or script2.sh(simple version)

Outputs:

![Untitled](Attestation%20a8ded2f2d7074045afe5bf63b79e8951/Untitled.png)

(NONCE ENCRYPTED, está mal, aquilo é o NONCE original)

![Untitled](Attestation%20a8ded2f2d7074045afe5bf63b79e8951/Untitled%201.png)

![Untitled](Attestation%20a8ded2f2d7074045afe5bf63b79e8951/Untitled%202.png)

To do:

Pass encryption through attestation TA
Cryptographic hardware