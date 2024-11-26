//
// stm32wb55rg.inc
//

.syntax unified
.cpu cortex-m4
.thumb

.equ BLE_CTRL_BoundaryAddress, 0x60000000
.equ EXTI_BoundaryAddress, 0x58000800
.equ PWR_BoundaryAddress, 0x58000400
.equ RCC_BoundaryAddress, 0x58000000
.equ GPIOE_BoundaryAddress, 0x48001000
.equ GPIOD_BoundaryAddress, 0x48000C00
.equ GPIOC_BoundaryAddress, 0x48000800
.equ GPIOB_BoundaryAddress, 0x48000400
.equ GPIOA_BoundaryAddress, 0x48000000
.equ USART1_BoundaryAddress, 0x40013800

// 8.4.18 RCC AHB2 peripheral clock enable register (RCC_AHB2ENR)
// Address offset: 0x04C
// Reset value: 0x0000 0000
// Access: No wait state, word, half-word and byte access
// Note: When the peripheral clock is not active, the peripheral registers read or write access from
// CPU1 is not supported.
.equ RCC_AHB2ENR_AddressOffset, 0x04c
.equ RCC_AHB2ENR_ResetValue, 0x00000000
.equ RCC_AHB2ENR, RCC_BoundaryAddress + RCC_AHB2ENR_AddressOffset
// Bit 1 GPIOBEN: CPU1 IO port B clock enable
// Set and cleared by software.
// 0: IO port B clock disabled for CPU1
// 1: IO port B clock enabled for CPU1
.equ GPIOBEN, 1

// 8.4.22 RCC APB2 peripheral clock enable register (RCC_APB2ENR)
// Address: 0x060
// Reset value: 0x0000 0000
// Access: word, half-word and byte access
// Note: When the peripheral clock is not active, the peripheral registers read or write access from
// CPU1 is not supported.
.equ RCC_APB2ENR_AddressOffset, 0x060
.equ RCC_APB2ENR_ResetValue, 0x000000
.equ RCC_APB2ENR, RCC_BoundaryAddress + RCC_APB2ENR_AddressOffset
// Bit 14 USART1EN: CPU1 USART1 clocks enable
// Set and cleared by software.
// 0: USART1 bus and kernel clocks disabled for CPU1
// 1: USART1 bus and kernel clocks enabled for CPU1
.equ USART1EN, 14

// 8.4.29 RCC peripherals independent clock configuration register
// (RCC_CCIPR)
// Address: 0x088
// Reset value: 0x0000 0000
// Access: no wait states, word, half-word and byte access
.equ RCC_CCIPR_AddressOffset, 0x088
.equ RCC_CCIPR_ResetValue, 0x00000000
.equ RCC_CCIPR, RCC_BoundaryAddress + RCC_CCIPR_AddressOffset
// Bits 1:0 USART1SEL[1:0]: USART1 clock source selection
// This bit is set and cleared by software to select the USART1 clock source.
// 00: PCLK selected as USART1 clock
// 01: System clock (SYSCLK) selected as USART1 clock
// 10: HSI16 clock selected as USART1 clock
// 11: LSE clock selected as USART1 clock
.equ USART1SEL0, 0
.equ USART1SEL1, 1

// GPIO port B mode register
.equ GPIOB_MODER, GPIOB_BoundaryAddress + 0x00
.equ GPIOB_MODER_ResetValue, 0xFFFFFEBF
// These bits are written by software to configure the I/O mode.
// 00: Input mode
// 01: General purpose output mode
// 10: Alternate function mode
// 11: Analog mode (reset state)
.equ MODE00, 0
.equ MODE01, 1
.equ MODE10, 2
.equ MODE11, 3
.equ MODE20, 4
.equ MODE21, 5
.equ MODE30, 6
.equ MODE31, 7
.equ MODE40, 8
.equ MODE41, 9
.equ MODE50, 10
.equ MODE51, 11
.equ MODE60, 12
.equ MODE61, 13
.equ MODE70, 14
.equ MODE71, 15
.equ MODE80, 16
.equ MODE81, 17
.equ MODE90, 18
.equ MODE91, 19
.equ MODE100, 20
.equ MODE101, 21
.equ MODE110, 22
.equ MODE111, 23
.equ MODE120, 24
.equ MODE121, 25
.equ MODE130, 26
.equ MODE131, 27
.equ MODE140, 28
.equ MODE141, 29
.equ MODE150, 30
.equ MODE151, 31

