/*
 * blevl/src/main.s
 *
 * - Contains the main subroutine program -
 * entry point after initialization.
 */

.syntax unified
.cpu cortex-m4
.thumb

.include "inc/stm32wb55rg.s"

.equ DELAY_CYCLES, (4000000/3)

.text
.type Main, %function
.global Main
Main:
    ldr r1, =GPIOB_BoundaryAddress
toggle_on:
    ldr r2, =(0b1<<BS5)
    str r2, [r1, #GPIOx_BSRR_AddressOffset]
    ldr r2, =DELAY_CYCLES
send_a:
    ldr r0, ='a'
    bl USART_Transmit
delay_on:
    subs r2, #1
    bne delay_on
toggle_off:
    ldr r2, =(0b1<<BR5)
    str r2, [r1, #GPIOx_BSRR_AddressOffset]
    ldr r2, =DELAY_CYCLES
delay_off:
    subs r2, #1
    bne delay_off
send_b:
    ldr r0, ='b'
    bl USART_Transmit
    b toggle_on

.text
.type USART_Transmit, %function
.global USART_Transmit
USART_Transmit:
    push { r1, r2 }
    ldr r1, =USART1_BoundaryAddress
    wait_for_TXE:
        ldr r2, [r1, #USART_ISR_AddressOffset]
        and r2, #(1<<TXE)
        cmp r2, #(1<<TXE)
        bne wait_for_TXE
    str r0, [r1, #USART_TDR_AddressOffset]
    pop { r1, r2 }
    bx lr

