#include <stdint.h>

#include "cmsis.h"
#include "spm_ipc.h"
#include "tfm_hal_interrupt.h"
#include "tfm_peripherals_def.h"
#include "ffm/interrupt.h"
#include "load/interrupt_defs.h"
#include "stm32l5xx_hal_gpio.h"
#include "stm32l5xx_hal_rcc.h"
#include "stm32l5xx_hal_exti.h"

#define  TIM2_BASE_S (0x50000000UL)

typedef struct{
    uintptr_t base_add;
    uint16_t offset;    
} timer_t;

timer_t tim2;
volatile uintptr_t* timer;
EXTI_HandleTypeDef hexti1;
EXTI_HandleTypeDef hexti2;

static struct irq_t timer2_irq = {0};
static struct irq_t exti2_irq = {0};
static struct irq_t exti1_irq = {0};


void TIM2_IRQHandler(void)
{
    spm_handle_interrupt(timer2_irq.p_pt, timer2_irq.p_ildi);
    clear_interrupt_flag();
   
}

void EXTI1_IRQHandler(void)
{
    HAL_EXTI_ClearPending(&hexti1, EXTI_TRIGGER_RISING);
    spm_handle_interrupt(exti1_irq.p_pt, exti1_irq.p_ildi);
    
}

void EXTI2_IRQHandler(void)
{
    HAL_EXTI_ClearPending(&hexti2, EXTI_TRIGGER_RISING);
    spm_handle_interrupt(exti2_irq.p_pt, exti2_irq.p_ildi);
    
   
}
// void SPI2_IRQHandler(void)
// {
//     spm_handle_interrupt(timer2_irq.p_pt, timer2_irq.p_ildi);



// }

// void EXTI0_IRQHandler(void)
// {
//     spm_handle_interrupt(exti0_irq.p_pt, exti0_irq.p_ildi);
   
// }

enum tfm_hal_status_t tim2_irqn_init(void *p_pt,
                                          const struct irq_load_info_t *p_ildi)
{
    timer2_irq.p_ildi = p_ildi;
    timer2_irq.p_pt = p_pt;
    volatile uintptr_t* timer;
    // struct platform_data_t tim2 = TFM_PERIPHERAL_TIMER2;
    //after SVC, it has the highest priority
    NVIC_SetPriority(TFM_TIMER2_IRQ, 1);
    NVIC_ClearTargetState(TFM_TIMER2_IRQ);
    //enable irq in NVIC
    NVIC_EnableIRQ(TFM_TIMER2_IRQ);
    //enable global interrupts
    __enable_irq();
    //connect RCC to TIM2
    __HAL_RCC_TIM2_CLK_ENABLE();    

    // 44 = offset of ARR register
    timer = TIM2_BASE_S + 44;
    *timer = 0xFFFFFF;
    // 40 = offset of PSC register
    timer = TIM2_BASE_S + 40;
    *timer = 0xFFFFF;
    // 12 = offset of DIER register
    timer = TIM2_BASE_S+ 12;
    *timer = TIM_DIER_UIE_Msk;
    // start timer
    timer = TIM2_BASE_S;
    *timer = TIM_CR1_CEN_Msk ;

    
    return TFM_HAL_SUCCESS;
}

enum tfm_hal_status_t exti2_irqn_init(void *p_pt, const struct irq_load_info_t *p_ildi){
    
    
    exti2_irq.p_ildi = p_ildi;
    exti2_irq.p_pt = p_pt;
    EXTI_ConfigTypeDef ExtiConfig;

    ExtiConfig.Line = EXTI_LINE_2;
    ExtiConfig.Mode = EXTI_MODE_INTERRUPT;
    ExtiConfig.Trigger = EXTI_TRIGGER_RISING;
    ExtiConfig.GPIOSel = EXTI_GPIOA;

    NVIC_SetPriority(EXTI2_IRQn, 1);
    NVIC_ClearTargetState(EXTI2_IRQn);
    //enable irq in NVIC
    NVIC_EnableIRQ(EXTI2_IRQn);
    __enable_irq();
    HAL_EXTI_SetConfigLine(&hexti2, &ExtiConfig);

    return TFM_HAL_SUCCESS;

}

enum tfm_hal_status_t exti1_irqn_init(void *p_pt, const struct irq_load_info_t *p_ildi){

    exti1_irq.p_ildi = p_ildi;
    exti1_irq.p_pt = p_pt;
    EXTI_ConfigTypeDef ExtiConfig;

    ExtiConfig.Line = EXTI_LINE_1;
    ExtiConfig.Mode = EXTI_MODE_INTERRUPT;
    ExtiConfig.Trigger = EXTI_TRIGGER_RISING;
    ExtiConfig.GPIOSel = EXTI_GPIOA;

    
    NVIC_SetPriority(EXTI1_IRQn, 1);
    NVIC_ClearTargetState(EXTI1_IRQn);
    //enable irq in NVIC
    NVIC_EnableIRQ(EXTI1_IRQn);
    __enable_irq();
    HAL_EXTI_SetConfigLine(&hexti1, &ExtiConfig);
    return TFM_HAL_SUCCESS;
}


void clear_interrupt_flag(){

    tim2.base_add = TIM2_BASE_S;
    tim2.offset = 16;
    timer = tim2.offset + tim2.base_add;
    *timer = (uint8_t)0;
}


// void toggle_interrupt(uint8_t msk){

//     tim2.base_add = TIM2_BASE_S;
//     tim2.offset = 12;
//     timer = tim2.offset + tim2.base_add;
//     *timer = msk;
// }
