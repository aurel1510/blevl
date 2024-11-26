//
// handlers.s
//

.syntax unified
.cpu cortex-m4
.thumb

.include "inc/stm32wb55rg.s"

.text
.type ResetHandler, %function
.global ResetHandler
ResetHandler:
    bl ResetStackPointer
    bl InitUserLED
    bl InitUSART1
    b Main

.text
.type USART1Handler, %function
.global USART1Handler
USART1Handler:
    nop
    bx lr

