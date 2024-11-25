//
// handlers.s
//

.syntax unified
.cpu cortex-m4
.thumb

.include "inc/stm32wb55rg.inc"

.text
.type ResetHandler, %function
.global ResetHandler
ResetHandler:
    bl ResetStackPointer
    bl InitUserLED
    b Main

.text
.type USART1Handler, %function
.global USART1Handler
USART1Handler:
    nop
    bx lr