//GPIO port B output type register
.equ GPIOB_OTYPER, GPIOB_BoundaryAddress + 0x04
.equ GPIOB_OTYPER_ResetValue, 0x00000000
// These bits are written by software to configure the I/O output type.
// 0: Output push-pull (reset state)
// 1: Output open-drain
.equ OT0, 0
.equ OT1, 1
.equ OT2, 2
.equ OT3, 3
.equ OT4, 4
.equ OT5, 5
.equ OT6, 6
.equ OT7, 7
.equ OT8, 8
.equ OT9, 9
.equ OT10, 10
.equ OT11, 11
.equ OT12, 12
.equ OT13, 13
.equ OT14, 14
.equ OT15, 15

.equ GPIOB_OSPEEDR, GPIOB_BoundaryAddress + 0x08

// GPIO port B pull-up/pull-down register 
.equ GPIOB_PUPDR, GPIOB_BoundaryAddress + 0x0C
// These bits are written by software to configure the I/O pull-up or pull-down
// 00: No pull-up, pull-down
// 01: Pull-up
// 10: Pull-down
// 11: Reserved
.equ PUPD00, 0
.equ PUPD01, 1
.equ PUPD10, 2
.equ PUPD11, 3
.equ PUPD20, 4
.equ PUPD21, 5
.equ PUPD30, 6
.equ PUPD31, 7
.equ PUPD40, 8
.equ PUPD41, 9
.equ PUPD50, 10
.equ PUPD51, 11
.equ PUPD60, 12
.equ PUPD61, 13
.equ PUPD70, 14
.equ PUPD71, 15
.equ PUPD80, 16
.equ PUPD81, 17
.equ PUPD90, 18
.equ PUPD91, 19
.equ PUPD100, 20
.equ PUPD101, 21
.equ PUPD110, 22
.equ PUPD111, 23
.equ PUPD120, 24
.equ PUPD121, 25
.equ PUPD130, 26
.equ PUPD131, 27
.equ PUPD140, 28
.equ PUPD141, 29
.equ PUPD150, 30
.equ PUPD151, 31

.equ GPIOB_IDR, GPIOB_BoundaryAddress + 0x10
.equ GPIOB_ODR, GPIOB_BoundaryAddress + 0x14

// GPIO port B bit set/reset register 
.equ GPIOB_BSRR, GPIOB_BoundaryAddress + 0x18
.equ GPIOB_BSRR_ResetValue, 0x00000000
// These bits are write-only. A read to these bits returns the value 0x0000.
// 0: No action on the corresponding ODx bit
// 1: Sets the corresponding ODx bit
.equ BS0, 0
.equ BS1, 1
.equ BS2, 2
.equ BS3, 3
.equ BS4, 4
.equ BS5, 5
.equ BS6, 6
.equ BS7, 7
.equ BS8, 8
.equ BS9, 9
.equ BS10, 10
.equ BS11, 11
.equ BS12, 12
.equ BS13, 13
.equ BS14, 14
.equ BS15, 15
// These bits are write-only. A read to these bits returns the value 0x0000.
// 0: No action on the corresponding ODx bit
// 1: Resets the corresponding ODx bit
// Note: If both BSx and BRx are set, BSx has priority.
.equ BR0, 16
.equ BR1, 17
.equ BR2, 18
.equ BR3, 19
.equ BR4, 20
.equ BR5, 21
.equ BR6, 22
.equ BR7, 23
.equ BR8, 24
.equ BR9, 25
.equ BR10, 26
.equ BR11, 27
.equ BR12, 28
.equ BR13, 29
.equ BR14, 30
.equ BR15, 31

