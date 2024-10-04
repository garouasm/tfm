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
// #include "stm32u5xx_hal_spi.h"
// #include "stm32u585xx.h"
#include "stm32l5xx_hal_spi.h"
#include "stm32l552xx.h"
#include "stm32l5xx_hal.h"
#include "psa_manifest/tfm_ta_communication_rep.h"
// #include "stm32u5xx.h"
// #include "stm32u5xx_hal.h"

#define GPIO_OUTPUT_TYPE      (0x00000010U)
#define GPIO_MODE             (0x00000003U)
#define GPIO_NUMBER           (16U)
#define REDUNDANCY_SIZE 32
#define COUNTOF(__BUFFER__)   (sizeof(__BUFFER__) / sizeof(*(__BUFFER__)))
#define BUFFERSIZE 114
#define SIZE_PADDING(__SIZE__) ( ( 4 - (__SIZE__ % 4 ) ) & 3 )


#define print(x, y) for (size_t i = 0; i < y; i++){printf("%c",x[i]);}printf("\r\n")
// GPIO_InitTypeDef GPIOc =   {GPIO_PIN_13, 
//                             GPIO_MODE_INPUT,
//                             GPIO_NOPULL,
//                             GPIO_SPEED_FREQ_MEDIUM};

psa_signal_t sig;
psa_signal_t exti_signal;
// void* data_send_2;
struct psa_invec invecs[1]; 
struct psa_outvec outvecs[1];
struct psa_outvec outvecs_token[1];

struct psa_invec self_invecs[1]; 
struct psa_outvec self_outvecs[1];
struct psa_outvec self_outvecs_token[1];
struct psa_outvec self_outvecs_nonce[1];
struct psa_outvec self_outvecs_nonce_encrypted[1];
struct psa_outvec outvecs_nonce_decrypted[1];
// void* data_receive_2;
SPI_HandleTypeDef hspi1;
uint8_t aTxBuffer[];
uint16_t aRxBuffer[BUFFERSIZE];
uint8_t nonce[64];
uint8_t token[592];

uint8_t self_nonce[64];
uint8_t self_nonce_encrypted[64];
uint8_t nonce_decrypted[64];
uint32_t *s_nonce;
uint32_t *s_token;
uint8_t self_token[592];
uint8_t normal_buffer[23];
uint8_t rec_buffer[17];
// uint8_t redundancy_data_2[] = {"Example data"};
// uint8_t encrypted_redundancy_data_2[sizeof(redundancy_data_2)];
GPIO_InitTypeDef GPIO_InitStruct = {0};
static void SPI1_Init(void);
static int8_t index = 0;
int i = 0;

static void dump_nonce(uint8_t nonce[], uint8_t size_nonce)
{
    int i;
    unsigned char num;

    printf("\r\n");
    printf("########### nonce(len: %d): ###########\r\n", size_nonce);
    for (i = 0; i < size_nonce; ++i)
    {
        num = nonce[i];
        printf(" 0x%X%X", (num & 0xF0) >> 4, num & 0x0F);
        if (((i + 1) % 8) == 0)
        {
            printf("\r\n");
        }
    }
    printf("\r\n############## nonce end  ##############\r\n");
    printf("\r\n");
}

