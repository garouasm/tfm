/*
 * Copyright (c) 2017-2022, Arm Limited. All rights reserved.
 * Copyright (c) 2022 Cypress Semiconductor Corporation (an Infineon company)
 * or an affiliate of Cypress Semiconductor Corporation. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *

 */

#include "psa_manifest/sid.h"
#include "tfm_api.h"
#include "psa/service.h"
#include "psa/crypto.h"
#include "cmsis_os2.h"
#include "cmsis_compiler.h"
#include "tfm_ns_interface.h"
#include "tfm_nsid_manager.h"
#include "test_app.h"
#include "tfm_plat_ns.h"
#include "driver/Driver_USART.h"
#include "device_cfg.h"
#ifdef TFM_PARTITION_NS_AGENT_MAILBOX
#include "tfm_multi_core_api.h"
#include "tfm_ns_mailbox.h"
#endif
#include "tfm_log.h"
#include "uart_stdout.h"
#if (CONFIG_TFM_FLOAT_ABI >= 1)
#include "cmsis.h"
#endif


#define PSA_KEY_ID_USER_2 ((psa_key_id_t)0x22222222)
#define print(x, y) for (size_t i = 0; i < y; i++){printf("%c",x[i]);}printf("\r\n")


/**
 * \brief Modified table template for user defined SVC functions
 *
 * \details RTX has a weak definition of osRtxUserSVC, which
 *          is overridden here
 */
#if defined(__ARMCC_VERSION)
#if (__ARMCC_VERSION == 6110004)
/* Workaround needed for a bug in Armclang 6.11, more details at:
 * http://www.keil.com/support/docs/4089.htm
 */
__attribute__((section(".gnu.linkonce")))
#endif

/* Avoids the semihosting issue */
#if (__ARMCC_VERSION >= 6010050)
__asm("  .global __ARM_use_no_argv\n");
#endif
#endif

/**
 * \brief List of RTOS thread attributes
 */
static const osThreadAttr_t thread_attr = {
    .name = "test_thread",
    .stack_size = 4096U,
    .tz_module = ((TZ_ModuleId_t)TFM_DEFAULT_NSID)
};
/**
 * \brief Static globals to hold RTOS related quantities,
 *        main thread
 */
static osThreadFunc_t thread_func = test_app;

#ifdef TFM_MULTI_CORE_NS_OS_MAILBOX_THREAD
static osThreadFunc_t mailbox_thread_func = tfm_ns_mailbox_thread_runner;
static const osThreadAttr_t mailbox_thread_attr = {
    .name = "mailbox_thread",
    .stack_size = 1024U
};
#endif

#ifdef TFM_PARTITION_NS_AGENT_MAILBOX
static struct ns_mailbox_queue_t ns_mailbox_queue;

static void tfm_ns_multi_core_boot(void)
{
    int32_t ret;

    LOG_MSG("Non-secure code running on non-secure core.\r\n");

    if (tfm_ns_wait_for_s_cpu_ready()) {
        LOG_MSG("Error sync'ing with secure core.\r\n");

        /* Avoid undefined behavior after multi-core sync-up failed */
        for (;;) {
        }
    }

    ret = tfm_ns_mailbox_init(&ns_mailbox_queue);
    if (ret != MAILBOX_SUCCESS) {
        LOG_MSG("Non-secure mailbox initialization failed.\r\n");

        /* Avoid undefined behavior after NS mailbox initialization failed */
        for (;;) {
        }
    }
}
#endif /* TFM_PARTITION_NS_AGENT_MAILBOX */

#ifdef CONFIG_TFM_USE_TRUSTZONE
extern uint32_t tfm_ns_interface_init(void);
#endif

/**
 * \brief Platform peripherals and devices initialization.
 *        Can be overridden for platform specific initialization.
 *
 * \return  ARM_DRIVER_OK if the initialization succeeds
 */
__WEAK int32_t tfm_ns_platform_init(void)
{
    stdio_init();

    return ARM_DRIVER_OK;
}

/**
 * \brief Platform peripherals and devices de-initialization.
 *        Can be overridden for platform specific initialization.
 *
 * \return  ARM_DRIVER_OK if the de-initialization succeeds
 */
__WEAK int32_t tfm_ns_platform_uninit(void)
{
    stdio_uninit();

    return ARM_DRIVER_OK;
}


__WEAK int32_t tfm_ns_cp_init(void)
{
#if (CONFIG_TFM_FLOAT_ABI >= 1)
#ifdef __GNUC__
    /* Enable NSPE privileged and unprivilged access to the FP Extension */
    SCB->CPACR |= (3U << 10U*2U)     /* enable CP10 full access */
                  | (3U << 11U*2U);  /* enable CP11 full access */
#endif
#endif
    return ARM_DRIVER_OK;
}


void send_test() 
{
    uint8_t hello_msg[]={"Hello World"};
    uint8_t cipher_msg[sizeof(hello_msg)];
    uint8_t original_msg[sizeof(hello_msg)];

	struct psa_invec invecs[1] = {{hello_msg, sizeof(hello_msg)}};
	struct psa_outvec outvecs[3];
    
    outvecs[0].base = &hello_msg;
    outvecs[1].base = &cipher_msg;
    outvecs[2].base = &original_msg;

    outvecs[0].len = sizeof(hello_msg);
    outvecs[1].len = sizeof(cipher_msg);
    outvecs[2].len = sizeof(original_msg);

    LOG_MSG("Send call...\r\n");

    psa_call(0x40000101U, PSA_IPC_CALL, invecs, 1, outvecs, 3);
    printf("Original msg: ");
    print(hello_msg, sizeof(hello_msg));
    printf("Encrypted msg: ");
    print(cipher_msg, sizeof(cipher_msg));
    printf("Decrypted msg: ");
    print(original_msg, sizeof(original_msg));
}

void send_test_ta_attestation() 
{
    LOG_MSG("Send call to TA Attestation...\r\n");

    psa_call(0x40000104U, PSA_TEST_TA_ATTESTATION_CALL, NULL, 0, NULL, 0);
}

void send_test_ta_communication() 
{
    LOG_MSG("Send call to TA Communication...\r\n");

    psa_call(0x40000105U, PSA_IPC_CALL, NULL, 0, NULL, 0);
}



/**
 * \brief main() function
 */
#ifndef __GNUC__
__attribute__((noreturn))
#endif
int main(void)
{
    if (tfm_ns_platform_init() != ARM_DRIVER_OK) {
        /* Avoid undefined behavior if platform init failed */
        while(1);
    }

    if (tfm_ns_cp_init() != ARM_DRIVER_OK) {
        /* Avoid undefined behavior if co-porcessor init failed */
        while(1);
    }

    (void) osKernelInitialize();

#ifdef TFM_PARTITION_NS_AGENT_MAILBOX
    tfm_ns_multi_core_boot();
#endif

#ifdef CONFIG_TFM_USE_TRUSTZONE
    /* Initialize the TFM NS interface */
    tfm_ns_interface_init();
#endif

#ifdef TFM_MULTI_CORE_NS_OS_MAILBOX_THREAD
    (void) osThreadNew(mailbox_thread_func, NULL, &mailbox_thread_attr);
#endif

    (void) osThreadNew(thread_func, NULL, &thread_attr);

    //LOG_MSG("Non-Secure system starting...\r\n");
    //(void) osKernelStart(); nao deixa correr o resto do programa
    send_test_ta_communication();
    /* Reached only in case of error */
    for (;;) {
    }
}

