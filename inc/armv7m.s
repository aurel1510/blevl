/*
 * blevl/inc/armv7m.s
 *
 * - Contains control registers for the
 * ARMv7M Architecture CPUs.
 */

.syntax unified
.cpu cortex-m4
.thumb

// System Control Space, address range 0xE000E000 to 0xE000EFFF
.equ CSC_BoundaryAddress, 0xE000E000

// SysTick 0xE000E010-0xE000E0FF System Timer, see The system timer, SysTick on page B3-676
.equ SYST_OffsetAddress, 0x010
.equ SYST_BoundaryAddress, CSC_BoundaryAddress + SYST_OffsetAddress

// NVIC 0xE000E100-0xE000ECFF External interrupt controller, see Nested Vectored Interrupt Controller, NVIC on page B3-680
.equ NVIC_OffsetAddress, 0x100
.equ NVIC_BoundaryAddress, CSC_BoundaryAddress + NVIC_OffsetAddress

// B3.2.13 System Handler Control and State Register, SHCSR
// The SHCSR characteristics are:
// Purpose Controls and provides the active and pending status of system exceptions.
// Usage constraints Exception processing automatically updates the SHCSR fields. However, software can 
// write to the register to add or remove the pending or active state of an exception. When 
// updating the SHCSR, ARM recommends using a read-modify-write sequence, to avoid 
// unintended effects on the state of the exception handlers.
// Removing the active state of an exception can change the current execution priority, and 
// affect the exception return consistency checks. If software removes the active state, causing 
// a change in current execution priority, this can defeat the architectural behavior that 
// prevents an exception from preempting its own handler.
// Configurations Always implemented.
// Attributes See Table B3-4 on page B3-652.
// 0xE000ED24 SHCSR RW 0x00000000 System Handler Control and State Register, SHCSR on page B3-663.
// The SHCSR bit assignments are:
.equ SHCSR, 0xE000ED24
.equ SHCSR_ResetValue, 0x00000000
// SYSTICKACT, bit[11] 
// 0 SysTick is not active.
// 1 SysTick is active.
.equ SYSTICKACT, 11

// B3.3.3 SysTick Control and Status Register, SYST_CSR
// The SYST_CSR characteristics are:
// Purpose Controls the system timer and provides status data.
// Usage constraints There are no usage constraints.
// Configurations Always implemented.
// Attributes See Table B3-7, and the description of the CLKSOURCE bit.
// 0xE000E010 SYST_CSR RW 0x0000000xa SysTick Control and Status Register, SYST_CSR
// The SYST_CSR bit assignments are:
.equ SYST_CSR_OffsetAddress, 0x00
.equ SYST_CSR, SYST_BoundaryAddress + SYST_CSR_OffsetAddress
// Bits[31:17] Reserved.
// COUNTFLAG, bit[16] 
// Indicates whether the counter has counted to 0 since the last read of this register:
// 0 Timer has not counted to 0.
// 1 Timer has counted to 0.
// COUNTFLAG is set to 1 by a count transition from 1 to 0.
// COUNTFLAG is cleared to 0 by a software read of this register, and by any write to the 
// Current Value register. Debugger reads do not clear the COUNTFLAG.
// This bit is read only.
.equ COUNTFLAG, 16
// Bits[15:3] Reserved.
// CLKSOURCE, bit[2] Indicates the SysTick clock source:
// 0 SysTick uses the IMPLEMENTATION DEFINED external reference clock.
// 1 SysTick uses the processor clock.
// If no external clock is provided, this bit reads as 1 and ignores writes.
.equ CLKSOURCE, 2
// TICKINT, bit[1] Indicates whether counting to 0 causes the status of the SysTick exception to change to 
// pending:
// 0 Count to 0 does not affect the SysTick exception status.
// 1 Count to 0 changes the SysTick exception status to pending.
// Changing the value of the counter to 0 by writing zero to the SysTick Current Value register 
// to 0 never changes the status of the SysTick exception.
.equ TICKINT, 1
// ENABLE, bit[0] Indicates the enabled status of the SysTick counter:
// 0 Counter is disabled.
// 1 Counter is operating.
.equ ENABLE, 0

