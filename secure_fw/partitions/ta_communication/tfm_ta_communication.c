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
#include "stm32l5xx_hal_spi.h"
#include "tfm_plat_test.h"
#include "tfm_sp_log.h"
#include "tfm_its_defs.h"
#include "psa_manifest/tfm_ta_communication.h"
#include "stm32l5xx_hal.h"
// #include "stm32l5xx_hal_gpio.h"
#include "stm32l552xx.h"

#define  TIM2_BASE_S (0x50000000UL)
#define GPIO_MODE             (0x00000003U)
#define EXTI_MODE             (0x10000000U)
#define GPIO_MODE_IT          (0x00010000U)
#define GPIO_MODE_EVT         (0x00020000U)
#define RISING_EDGE           (0x00100000U)
#define FALLING_EDGE          (0x00200000U)
#define GPIO_OUTPUT_TYPE      (0x00000010U)

#define GPIO_NUMBER           (16U)

#define COUNTOF(__BUFFER__)   (sizeof(__BUFFER__) / sizeof(*(__BUFFER__)))
#define BUFFERSIZE (COUNTOF(aTxBuffer) - 1)
#define REDUNDANCY_SIZE 32
#define print(x, y) for (size_t i = 0; i < y; i++){printf("%c",x[i]);}printf("\r\n")
#define SIZE_PADDING(__SIZE__) ( ( 4 - (__SIZE__ % 4 ) ) & 3 )

typedef struct{
    uintptr_t base_add;
    uint16_t offset;    
} timer_t;

timer_t tim2;
volatile uintptr_t* timer;
psa_signal_t timer_signal;
psa_signal_t sig;
psa_signal_t request;
void* data_send;
struct psa_invec invecs[2]; 
struct psa_outvec outvecs[1];
void* data_receive;
GPIO_InitTypeDef GPIOa =   {GPIO_PIN_3, 
                            GPIO_MODE_OUTPUT_PP,
                            GPIO_NOPULL,
                            GPIO_SPEED_FREQ_MEDIUM};

static uint8_t redundancy_data[] = {"Example data"};
static uint8_t encrypted_redundancy_data[sizeof(redundancy_data)];
SPI_HandleTypeDef hspi1;

/* Buffer used for transmission */
uint8_t aTxBuffer[] = {"abcdefghij"};
/****SPI - Loopback communication based on Polling **** SPI Message ******** SPI Message ******** SPI Message ****/
/* Buffer used for reception */
uint8_t aRxBuffer[BUFFERSIZE];

//create 2 services
// 1 for the synchronization where 1) the master sends an interrupt via GPIO to the slave to store system values
// and then master sends its values to the slave and the slave will compare the values

// other for spi COM for attestation purposes - 1) Slave calls master to Create a nonce
//2) Master sends the nonce via SPI and waits while Slave receives it and immediatelly calls CREATE_TOKEN with
//the nonce encrypting everything and sends back to the master
//3) Master receives the token and validates the token with PSA_TA_ATTESTATION_VERIFICATION_CALL

//builtin keys
static void dump_nonce(uint8_t nonce[], uint32_t size_nonce)
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


static void SPI1_Init(void);

