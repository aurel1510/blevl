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
    b Main

.text
.type USART1Handler, %function
.global USART1Handler
USART1Handler:
    nop
    bx lr

