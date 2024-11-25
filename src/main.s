//
// main.s
//

.syntax unified
.cpu cortex-m4
.thumb

.include "inc/stm32wb55rg.inc"

.global Main
Main:
    ldr r0, =GPIOB_BSRR
    b delay_on

toggle_on:
    ldr r1, =0b1
    lsl r1, #BS5
    str r1, [r0]
    ldr r2, =1000000

delay_on:
    subs r2, #0x1
    bne delay_on

toggle_off:
    ldr r1, =0b1
    lsl r1, #BR5
    str r1, [r0]
    ldr r2, =1000000

delay_off:
    subs r2, #0x1
    bne delay_off
    b toggle_on