psa_status_t tfm_ta_communication_rep_service_sfn(const psa_msg_t *msg)
{
    static uint8_t cycles = 2;

    // data_send_2 = redundancy_data_2;
    // data_receive_2 = encrypted_redundancy_data_2;
    // invecs[0].base = data_send_2;
    // invecs[0].len = sizeof(redundancy_data_2);
    // outvecs[0].base = data_receive_2;
    // outvecs[0].len = sizeof(redundancy_data_2);
    invecs[0].base = &nonce;
    invecs[0].len = sizeof(nonce);
    self_outvecs_token[0].base = &self_token;
    self_outvecs_token[0].len = sizeof(self_token);
    self_outvecs_nonce[0].base = &self_nonce;
    self_outvecs_nonce[0].len = 100;
    self_outvecs_nonce_encrypted[0].base = &self_nonce_encrypted;
    self_outvecs_nonce_encrypted[0].len = 100;
    outvecs_nonce_decrypted[0].base = &nonce_decrypted;
    outvecs_nonce_decrypted[0].len = 64;
    s_token = &self_token;
    s_nonce = &self_nonce_encrypted;

    switch (msg->type) {
    case PSA_IPC_CALL:
    while(cycles){
      psa_call(0x40000101U, PSA_CRYPTO_GENERATE_KEY_CALL, NULL, 0, NULL, 0);

      printf("CREATE NONCE");
      psa_call(0x40000104U, PSA_TA_ATTESTATION_CREATE_NONCE_CALL, NULL, 0, self_outvecs_nonce, 1);
      self_invecs[0].base = &self_nonce;
      self_invecs[0].len = self_outvecs_nonce[0].len;

      psa_call(0x40000101U, PSA_CRYPTO_ENCRYPTION_CALL, self_invecs, 1, self_outvecs_nonce_encrypted, 1);
      printf("[MCU SLAVE] Send nonce\r\n");
      dump_nonce(self_nonce_encrypted, sizeof(self_nonce));
      HAL_SPI_FlushRxFifo(&hspi1);
      //////////////////////////////////////////////////////////
      // strcpy(normal_buffer, "1234567891234567891234");
      HAL_GPIO_WritePin(GPIOA_S, GPIO_PIN_2, GPIO_PIN_SET);//call for the ta_attestation service
      while (HAL_GPIO_ReadPin(GPIOA_S, GPIO_PIN_4) == 1);
      // dump_nonce(normal_buffer, sizeof(normal_buffer));
      // if (HAL_SPI_Receive(&hspi1, &rec_buffer, sizeof(rec_buffer) , 0) != HAL_OK)
      //   printf("SPI communication failed");
      // dump_nonce(rec_buffer,sizeof(rec_buffer));
      // if (HAL_SPI_Transmit(&hspi1, (uint8_t*)normal_buffer , sizeof(normal_buffer) + SIZE_PADDING(sizeof(normal_buffer)) , 1/*5000*/) != HAL_OK) {
      //       printf("SPI communication failed");
      //     }
      //////////////////////////////////////////////////////////
      // PIN = 1

      if (HAL_SPI_Receive(&hspi1, &nonce, sizeof(nonce), 0) != HAL_OK)
          printf("SPI communication failed");
      //PIN = 0 
      if (HAL_SPI_Transmit(&hspi1, self_nonce_encrypted ,self_outvecs_nonce[0].len  + 4  , 1/*5000*/) != HAL_OK)
          printf("SPI communication failed");
      HAL_GPIO_WritePin(GPIOA_S, GPIO_PIN_2, GPIO_PIN_SET);
      //PIN = 1
      printf("[MCU SLAVE] Receive nonce");
      dump_nonce(nonce,sizeof(nonce));
      // psa_call(0x40000101U, PSA_CRYPTO_DECRYPTION_CALL, invecs, 1, outvecs_nonce_decrypted, 1);
      // invecs[0].base = &nonce_decrypted;
      // invecs[0].len = sizeof(nonce);
      printf("CREATE TOKEN");
      psa_call(0x40000104U, PSA_TA_ATTESTATION_CREATE_TOKEN_CALL, invecs, 1, self_outvecs_token, 1);
      // HAL_GPIO_WritePin(GPIOA_S, GPIO_PIN_2, GPIO_PIN_RESET);
      //PIN = 0
      if (HAL_SPI_Transmit(&hspi1, (uint8_t*)s_token , 518, 1/*5000*/) != HAL_OK) {
                    printf("SPI communication failed");
      }
      
      HAL_GPIO_WritePin(GPIOA_S, GPIO_PIN_2, GPIO_PIN_RESET);
      cycles --;
    }
    return PSA_SUCCESS;
        
  
           //configure a second spi and call receive and transmit
           //lets create a different message as the print should result in:

           //**** MASTER ******** Transmit ******** HELLO SLAVE ******** 
        //    **** SLAVE  ******** Receive ******** HELLO SLAVE ******** 
        //    **** SLAVE ******** Transmit ******** HELLO MASTER ******** 
        //    **** MASTER ******** Receive ******** HELLO MASTER ******** 

          
        //     //Data encryption   
        
        //     printf("Redundancy msg:\r\n");
        //     print(redundancy_data_2, sizeof(redundancy_data_2));
        //     psa_call(0x40000101U, PSA_COM_CALL, invecs, 1, outvecs, 1);
        //     printf("Encrypted msg:\r\n");

        //     memcpy(encrypted_redundancy_data_2, data_receive_2, sizeof(redundancy_data_2));
        //     print(encrypted_redundancy_data_2, sizeof(redundancy_data_2));

            //wait for feedback
            // toggle_interrupt(1);
            // psa_panic();
        //
        
    return PSA_SUCCESS;
    
    case PSA_SPI: 

    exti_signal = psa_wait(PSA_WAIT_ANY, PSA_BLOCK);
    if(exti_signal & R_GPIO_1_SIGNAL){
      if(HAL_GPIO_ReadPin(GPIOA_S,GPIO_PIN_4) == GPIO_PIN_RESET){
        while(1){
          if (HAL_SPI_Receive(&hspi1, aRxBuffer, 10 , 10/*5000*/) != HAL_OK) {
          // printf("SPI communication failed");
          break;
          }
        }
      }
    }
      return PSA_SUCCESS;

    default:
    return PSA_ERROR_NOT_SUPPORTED;
    }
}

psa_status_t tfm_ta_communication_rep_init(void)
{

    sig = R_GPIO_1_SIGNAL;
    LOG_INFFMT("[MCU2][Communication] TFM_ENTRY_POINT...\r\n");
    printf("SPI1 init start\r\n");
    SPI1_Init();
  
    
    //HAL_EXTI_SetConfigLine(EXTI_HandleTypeDef *hexti, EXTI_ConfigTypeDef *pExtiConfig);


    //Enable flih irq
    psa_irq_enable(sig);
    
    return PSA_SUCCESS;
}

psa_flih_result_t r_gpio_1_flih(void){

printf("[MCU2][GPIO] Interrupt handled\r\n");


return PSA_FLIH_SIGNAL;
}


static void SPI1_Init(void)
{

  /* SPI1 parameter configuration*/
  hspi1.Instance = SPI1_S;
  hspi1.Init.Mode = SPI_MODE_SLAVE;
  hspi1.Init.Direction = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi1.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi1.Init.NSS = SPI_NSS_SOFT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_128;
  // hspi1.Init.TIMode = SPI_TIMODE_ENABLE;
  // hspi1.Init.CRCCalculation = SPI_CRCCALCULATION_ENABLE;
  hspi1.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi1.Init.CRCPolynomial = 0;
  hspi1.Init.CRCLength = SPI_CRC_LENGTH_DATASIZE;
  if (HAL_SPI_Init(&hspi1) != HAL_OK)
  {
    psa_panic();
  }
 
  
}
