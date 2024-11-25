//
// startup.s
//

.syntax unified
.cpu cortex-m4
.thumb

.include "inc/stm32wb55rg.inc"

.text
.global ResetStackPointer
ResetStackPointer:
    bx lr

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

