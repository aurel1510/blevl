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
.space 0xC4
.word USART1Handler
.space 0x64