psa_status_t tfm_ta_communication_service_sfn(const psa_msg_t *msg)
{ 
    static uint8_t cycles = 2;
    static uint8_t shift = 3;
    uint8_t nonce[64];
    uint8_t nonce_encrypted[64];
    uint8_t nonce_decrypted[64];
    uint8_t token[518];
    uint8_t self_nonce[64];
    uint8_t self_token[592];
    uint8_t self_nonce_encrypted[64];
    uint8_t *real_token; 
    uint8_t normal_buffer[17];
    uint8_t rec_buffer[23];
    uint32_t *s_nonce;
    uint32_t *s_token;
    uint32_t *nonce_ptr;

    struct psa_invec self_invecs[1]; 
    struct psa_outvec self_outvecs[1];
    struct psa_outvec self_outvecs_token[2];
    struct psa_outvec self_outvecs_nonce[1];
    struct psa_outvec self_outvecs_nonce_encrypted[1];
    
    struct psa_outvec outvecs_nonce[1];
    struct psa_outvec outvecs_token[1];
    struct psa_outvec outvecs_nonce_encrypted[1];
    struct psa_outvec outvecs_nonce_decrypted[1];
    
    outvecs_nonce[0].base = &nonce;
    outvecs_nonce[0].len = 100;
    outvecs_token[0].base = &token;
    outvecs_token[0].len = 592;
    outvecs_nonce_encrypted[0].base = &nonce_encrypted;
    outvecs_nonce_encrypted[0].len = 100;

    self_outvecs_nonce[0].base = &self_nonce;
    self_outvecs_nonce[0].len = 100;
    self_outvecs_nonce_encrypted[0].base = &self_nonce_encrypted;
    self_outvecs_nonce_encrypted[0].len = 100;
    self_outvecs_token[0].base = &self_token;
    self_outvecs_token[0].len = 592;

    outvecs_nonce_decrypted[0].base = &nonce_decrypted;
    outvecs_nonce_decrypted[0].len = 64;

    s_token = &self_token;
    s_nonce = &self_nonce_encrypted;
    nonce_ptr = &nonce;

    invecs[0].base = &nonce;
    invecs[0].len = sizeof(nonce);
    


    switch (msg->type) {
    case PSA_IPC_CALL:
    while(1)
    {
        timer_signal = psa_wait(PSA_WAIT_ANY, PSA_BLOCK);
        if(timer_signal & R_TIMER_SIGNAL)
        {
            int i = 0;
            printf("[MCU1]Interrupt occured\r\n");

                HAL_GPIO_WritePin(GPIOA_S,GPIO_PIN_4, GPIO_PIN_RESET);
            // TODO : implement a timer for transmission/reception timeout management

            while(1){
              if (HAL_SPI_Transmit(&hspi1, (uint8_t*) aTxBuffer, 10 , 1/*5000*/) != HAL_OK) {
                  printf("SPI communication failed");
              }
            }
                 HAL_GPIO_WritePin(GPIOA_S,GPIO_PIN_4, GPIO_PIN_SET);
           
            // Data encryption   
        
            // printf("Redundancy msg:\r\n");
            // print(redundancy_data, sizeof(redundancy_data));
            // psa_call(0x40000101U, PSA_COM_CALL, invecs, 1, outvecs, 1);
            // printf("Encrypted msg:\r\n");

            // memcpy(encrypted_redundancy_data, data_receive, sizeof(redundancy_data));
            // print(encrypted_redundancy_data, sizeof(redundancy_data)); 


            //wait for feedback
             psa_panic();
        }
    }
    return PSA_SUCCESS;

    case PSA_SPI:
    while(cycles){
        request = psa_wait(PSA_WAIT_ANY, PSA_BLOCK);
        if(request & GPIO_ATTESTATION_SIGNAL){

            invecs[0].base = &nonce;
            invecs[0].len = sizeof(nonce);
            request = 0;
            HAL_GPIO_WritePin(GPIOA_S,GPIO_PIN_4, GPIO_PIN_RESET);
            psa_call(0x40000101U, PSA_CRYPTO_GENERATE_KEY_CALL, NULL, 0, NULL, 0);
            printf("CREATE NONCE");
            psa_call(0x40000104U, PSA_TA_ATTESTATION_CREATE_NONCE_CALL, NULL, 0, self_outvecs_nonce, 1);
            self_invecs[0].base = &self_nonce;
            self_invecs[0].len = self_outvecs_nonce[0].len;
            HAL_SPI_FlushRxFifo(&hspi1);
            //////////////////////////////////////////////////////////
            // strcpy(normal_buffer, "abcdefabcdefabcd");

            // dump_nonce(normal_buffer, sizeof(normal_buffer));
            // for(int delay = 0; delay < 64; delay ++){}
            // if (HAL_SPI_Transmit(&hspi1, (uint8_t*)normal_buffer , sizeof(normal_buffer) + SIZE_PADDING(sizeof(normal_buffer)) , 1/*5000*/) != HAL_OK) {
            //             printf("SPI communication failed");
            // }
            // while(HAL_GPIO_ReadPin(GPIOA_S, GPIO_PIN_2) == 1);
            // for(int delay = 0; delay < 64; delay ++){}
            // if (HAL_SPI_Receive(&hspi1, &rec_buffer, sizeof(rec_buffer) + SIZE_PADDING(sizeof(rec_buffer)) , 0) != HAL_OK)
            //     printf("SPI communication failed");
            
            // dump_nonce(rec_buffer, sizeof(rec_buffer));
            ///////////////////////////////////////////////////////////
            psa_call(0x40000101U, PSA_CRYPTO_ENCRYPTION_CALL, self_invecs, 1, self_outvecs_nonce_encrypted, 1);
            dump_nonce(self_nonce_encrypted, sizeof(self_nonce));

            printf("[MCU MASTER] Send nonce\r\n");
            //send nonce here

            if (HAL_SPI_Transmit(&hspi1, self_nonce_encrypted , self_outvecs_nonce[0].len + 4 , 1/*5000*/) != HAL_OK) {
                        printf("SPI communication failed");
            }
            
            while(HAL_GPIO_ReadPin(GPIOA_S, GPIO_PIN_2) == 1);
            HAL_GPIO_WritePin(GPIOA_S,GPIO_PIN_4, GPIO_PIN_SET);
            printf("[MCU MASTER] Receive nonce");
            if (HAL_SPI_Receive(&hspi1, nonce_ptr, sizeof(nonce) , 0) != HAL_OK)
                printf("SPI communication failed");
            
            dump_nonce(nonce,sizeof(nonce));
            
            //create a token and then receive one    
            printf("CREATE TOKEN");
            psa_call(0x40000101U, PSA_CRYPTO_DECRYPTION_CALL, invecs, 1, outvecs_nonce_decrypted, 1);
            invecs[0].base = &nonce_decrypted;
            invecs[0].len = sizeof(nonce);
            invecs[1].base = &self_nonce_encrypted;
            invecs[1].len = sizeof(nonce);
            psa_call(0x40000104U, PSA_TA_ATTESTATION_CREATE_TOKEN_CALL, invecs, 1, self_outvecs_token, 1);
            while(HAL_GPIO_ReadPin(GPIOA_S, GPIO_PIN_2) == 1);
            printf("[MCU MASTER] Receive token");

            
            if (HAL_SPI_Receive(&hspi1, &token, sizeof(token) , 0) != HAL_OK)
                printf("SPI communication failed");

            
            for (int i = shift; i <  (sizeof(token)/sizeof(token[0]) + 2) ; i++)
            token [i - shift]  =  token[i]; 

            invecs[0].base = &token;
            invecs[0].len = 515;
        
            psa_call(0x40000104U, PSA_TA_ATTESTATION_VERIFICATION_CALL, invecs, 2, NULL, 0);

            
            dump_nonce(token, 515);
            cycles --;
        }

    }
    return PSA_SUCCESS;
    
    
    //fazer teste com o nonce igual
    //teste com token 
    //teste com o software/firmware
    
    default:
    return PSA_ERROR_NOT_SUPPORTED;
    }
    
    
}

