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
#include "stm32l5xx_hal_spi.h"
#include "tfm_plat_test.h"
#include "tfm_sp_log.h"
#include "tfm_its_defs.h"
#include "stm32l5xx_hal.h"
#include "stm32l552xx.h"


#define COUNTOF(__BUFFER__)   (sizeof(__BUFFER__) / sizeof(*(__BUFFER__)))
#define BUFFERSIZE (COUNTOF(aTxBuffer) - 1)
#define REDUNDANCY_SIZE 32
#define print(x, y) for (size_t i = 0; i < y; i++){printf("%c",x[i]);}printf("\r\n")

typedef struct{
    uintptr_t base_add;
    uint16_t offset;    
} timer_t;

timer_t tim2;
volatile uintptr_t* timer;
psa_signal_t timer_signal;
psa_signal_t sig;
void* data_master;
struct psa_invec invecs[1]; 
struct psa_outvec outvecs[1];
void* data_slave;
// GPIO_InitTypeDef GPIOa =   {GPIO_PIN_3, 
//                             GPIO_MODE_OUTPUT_PP,
//                             GPIO_NOPULL,
//                             GPIO_SPEED_FREQ_MEDIUM};

static uint8_t redundancy_data[] = {"Example data"};
static uint8_t encrypted_redundancy_data[sizeof(redundancy_data)];

/* Buffer used for transmission */
// uint8_t aTxBuffer[] = "****SPI - Loopback communication based on Polling **** SPI Message ******** SPI Message ******** SPI Message ****";
// /* Buffer used for reception */
// uint8_t aRxBuffer[BUFFERSIZE];


static void SPI1_Init(void);

psa_status_t tfm_checker_service_sfn(const psa_msg_t *msg)
{
    
    invecs[0].base = data_master;
    invecs[0].len = sizeof(redundancy_data);
    invecs[1].base = data_slave;
    invecs[1].len = sizeof(redundancy_data);

    if(strcmp(data_master,data_slave))
    printf("Checkpoint passed\r\n");
    else
    printf("Checkpoint not valid\r\n");


    switch (msg->type) {
    case PSA_IPC_CALL:

    return PSA_SUCCESS;
     case PSA_SPI:
    

    default:
    return PSA_ERROR_NOT_SUPPORTED;
    }
}

psa_status_t tfm_checker_init(void)
{
 

    LOG_INFFMT("[MCU1][CHECKER] TFM_ENTRY_POINT...\r\n");


    
    return PSA_SUCCESS;
}



