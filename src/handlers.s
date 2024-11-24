//
// handlers.s
//

.syntax unified
.cpu cortex-m4
//.fpu softvpf
.thumb

.text
.type ResetHandler, %function
.global ResetHandler
ResetHandler:
    nop
    bl Main

.text
.type USART1Handler, %function
.global USART1Handler
USART1Handler:
    nop
    bx lr

