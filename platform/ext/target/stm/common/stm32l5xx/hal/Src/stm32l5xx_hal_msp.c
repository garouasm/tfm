#include "stm32l5xx_hal.h"
#include "stm32l5xx_hal_spi.h"
#include "stm32l5xx_hal_gpio.h"




void HAL_SPI_MspInit(SPI_HandleTypeDef *hspi){

GPIO_InitTypeDef GPIO_InitStruct = {0};

  /**SPI1 GPIO Configuration
    PA4     ------> SPI1_NSS 
    PA5     ------> SPI1_SCK
    PA6     ------> SPI1_MISO
    PA7     ------> SPI1_MOSI
    */
__HAL_SPI_ENABLE(hspi);
__HAL_RCC_SPI1_CLK_ENABLE();
__HAL_RCC_GPIOA_CLK_ENABLE(); 
  if(hspi->Instance==SPI1)
  {
    if(hspi->Init.Mode == SPI_MODE_SLAVE){
      GPIO_InitStruct.Pin = GPIO_PIN_5 ;
      GPIO_InitStruct.Mode = GPIO_MODE_AF_OD;
      GPIO_InitStruct.Pull = GPIO_NOPULL;
      GPIO_InitStruct.Alternate = GPIO_AF5_SPI1;
      GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
      HAL_GPIO_Init(GPIOA_S, &GPIO_InitStruct);
      GPIO_InitStruct.Pin = GPIO_PIN_7;
      GPIO_InitStruct.Mode = GPIO_MODE_AF_OD;
      GPIO_InitStruct.Pull = GPIO_NOPULL;
      GPIO_InitStruct.Alternate = GPIO_AF5_SPI1;
      GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
      HAL_GPIO_Init(GPIOA_S, &GPIO_InitStruct);
      GPIO_InitStruct.Pin = GPIO_PIN_6;
      GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
      GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
      GPIO_InitStruct.Alternate = GPIO_AF5_SPI1;
      HAL_GPIO_Init(GPIOA_S, &GPIO_InitStruct);
      GPIO_InitStruct.Pin = GPIO_PIN_4;
      GPIO_InitStruct.Mode = GPIO_MODE_AF_OD;
      GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
      GPIO_InitStruct.Pull = GPIO_PULLDOWN;
      GPIO_InitStruct.Alternate = GPIO_AF5_SPI1;
      HAL_GPIO_Init(GPIOA_S, &GPIO_InitStruct);
      GPIO_InitStruct.Pin = GPIO_PIN_1; //pin for starting synchronization
      GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
      GPIO_InitStruct.Pull = GPIO_NOPULL;
      GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
      HAL_GPIO_Init(GPIOA_S, &GPIO_InitStruct);
      GPIO_InitStruct.Pin = GPIO_PIN_2; //pin for requesting attestation
      GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
      GPIO_InitStruct.Pull = GPIO_NOPULL;
      GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
      HAL_GPIO_Init(GPIOA_S, &GPIO_InitStruct);

    }
     else {
      GPIO_InitStruct.Pin = GPIO_PIN_5;
      GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
      GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
      GPIO_InitStruct.Alternate = GPIO_AF5_SPI1;
      GPIO_InitStruct.Pull = GPIO_PULLDOWN;
      HAL_GPIO_Init(GPIOA_S, &GPIO_InitStruct);
      GPIO_InitStruct.Pin =  GPIO_PIN_6 ;
      GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
      GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
      GPIO_InitStruct.Alternate = GPIO_AF5_SPI1;
      GPIO_InitStruct.Pull = GPIO_NOPULL;
      HAL_GPIO_Init(GPIOA_S, &GPIO_InitStruct);
      GPIO_InitStruct.Pin =  GPIO_PIN_7 ;
      GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
      GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
      GPIO_InitStruct.Alternate = GPIO_AF5_SPI1;
      GPIO_InitStruct.Pull = GPIO_PULLUP;
      HAL_GPIO_Init(GPIOA_S, &GPIO_InitStruct);
      GPIO_InitStruct.Pin = GPIO_PIN_4;
      GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
      GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
      GPIO_InitStruct.Alternate = GPIO_AF5_SPI1;
      HAL_GPIO_Init(GPIOA_S, &GPIO_InitStruct);
      GPIO_InitStruct.Pin = GPIO_PIN_1; //pin for starting synchronization
      GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
      GPIO_InitStruct.Pull = GPIO_NOPULL;
      GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
      HAL_GPIO_Init(GPIOA_S, &GPIO_InitStruct);
       GPIO_InitStruct.Pin = GPIO_PIN_2; //pin for requesting attestation
      GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
      GPIO_InitStruct.Pull = GPIO_PULLDOWN;
      GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
      HAL_GPIO_Init(GPIOA_S, &GPIO_InitStruct);

     }
     
   }


    // GPIO_InitStruct.Pin = GPIO_PIN_7;
    // GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    // GPIO_InitStruct.Pull = GPIO_PULLDOWN;
    // GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    // GPIO_InitStruct.Alternate = GPIO_AF5_SPI1;
    // HAL_GPIO_Init(GPIOA_S, &GPIO_InitStruct);

  

  

  if(hspi->Instance==SPI2)
  {

    /**SPI2 GPIO Configuration
    PD0     ------> SPI2_NSS 
    PD1     ------> SPI2_SCK
    PD3     ------> SPI2_MISO
    PD4     ------> SPI2_MOSI
    */
    GPIO_InitStruct.Pin = GPIO_PIN_1|GPIO_PIN_3;
    GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    GPIO_InitStruct.Alternate = GPIO_AF5_SPI2;
    HAL_GPIO_Init(GPIOD_S, &GPIO_InitStruct);

    GPIO_InitStruct.Pin = GPIO_PIN_0|GPIO_PIN_4;
    GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Alternate = GPIO_AF5_SPI2;
    HAL_GPIO_Init(GPIOD_S, &GPIO_InitStruct);
    // GPIO_InitStruct.Pin = GPIO_PIN_4;
    // GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
    // GPIO_InitStruct.Pull = GPIO_PULLDOWN;
    // GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    // GPIO_InitStruct.Alternate = GPIO_AF5_SPI2;
    // HAL_GPIO_Init(GPIOD_S, &GPIO_InitStruct);

}
}