.equ GPIOB_LCKR, GPIOB_BoundaryAddress + 0x1C
.equ GPIOB_AFRL, GPIOB_BoundaryAddress + 0x20
.equ GPIOB_AFRH, GPIOB_BoundaryAddress + 0x24
.equ GPIOB_BRR, GPIOB_BoundaryAddress + 0x28

// 33.8.2 USART control register 1 [alternate] (USART_CR1)
// Address offset: 0x00
// Reset value: 0x0000 0000
// The same register can be used in FIFO mode enabled (previous section) and FIFO mode
// disabled (this section).
// FIFO mode disabled
.equ USART_CR1_AddressOffset, 0x00
.equ USART_CR1_ResetValue, 0x00000000
.equ USART_CR1, USART1_BoundaryAddress + USART_CR1_AddressOffset
// Bit 28 M1: Word length
// This bit must be used in conjunction with bit 12 (M0) to determine the word length. It is set or
// cleared by software.
// M[1:0] = ‘00’: 1 start bit, 8 Data bits, n Stop bit
// M[1:0] = ‘01’: 1 start bit, 9 Data bits, n Stop bit
// M[1:0] = ‘10’: 1 start bit, 7 Data bits, n Stop bit
// This bit can only be written when the USART is disabled (UE = 0).
// Note: In 7-bits data length mode, the smartcard mode, LIN master mode and auto baud rate
// (0x7F and 0x55 frames detection) are not supported.
.equ M1, 28
// Bit 12 M0: Word length
// This bit is used in conjunction with bit 28 (M1) to determine the word length. It is set or
// cleared by software (refer to bit 28 (M1)description).
// This bit can only be written when the USART is disabled (UE = 0).
.equ M0, 12
// Bit 7 TXEIE: Transmit data register empty
// This bit is set and cleared by software.
// 0: Interrupt inhibited
// 1: USART interrupt generated whenever TXE =1 in the USART_ISR register
.equ TXEIE, 7
// Bit 6 TCIE: Transmission complete interrupt enable
// This bit is set and cleared by software.
// 0: Interrupt inhibited
// 1: USART interrupt generated whenever TC = 1 in the USART_ISR register
.equ TCIE, 6
// Bit 5 RXNEIE: Receive data register not empty
// This bit is set and cleared by software.
// 0: Interrupt inhibited
// 1: USART interrupt generated whenever ORE = 1 or RXNE = 1 in the USART_ISR register
.equ RXNEIE, 5
// Bit 3 TE: Transmitter enable
// This bit enables the transmitter. It is set and cleared by software.
// 0: Transmitter is disabled
// 1: Transmitter is enabled
// Note: During transmission, a low pulse on the TE bit (‘0’ followed by ‘1’) sends a preamble
// (idle line) after the current word, except in smartcard mode. In order to generate an idle
// character, the TE must not be immediately written to ‘1’. To ensure the required duration,
// the software can poll the TEACK bit in the USART_ISR register.
// In smartcard mode, when TE is set, there is a 1 bit-time delay before the transmission
// starts.
.equ TE, 3
// Bit 2 RE: Receiver enable
// This bit enables the receiver. It is set and cleared by software.
// 0: Receiver is disabled
// 1: Receiver is enabled and begins searching for a start bit
.equ RE, 2
// Bit 0 UE: USART enable
// When this bit is cleared, the USART prescalers and outputs are stopped immediately, and all
// current operations are discarded. The USART configuration is kept, but all the USART_ISR
// status flags are reset. This bit is set and cleared by software.
// 0: USART prescaler and outputs disabled, low-power mode
// 1: USART enabled
// Note: To enter low-power mode without generating errors on the line, the TE bit must be
// previously reset and the software must wait for the TC bit in the USART_ISR to be set
// before resetting the UE bit.
// The DMA requests are also reset when UE = 0 so the DMA channel must be disabled
// before resetting the UE bit.
// In smartcard mode, (SCEN = 1), the CK pin is always available when CLKEN = 1,
// regardless of the UE bit value.
.equ UE, 0

