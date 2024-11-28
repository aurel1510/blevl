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
message:
    .ascii "Hello world!\n\r\0"
    .align 4

.text
.type Main, %function
.global Main
Main:
    ldr r1, =GPIOB_BoundaryAddress
    toggle_on:
    ldr r2, =(0b1<<BS5)
    str r2, [r1, #GPIOx_BSRR_AddressOffset]
    ldr r2, =DELAY_CYCLES
    // puts hello world
    ldr r0, =message
    bl USART_Puts
    delay_on:
        subs r2, #1
        bne delay_on
    // toggle_off
    ldr r2, =(0b1<<BR5)
    str r2, [r1, #GPIOx_BSRR_AddressOffset]
    ldr r2, =DELAY_CYCLES
    delay_off:
        subs r2, #1
        bne delay_off
    // puts hello world
    ldr r0, =message
    bl USART_Puts
    b toggle_on

.text
.type USART_Transmit, %function
.global USART_Transmit
USART_Transmit:
    push { r1, r2 }
    ldr r1, =USART1_BoundaryAddress
    wait_for_TXE:
        ldr r2, [r1, #USART_ISR_AddressOffset]
        tst r2, #(1<<TXE)
        beq wait_for_TXE
    strb r0, [r1, #USART_TDR_AddressOffset]
    pop { r1, r2 }
    bx lr

.text
.type USART_Puts, %function
.global USART_Puts
USART_Puts:
    push { r1, lr }
    mov r1, r0
    iterate_mesage:
        ldrb r0, [r1], #1
        cmp r0, #0
        beq message_end
        bl USART_Transmit
        b iterate_mesage
    message_end:
    pop { r1, lr }
    bx lr
