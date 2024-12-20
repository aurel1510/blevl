/*
 * blevl/src/startup.s
 * 
 * - Contains all module initialization
 * and configuration subroutines.
 */

.syntax unified
.cpu cortex-m4
.thumb

.include "inc/stm32wb55rg.s"
.include "inc/armv7m.s"

.text
.type InitUSART1, %function
.global InitUSART1
InitUSART1:
    // clock configuration
    // enable clock signal for GPIO port B module
    ldr r0, =RCC_BoundaryAddress
    ldr r1, [r0, #RCC_AHB2ENR_AddressOffset]
    orr r1, #(0b1<<GPIOBEN)
    str r1, [r0, #RCC_AHB2ENR_AddressOffset]
    // enable clock signal for USART1
    ldr r1, [r0, #RCC_APB2ENR_AddressOffset]
    orr r1, #(0b1<<USART1EN)
    str r1, [r0, #RCC_APB2ENR_AddressOffset]
    // select system clock
    ldr r1, [r0, #RCC_CCIPR_AddressOffset]
    orr r1, #(0b01<<USART1SEL0)
    str r1, [r0, #RCC_CCIPR_AddressOffset]
    // configure GPIO pins PB6 and PB7
    // default output push-pull (reset state)
    // set alternate mode for USART1 via ST-Link USB
    ldr r0, =GPIOB_BoundaryAddress
    ldr r1, [r0, #GPIOx_MODER_AddressOffset]
    and r1, #(~(0b1111<<MODE60))
    orr r1, #(0b1010<<MODE60)
    str r1, [r0, #GPIOx_MODER_AddressOffset]
    // set output speed low
    ldr r1, [r0, #GPIOx_OSPEEDR_AddressOffset]
    and r1, #(~(0b1111<<OSPEED60))
    str r1, [r0, #GPIOx_OSPEEDR_AddressOffset]
    // set pull-up
    ldr r1, [r0, #GPIOx_PUPDR_AddressOffset]
    orr r1, #(0b0101<<PUPD60)
    str r1, [r0, #GPIOx_PUPDR_AddressOffset]
    // select alternate mode AF7
    ldr r1, [r0, #GPIOx_AFRL_AddressOffset]
    orr r1, #(0b01110111<<AFSEL60)
    str r1, [r0, #GPIOx_AFRL_AddressOffset]
    // USART1 module configuration
    // set baud rate to 115200
    ldr r0, =USART1_BoundaryAddress
    ldr r1, =(4000000/115200) // 35
    str r1, [r0, #USART_BRR_AddressOffset]
    // enable TX and RX, RX interrupts and USART1
    ldr r1, [r0, #USART_CR1_AddressOffset]
    orr r1, #((1<<RXNEIE)|(1<<TE)|(1<<RE)|(1<<UE))
    str r1, [r0, #USART_CR1_AddressOffset]
	// enable USART1 in ARM NVIC IRQ control register
	ldr r0, =NVIC_BoundaryAddress
	ldr r1, [r0, #NVIC_ISER1_AddressOffset]
    ldr r2, =(0b1<<SETENA4)
    orr r1, r2
	str r1, [r0, #NVIC_ISER1_AddressOffset]
    bx lr

.text
.type InitUserLED, %function
.global InitUserLED
InitUserLED:
    // clock configuration
    // enable clock signal for GPIO port B module
    ldr r0, =RCC_BoundaryAddress
    ldr r1, [r0, #RCC_AHB2ENR_AddressOffset]
    orr r1, #(0b1<<GPIOBEN)
    str r1, [r0, #RCC_AHB2ENR_AddressOffset]
    // configure GPIO port B pin 5
    // default output push-pull (reset state)
    // default low speed (reset state)
    ldr r0, =GPIOB_BoundaryAddress
    // set PB5 to general output mode
    ldr r1, [r0, #GPIOx_MODER_AddressOffset]
    and r1, #(~(0b11<<MODE50))
    orr r1, #(0b01<<MODE50)
    str r1, [r0, #GPIOx_MODER_AddressOffset]
    // set PB5 to pull-up
    // for some reason not working without r2
    ldr r1, [r0, #GPIOx_PUPDR_AddressOffset]
    ldr r2, =(~(0b11<<PUPD50))
    and r1, r2
    ldr r2, =(0b01<<PUPD50)
    orr r1, r2
    str r1, [r0, #GPIOx_PUPDR_AddressOffset]
    bx lr

.text
.type InitUserButton, %function
.global InitUserButton
InitUserButton:
    // clock configuration
    // enable clock signal for GPIO port D module
    ldr r0, =RCC_BoundaryAddress
    ldr r1, [r0, #RCC_AHB2ENR_AddressOffset]
    ldr r2, =(0b1<<GPIODEN)
    orr r1, r2
    str r1, [r0, #RCC_AHB2ENR_AddressOffset]
    // configure GPIO port D pin 0
    // default input push-pull (reset state)
    // default low speed (reset state)
    ldr r0, =GPIOD_BoundaryAddress
    // set PD0 to input mode
    ldr r1, [r0, #GPIOx_MODER_AddressOffset]
    ldr r2, =(~(0b11<<MODE00))
    and r1, r2
    str r1, [r0, #GPIOx_MODER_AddressOffset]
    // set PD0 to pull-up
    ldr r1, [r0, #GPIOx_PUPDR_AddressOffset]
    ldr r2, =(~(0b11<<PUPD00))
    and r1, r2
    ldr r2, =(0b01<<PUPD00)
    orr r1, r2
    str r1, [r0, #GPIOx_PUPDR_AddressOffset]
	// select PD0 for EXTI line 0 input pin
	ldr r0, =SYSCFG_BoundaryAddress
	ldr r1, [r0, #SYSCFG_EXTICR1_AddressOffset]
    ldr r2, =(0b011<<EXTI00)
    orr r1, r2
	str r1, [r0, #SYSCFG_EXTICR1_AddressOffset]
	// enable rising edge trigger on line 0
	//ldr r0, =EXTI_BoundaryAddress
	//ldr r1, [r0, #EXTI_RTSR1_AddressOffset]
    //ldr r2, =(0b1<<RT0)
    //orr r1, r2
	//str r1, [r0, #EXTI_RTSR1_AddressOffset]
	// enable falling edge trigger on line 0
	ldr r1, [r0, #EXTI_FTSR1_AddressOffset]
    ldr r2, =(0b1<<FT0)
    orr r1, r2
	str r1, [r0, #EXTI_FTSR1_AddressOffset]
	// enable EXTI0 in ARM NVIC IRQ control register
	ldr r0, =NVIC_BoundaryAddress
	ldr r1, [r0, #NVIC_ISER0_AddressOffset]
    ldr r2, =(0b1<<SETENA6)
    orr r1, r2
	str r1, [r0, #NVIC_ISER0_AddressOffset]
	// set port D bit 0 high
    //ldr r1, =(0b1<<BS0)
    //str r1, [r0, #GPIOx_BSRR_AddressOffset]
    bx lr