psa_status_t tfm_ta_communication_init(void)
{

    sig = R_TIMER_SIGNAL;
    SPI1_Init();
    // sig = R_GPIO_2_SIGNAL;
    LOG_INFFMT("[MCU1][Communication] TFM_ENTRY_POINT...\r\n");
    uint32_t temp;
    uint32_t odr;

    //configure pin with TZ security (GPIOx_SECCFGR register) 
    //Pin PA3 configuration 
    // HAL_GPIO_Init(GPIOA_S, &GPIOa);
    temp = GPIOA_S->OSPEEDR;
    temp &= ~ (GPIO_OSPEEDR_OSPEED0 << 6);
    temp |= GPIOa.Speed << 6;
    GPIOA_S->OSPEEDR = temp;

    temp = GPIOA_S->OTYPER;
    temp &= ~ (GPIO_OTYPER_OT0 << 6);
    temp |= (((GPIOa.Pull & GPIO_OUTPUT_TYPE) >> 4) << 6);
    GPIOA_S->OTYPER= temp;

    temp = GPIOA_S->PUPDR;
    temp &= ~(GPIO_PUPDR_PUPD0 << 6);
    GPIOA_S->PUPDR = temp;


    temp = GPIOA_S->MODER;
    temp &= ~(GPIO_MODER_MODE0 & GPIO_MODE << 6);
    temp |= GPIOa.Mode << 6;
    GPIOA_S->MODER = temp;

    odr = GPIOA_S->ODR;
    GPIOA_S->BSRR = ((odr & GPIO_PIN_3) << GPIO_NUMBER) | (~odr & GPIO_PIN_3);

    // HAL_GPIO_TogglePin(GPIOA_S, 3);

    //Enable flih irq
    psa_irq_enable(sig);
    sig = GPIO_ATTESTATION_SIGNAL;
    psa_irq_enable(sig);
    
    
    return PSA_SUCCESS;
}

psa_flih_result_t r_timer_flih(void)
{

    printf("[MCU1][Timer2] Sync timer interrupt handled\r\n");
    HAL_GPIO_WritePin(GPIOA_S, GPIO_PIN_1, GPIO_PIN_SET);
    // clear_interrupt_flag();

    return PSA_FLIH_SIGNAL;
}

psa_flih_result_t gpio_attestation_flih(void)
{
    printf("[MCU1][Timer2] gpio attestation interrupt handled\r\n");
    HAL_GPIO_WritePin(GPIOA_S, GPIO_PIN_1, GPIO_PIN_SET);
    return PSA_FLIH_SIGNAL;
}

static void SPI1_Init(void)
{

  /* SPI1 parameter configuration*/
  hspi1.Instance = SPI1_S;
  hspi1.Init.Mode = SPI_MODE_MASTER;
  hspi1.Init.Direction = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi1.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi1.Init.NSS = SPI_NSS_SOFT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_128;
//   hspi1.Init.TIMode = SPI_TIMODE_ENABLE;
  hspi1.Init.FirstBit = SPI_FIRSTBIT_MSB;
//   hspi1.Init.CRCCalculation = SPI_CRCCALCULATION_ENABLE;
  hspi1.Init.CRCPolynomial = 0;
  hspi1.Init.NSSPMode = SPI_NSS_PULSE_ENABLE;
  hspi1.Init.CRCLength = SPI_CRC_LENGTH_DATASIZE;

  if (HAL_SPI_Init(&hspi1) != HAL_OK)
  {
    psa_panic();
  }
  HAL_GPIO_WritePin(GPIOA_S, GPIO_PIN_4, GPIO_PIN_SET);
}
