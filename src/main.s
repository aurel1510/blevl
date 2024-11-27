//
// main.s
//

.syntax unified
.cpu cortex-m4
.thumb

.include "inc/stm32wb55rg.s"

.equ DELAY_CYCLES, 1300000

.text
.type Main, %function
.global Main
Main:
    ldr r0, =GPIOB_BSRR
    b delay_on

toggle_on:
    ldr r1, =0b1
    lsl r1, #BS5
    str r1, [r0]
    ldr r2, =DELAY_CYCLES

send:
    push { r0 }
    ldr r0, ='a'
    bl USART_Transmit
    pop { r0 }

delay_on:
    subs r2, #1
    bne delay_on

toggle_off:
    ldr r1, =0b1
    lsl r1, #BR5
    str r1, [r0]
    ldr r2, =DELAY_CYCLES

delay_off:
    subs r2, #1
    bne delay_off
    b toggle_on

.text
.type USART_Transmit, %function
.global USART_Transmit
USART_Transmit:
    push { r1, r2 }
    ldr r1, =USART_ISR
    wait_for_TXE:
        ldr r2, [r1]
        and r2, #(1<<TXE)
        cmp r2, #(1<<TXE)
        bne wait_for_TXE
    ldr r1, =USART_TDR
    str r0, [r1]
    pop { r1, r2 }
    bx lr

