/*
 * blevl/src/vtable.s
 *
 * - Contains CPU1 interrupt subroutines
 * jump vector table.
 */

.syntax unified
.cpu cortex-m4
.thumb

.section .VectorTable, "a"
.word _StackEnd
.word ResetHandler

.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler

.word SystickHandler

.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler

.word EXTI0Handler

.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler

.word USART1Handler

.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler
.word DefaultHandler

.type DefaultHandler, %function
.global DefaultHandler
DefaultHandler:
	bkpt
	b.n DefaultHandler