// 33.8.5 USART baud rate register (USART_BRR)
// This register can only be written when the USART is disabled (UE = 0). It may be
// automatically updated by hardware in auto baud rate detection mode.
// Address offset: 0x0C
// Reset value: 0x0000 0000
.equ USART_BRR_AddressOffset, 0x0C
.equ USART_BRR_ResetValue, 0x00000000
.equ USART_BRR, USART1_BoundaryAddress + USART_BRR_AddressOffset
// Bits 15:0 BRR[15:0]: USART baud rate
// BRR[15:4]
// BRR[15:4] = USARTDIV[15:4]
// BRR[3:0]
// When OVER8 = 0, BRR[3:0] = USARTDIV[3:0].
// When OVER8 = 1:
// BRR[2:0] = USARTDIV[3:0] shifted 1 bit to the right.
// BRR[3] must be kept cleared.
.equ BRR0, 0
.equ BRR1, 1
.equ BRR2, 2
.equ BRR3, 3
.equ BRR4, 4

// 33.8.10 USART interrupt and status register [alternate] (USART_ISR)
// Address offset: 0x1C
// Reset value: 0x0000 00C0
// The same register can be used in FIFO mode enabled (previous section) and FIFO mode
// disabled (this section).
// FIFO mode disabled
.equ USART_ISR_AddressOffset, 0x1C
.equ USART_ISR_ResetValue, 0x000000C0
.equ USART_ISR, USART1_BoundaryAddress + USART_ISR_AddressOffset
// Bit 7 TXE: Transmit data register empty
// TXE is set by hardware when the content of the USART_TDR register has been transferred
// into the shift register. It is cleared by writing to the USART_TDR register. The TXE flag can
// also be set by writing 1 to the TXFRQ in the USART_RQR register, in order to discard the
// data (only in smartcard T = 0 mode, in case of transmission failure).
// An interrupt is generated if the TXEIE bit = 1 in the USART_CR1 register.
// 0: Data register full
// 1: Data register not full
.equ TXE, 7
// Bit 5 RXNE: Read data register not empty
// RXNE bit is set by hardware when the content of the USART_RDR shift register has been
// transferred to the USART_RDR register. It is cleared by reading from the USART_RDR
// register. The RXNE flag can also be cleared by writing 1 to the RXFRQ in the USART_RQR
// register.
// An interrupt is generated if RXNEIE = 1 in the USART_CR1 register.
// 0: Data is not received
// 1: Received data is ready to be read.
.equ RXNE, 5

// 33.8.12 USART receive data register (USART_RDR)
// Address offset: 0x24
// Reset value: 0x0000 0000
.equ USART_RDR_AddressOffset, 0x24
.equ USART_RDR_ResetValue, 0x00000000
.equ USART_RDR, USART1_BoundaryAddress + USART_RDR_AddressOffset
// Bits 8:0 RDR[8:0]: Receive data value
// Contains the received data character.
// The RDR register provides the parallel interface between the input shift register and the
// internal bus (see Figure 320).
// When receiving with the parity enabled, the value read in the MSB bit is the received parity
// bit.
.equ RDR0, 0

// 33.8.13 USART transmit data register (USART_TDR)
// Address offset: 0x28
// Reset value: 0x0000 0000
.equ USART_TDR_AddressOffset, 0x28
.equ USART_TDR_ResetValue, 0x00000000
.equ USART_TDR, USART1_BoundaryAddress + USART_TDR_AddressOffset
// Bits 8:0 TDR[8:0]: Transmit data value
// Contains the data character to be transmitted.
// The USART_TDR register provides the parallel interface between the internal bus and the
// output shift register (see Figure 320).
// When transmitting with the parity enabled (PCE bit set to 1 in the USART_CR1 register),
// the value written in the MSB (bit 7 or bit 8 depending on the data length) has no effect
// because it is replaced by the parity.
// Note: This register must be written only when TXE/TXFNF = 1.
.equ TDR0, 0

