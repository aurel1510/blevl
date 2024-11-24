//
// vtable.s
//

.syntax unified
.cpu cortex-m4
//.fpu softvpf
.thumb

.section .VectorTable, "a"
.word _StackEnd
.word ResetHandler
.space 0xC4
.word USART1Handler
.space 0x64

