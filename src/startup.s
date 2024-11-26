//
// startup.s
//

.syntax unified
.cpu cortex-m4
.thumb

.include "inc/stm32wb55rg.s"

.text
.type ResetStackPointer, %function
.global ResetStackPointer
ResetStackPointer:
    bx lr

.text
.type InitUSART1, %function
.global InitUSART1
InitUSART1:
    // enable clock for USART1
    ldr r0, =RCC_APB2ENR
    ldr r1, [r0]
    ldr r2, =0b1
    lsl r2, #USART1EN
    orr r1, r2
    str r1, [r0]
    // select system clock
    ldr r0, =RCC_CCIPR
    ldr r1, [r0]
    ldr r2, =0b01
    lsl r2, #USART1SEL0
    orr r1, r2
    str r1, [r0]
    // set baud rate to 115200
    ldr r0, =USART_BRR
    ldr r1, =35
    str r1, [r0]
    // enable RX interrupts
    ldr r0, =USART_CR1
    ldr r1, [r0]
    ldr r2, =0b1
    lsl r2, #RXNEIE
    orr r1, r2
    // enable TX
    ldr r2, =0b1
    lsl r2, #TE
    orr r1, r2
    // enable RX
    ldr r2, =0b1
    lsl r2, #RE
    orr r1, r2
    // enable USART1
    ldr r2, =0b1
    lsl r2, #UE
    orr r1, r2
    str r1, [r0]
    bx lr

.text
.type InitUserLED, %function
.global InitUserLED
InitUserLED:
    // enable clock signal for GPIOB module
    ldr r0, =RCC_AHB2ENR
    ldr r1, [r0]
    ldr r2, =0b1
    lsl r2, #GPIOBEN
    orr r1, r2
    str r1, [r0]
    // set PB5 to general output mode
    ldr r0, =GPIOB_MODER
    ldr r1, [r0]
    ldr r2, =0b11
    lsl r2, #MODE50
    mvn r2, r2
    and r1, r2
    ldr r2, =0b01
    lsl r2, #MODE50
    orr r1, r2
    str r1, [r0]
    // set PB5 output type to push-pull
    ldr r0, =GPIOB_OTYPER
    ldr r1, [r0]
    ldr r2, =0b1
    lsl r2, #OT5
    mvn r2, r2
    and r1, r2
    str r1, [r0]
    // set PB5 to pull-up
    ldr r0, =GPIOB_PUPDR
    ldr r1, [r0]
    ldr r2, =0b11
    lsl r2, #PUPD50
    mvn r2, r2
    and r1, r2
    ldr r2, =0b01
    lsl r2, #PUPD50
    orr r1, r2
    str r1, [r0]
    // set bit in GPIOB_ODR for PB5 to high
    ldr r0, =GPIOB_BSRR
    ldr r1, =0b1
    lsl r1, #BS5
    str r1, [r0]
    bx lr

