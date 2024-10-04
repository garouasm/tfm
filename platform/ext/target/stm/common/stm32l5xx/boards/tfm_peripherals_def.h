/*
 * Copyright (c) 2018-2021, Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#ifndef __TFM_PERIPHERALS_DEF_H__
#define __TFM_PERIPHERALS_DEF_H__



extern struct platform_data_t timer2;
extern struct platform_data_t rcc;
extern struct platform_data_t gpioa;
extern struct platform_data_t gpioa_ns;
extern struct platform_data_t spi1;



#define TFM_PERIPHERAL_TIMER2 &timer2
#define TFM_PERIPHERAL_RCC &rcc
#define TFM_PERIPHERAL_GPIOA &gpioa 
#define TFM_PERIPHERAL_SPI1 &spi1
#define TFM_PERIPHERAL_GPIOA_NS &gpioa_ns 
#define TFM_SYSTICK &systick
#define TFM_PERIPHERAL_STD_UART     (0)
#define TFM_PERIPHERAL_TIMER0       (0)


#define DEFAULT_IRQ_PRIORITY    (1UL << (__NVIC_PRIO_BITS - 2))
#define TFM_TIMER2_IRQ (TIM2_IRQn) 
#define TFM_TIMER2_IRQ (TIM2_IRQn) 


#endif /* __TFM_PERIPHERALS_DEF_H__ */
