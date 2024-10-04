/*
 * Copyright (c) 2018, Arm Limited. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 *
 */

#ifndef __TFM_PERIPHERALS_DEF_H__
#define __TFM_PERIPHERALS_DEF_H__

extern struct platform_data_t spi1;
extern struct platform_data_t gpioe;



#define TFM_PERIPHERAL_STD_UART     (0)
#define TFM_PERIPHERAL_TIMER0       (0)
#define TFM_PERIPHERAL_FPGA_IO      (0)
#define TFM_PERIPHERAL_SPI1 &spi1
#define TFM_PERIPHERAL_GPIOE &gpioe

#endif /* __TFM_PERIPHERALS_DEF_H__ */