// 0xE000E014 SYST_RVR RW UNKNOWN SysTick Reload Value Register, SYST_RVR on page B3-678
// 0xE000E018 SYST_CVR RW UNKNOWN SysTick Current Value Register, SYST_CVR on page B3-678
// 0xE000E01C SYST_CALIB RO IMP DEF SysTick Calibration value Register, SYST_CALIB on page B3-679

// B3.4.4 Interrupt Set-Enable Registers, NVIC_ISER0-NVIC_ISER15
// The NVIC_ISERn characteristics are:
// Purpose Enables, or reads the enable state of a group of interrupts.
// Usage constraints NVIC_ISERn[31:0] are the set-enable bits for interrupts (31+(32*n)) - (32*n).
// When n=15, bits[31:16] are reserved.
// Configurations At least one register is always implemented, see Implemented NVIC registers on 
// page B3-682.
// Attributes See Table B3-8 on page B3-682.
// The NVIC_ISERn bit assignments are:
// 0xE000E100- 
// 0xE000E13C
// NVIC_ISER0- 
// NVIC_ISER15
// RW 0x00000000 Interrupt Set-Enable Registers, NVIC_ISER0-NVIC_ISER15 on 
// page B3-684
.equ NVIC_ISER0_AddressOffset, 0x00
.equ NVIC_ISER0, NVIC_BoundaryAddress + NVIC_ISER0_AddressOffset
.equ NVIC_ISER1_AddressOffset, 0x04
.equ NVIC_ISER1, NVIC_BoundaryAddress + NVIC_ISER1_AddressOffset
// SETENA, bits[m] For register NVIC_ISERn, enables or shows the current enabled state of interrupt 
// (m+(32*n)):
// 0 On reads, interrupt disabled.
// On writes, no effect.
// 1 On reads, interrupt enabled.
// On writes, enable interrupt.
// m takes the values from 31 to 0, except for NVIC_ISER15, where:
// • m takes the values from 15 to 0.
// • Register bits[31:16] are reserved, RAZ/WI.
// Software can enable multiple interrupts in a single write to NVIC_ISERn.
.equ SETENA0, 0
.equ SETENA1, 1
.equ SETENA2, 2
.equ SETENA3, 3
.equ SETENA4, 4
.equ SETENA5, 5
.equ SETENA6, 6
.equ SETENA7, 7
.equ SETENA8, 8
.equ SETENA9, 9
.equ SETENA10, 10
.equ SETENA11, 11
.equ SETENA12, 12
.equ SETENA13, 13
.equ SETENA14, 14
.equ SETENA15, 15
.equ SETENA16, 16
.equ SETENA17, 17
.equ SETENA18, 18
.equ SETENA19, 19
.equ SETENA20, 20
.equ SETENA21, 21
.equ SETENA22, 22
.equ SETENA23, 23
.equ SETENA24, 24
.equ SETENA25, 25
.equ SETENA26, 26
.equ SETENA27, 27
.equ SETENA28, 28
.equ SETENA29, 29
.equ SETENA30, 30
.equ SETENA31, 31

// 0xE000E180- 
// 0xE000E1BC
// NVIC_ICER0- 
// NVIC_ICER15
// RW 0x00000000 Interrupt Clear-Enable Registers, NVIC_ICER0-NVIC_ICER15 on 
// page B3-684

// 0xE000E200- 
// 0xE000E23C
// NVIC_ISPR0- 
// NVIC_ISPR15
// RW 0x00000000 Interrupt Set-Pending Registers, NVIC_ISPR0-NVIC_ISPR15 on 
// page B3-685

// 0xE000E280- 
// 0xE000E2BC
// NVIC_ICPR0- 
// NVIC_ICPR15
// RW 0x00000000 Interrupt Clear-Pending Registers, NVIC_ICPR0-NVIC_ICPR15 on 
// page B3-685

// 0xE000E300- 
// 0xE000E33C
// NVIC_IABR0- 
// NVIC_IABR15
// RO 0x00000000 Interrupt Active Bit Registers, NVIC_IABR0-NVIC_IABR15 on 
// page B3-686

// 0xE000E400- 
// 0xE000E5EC
// NVIC_IPR0- 
// NVIC_IPR123
// RW 0x00000000 Interrupt Priority Registers, NVIC_IPR0-NVIC_IPR123 on 
// page B3-686
