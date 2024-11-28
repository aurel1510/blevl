/*
 * blevl/src/handlers.s
 *
 * - This source file contains all interrupt
 * handler subroutines.
 */

.syntax unified
.cpu cortex-m4
.thumb

.include "inc/stm32wb55rg.s"

.text
.type ResetHandler, %function
.global ResetHandler
ResetHandler:
    // SP reset by default
    bl InitUserLED
    bl InitUSART1
	bl InitUserButton
    b Main

.text
systick_message:
	.ascii "Systick Interrupt Triggered!\n\r\0"
	.align 4

.text
.type SystickHandler, %function
.global SystickHandler
SystickHandler:
	push { r0, lr }
    ldr r0, =systick_message;
	bl USART_Puts
	pop { r0, lr }
	bx lr

.text
exti0_message:
	.ascii "EXTI0 Interrupt Triggered!\n\r\0"
	.align 4

.text
.type EXTI0Handler, %function
.global EXTI0Handler
EXTI0Handler:
	push { r0, lr }
    ldr r0, =exti0_message;
	bl USART_Puts
	pop { r0, lr }
	bx lr

.text
usart1_message:
	.ascii "USART1 Interrupt Triggered!\n\r\0"
	.align 4

.text
.type USART1Handler, %function
.global USART1Handler
USART1Handler:
	push { r0, lr }
	ldr r0, =USART1_BoundaryAddress
	ldr r1, [r0, #USART_RDR_AddressOffset]
	mov r0, r1
	bl USART_Transmit
    ldr r0, =usart1_message;
	bl USART_Puts
	pop { r0, lr }
    bx lr

