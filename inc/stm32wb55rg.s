/*
 * blevl/inc/stm32wb55rg.s
 *
 * - Contains peripheral modules constants
 * native to the STM32WB55RG MCU.
 */

.syntax unified
.cpu cortex-m4
.thumb

// Module configuration registers memory boundary addresses
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
.equ SYSCFG_BoundaryAddress, 0x40010100

// 14.6.1 EXTI rising trigger selection register (EXTI_RTSR1)
// Address offset: 0x000
// Reset value: 0x0000 0000
// Contains only register bits for configurable events.
.equ EXTI_RTSR1_AddressOffset, 0x000
.equ EXTI_RTSR1_ResetValue, 0x00000000
.equ EXTI_RTSR1, EXTI_BoundaryAddress + EXTI_RTSR1_AddressOffset
// Bit 31 RT31: Rising trigger event configuration bit of configurable Event input 31(1).
// 0: Rising trigger disabled (for event and Interrupt) for input line
// 1: Rising trigger enabled (for event and Interrupt) for input line
.equ RT1, 31
// Bits 30:22 Reserved, must be kept at reset value.
// Bits 21:0 RT[21:0]: Rising trigger event configuration bit of configurable event input x (x = 21 to 0)(1).
// 0: Rising trigger disabled (for event and Interrupt) for input line
// 1: Rising trigger enabled (for event and Interrupt) for input line
.equ RT0, 0
.equ RT1, 1
.equ RT2, 2
.equ RT3, 3
.equ RT4, 4
.equ RT5, 5
.equ RT6, 6
.equ RT7, 7
.equ RT8, 8
.equ RT9, 9
.equ RT10, 10
.equ RT11, 11
.equ RT12, 12
.equ RT13, 13
.equ RT14, 14
.equ RT15, 15
.equ RT16, 16
.equ RT17, 17
.equ RT18, 18
.equ RT19, 19
.equ RT20, 20
.equ RT21, 21
// 1. The configurable event inputs are edge triggered, no glitch must be generated on these inputs. If a rising edge on the
// configurable event input occurs during writing of the register, the associated pending bit is not set. Rising and falling edge
// triggers can be set for the same configurable event input. In this case, both edges generate a trigger.

// 14.6.2 EXTI falling trigger selection register (EXTI_FTSR1)
// Address offset: 0x004
// Reset value: 0x0000 0000
// Contains only register bits for configurable events.
.equ EXTI_FTSR1_AddressOffset, 0x000
.equ EXTI_FTSR1_ResetValue, 0x00000000
.equ EXTI_FTSR1, EXTI_BoundaryAddress + EXTI_FTSR1_AddressOffset
// Bit 31 FT31: Falling trigger event configuration bit of configurable event input 31(1).
// 0: Falling trigger disabled (for event and Interrupt) for input line
// 1: Falling trigger enabled (for event and Interrupt) for input line.
.equ FT31, 31
// Bits 30:22 Reserved, must be kept at reset value.
// Bits 21:0 FT[21:0]: Falling trigger event configuration bit of configurable event input x (x = 21 to 0)(1).
// 0: Falling trigger disabled (for event and Interrupt) for input line
// 1: Falling trigger enabled (for event and Interrupt) for input line.
.equ FT0, 0
.equ FT1, 1
.equ FT2, 2
.equ FT3, 3
.equ FT4, 4
.equ FT5, 5
.equ FT6, 6
.equ FT7, 7
.equ FT8, 8
.equ FT9, 9
.equ FT10, 10
.equ FT11, 11
.equ FT12, 12
.equ FT13, 13
.equ FT14, 14
.equ FT15, 15
.equ FT16, 16
.equ FT17, 17
.equ FT18, 18
.equ FT19, 19
.equ FT20, 20
.equ FT21, 21
// 1. The configurable event inputs are edge triggered, no glitch must be generated on these inputs. If a falling edge on the
// configurable event input occurs during writing of the register, the associated pending bit is not set. Rising and falling edge
// triggers can be set for the same configurable event input. In this case, both edges generate a trigger.

// 8.4.18 RCC AHB2 peripheral clock enable register (RCC_AHB2ENR)
// Address offset: 0x04C
// Reset value: 0x0000 0000
// Access: No wait state, word, half-word and byte access
// Note: When the peripheral clock is not active, the peripheral registers read or write access from
// CPU1 is not supported.
.equ RCC_AHB2ENR_AddressOffset, 0x04c
.equ RCC_AHB2ENR_ResetValue, 0x00000000
.equ RCC_AHB2ENR, RCC_BoundaryAddress + RCC_AHB2ENR_AddressOffset
// Bit 0 GPIOAEN: CPU1 IO port A clock enable
// Set and cleared by software.
// 0: IO port A clock disabled for CPU1
// 1: IO port A clock enabled for CPU1
.equ GPIOAEN, 0
// Bit 1 GPIOBEN: CPU1 IO port B clock enable
// Set and cleared by software.
// 0: IO port B clock disabled for CPU1
// 1: IO port B clock enabled for CPU1
.equ GPIOBEN, 1
// Bit 2 GPIOCEN: CPU1 IO port C clock enable
// Set and cleared by software.
// 0: IO port C clock disabled for CPU1
// 1: IO port C clock enabled for CPU1
.equ GPIOCEN, 2
// Bit 3 GPIODEN: CPU1 IO port D clock enable (STM32WB55xx only)
// Set and cleared by software.
// 0: IO port D clock disabled for CPU1
// 1: IO port D clock enabled for CPU1
// Note that this bit is reserved on STM32WB35xx
.equ GPIODEN, 3
// Bit 4 GPIOEEN: CPU1 IO port E clock enable
// Set and cleared by software.
// 0: IO port E clock disabled for CPU1
// 1: IO port E clock enabled for CPU1
.equ GPIOEEN, 4
// Bit 7 GPIOHEN: CPU1 IO port H clock enable
// Set and cleared by software.
// 0: IO port H clock disabled for CPU1
// 1: IO port H clock enabled for CPU1
.equ GPIOHEN, 7
// Bit 13 ADCEN: CPU1 ADC clocks enable
// Set and cleared by software.
// 0: ADC bus and kernel clocks disabled for CPU1
// 1: ADC bus and kernel clocks enabled for CPU1
.equ ADCEN, 13
// Bit 16 AES1EN: CPU1 AES1 accelerator clock enable
// Set and cleared by software.
// 0: AES clock disabled for CPU1
// 1: AES clock enabled for CPU1
.equ AES1EN, 16

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

// 9.5.1 GPIO port mode register (GPIOx_MODER)
// (x =A to E and H)
// Address offset:0x00
.equ GPIOx_MODER_AddressOffset, 0x00
// Bits 31:0 MODE[15:0][1:0]: Port x configuration I/O pin y (y = 15 to 0)
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
// GPIO port A mode register
.equ GPIOA_MODER, GPIOA_BoundaryAddress + GPIOx_MODER_AddressOffset
.equ GPIOA_MODER_ResetValue, 0xABFFFFFF
// GPIO port B mode register
.equ GPIOB_MODER, GPIOB_BoundaryAddress + GPIOx_MODER_AddressOffset
.equ GPIOB_MODER_ResetValue, 0xFFFFFEBF
// GPIO port C mode register
.equ GPIOC_MODER, GPIOC_BoundaryAddress + GPIOx_MODER_AddressOffset
.equ GPIOC_MODER_ResetValue, 0xFFFFFFFF
// GPIO port D mode register
.equ GPIOD_MODER, GPIOD_BoundaryAddress + GPIOx_MODER_AddressOffset
.equ GPIOD_MODER_ResetValue, 0xFFFFFFFF
// GPIO port E mode register
// Port E[31:10] are reserved
.equ GPIOE_MODER, GPIOE_BoundaryAddress + GPIOx_MODER_AddressOffset
.equ GPIOE_MODER_ResetValue, 0x000003FF
// GPIO port H mode register
// Port H[31:8, 5:4] are reserved
.equ GPIOH_MODER, GPIOH_BoundaryAddress + GPIOx_MODER_AddressOffset
.equ GPIOH_MODER_ResetValue, 0x000000CF

// 9.5.2 GPIO port output type register (GPIOx_OTYPER)
// (x = A to E and H)
// Address offset: 0x04
// Reset value: 0x0000 0000
.equ GPIOx_OTYPER_AddressOffset, 0x04
.equ GPIOx_OTYPER_ResetValue, 0x00000000
// Bits 31:16 Reserved, must be kept at reset value.
// Bits 15:0 OT[15:0]: Port x configuration I/O pin y (y = 15 to 0)
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
// GPIO port A output type register
.equ GPIOA_OTYPER, GPIOA_BoundaryAddress + GPIOx_OTYPER_AddressOffset
// GPIO port B output type register
.equ GPIOB_OTYPER, GPIOB_BoundaryAddress + GPIOx_OTYPER_AddressOffset
// GPIO port C output type register
.equ GPIOC_OTYPER, GPIOC_BoundaryAddress + GPIOx_OTYPER_AddressOffset
// GPIO port D output type register
.equ GPIOD_OTYPER, GPIOD_BoundaryAddress + GPIOx_OTYPER_AddressOffset
// GPIO port E output type register
// Port E[31:5] are reserved
.equ GPIOE_OTYPER, GPIOE_BoundaryAddress + GPIOx_OTYPER_AddressOffset
// GPIO port H output type register
// Port H[31:4, 2] are reserved
.equ GPIOH_OTYPER, GPIOH_BoundaryAddress + GPIOx_OTYPER_AddressOffset

// 9.5.3 GPIO port output speed register (GPIOx_OSPEEDR)
// (x = A to E and H)
// Address offset: 0x08
.equ GPIOx_OSPEEDR_AddressOffset, 0x08
// Bits 31:0 OSPEED[15:0][1:0]: Port x configuration I/O pin y (y = 15 to 0)
// These bits are written by software to configure the I/O output speed.
// 00: Low speed
// 01: Medium speed
// 10: Fast speed
// 11: High speed
// Note: Refer to the device datasheet for the frequency specifications and the power supply 
// and load conditions for each speed
.equ OSPEED00, 0
.equ OSPEED01, 1
.equ OSPEED10, 2
.equ OSPEED11, 3
.equ OSPEED20, 4
.equ OSPEED21, 5
.equ OSPEED30, 6
.equ OSPEED31, 7
.equ OSPEED40, 8
.equ OSPEED41, 9
.equ OSPEED50, 10
.equ OSPEED51, 11
.equ OSPEED60, 12
.equ OSPEED61, 13
.equ OSPEED70, 14
.equ OSPEED71, 15
.equ OSPEED80, 16
.equ OSPEED81, 17
.equ OSPEED90, 18
.equ OSPEED91, 19
.equ OSPEED100, 20
.equ OSPEED101, 21
.equ OSPEED110, 22
.equ OSPEED111, 23
.equ OSPEED120, 24
.equ OSPEED121, 25
.equ OSPEED130, 26
.equ OSPEED131, 27
.equ OSPEED140, 28
.equ OSPEED141, 29
.equ OSPEED150, 30
.equ OSPEED151, 31
// GPIO port A output speed register
.equ GPIOA_OSPEEDR, GPIOA_BoundaryAddress + GPIOx_OSPEEDR_AddressOffset
.equ GPIOA_OSPEEDR_ResetValue,  0x0C000000
// GPIO port B output speed register
.equ GPIOB_OSPEEDR, GPIOB_BoundaryAddress + GPIOx_OSPEEDR_AddressOffset
.equ GPIOB_OSPEEDR_ResetValue,  0x000000C0
// GPIO port C output speed register
.equ GPIOC_OSPEEDR, GPIOC_BoundaryAddress + GPIOx_OSPEEDR_AddressOffset
.equ GPIOC_OSPEEDR_ResetValue,  0x00000000
// GPIO port D output speed register
.equ GPIOD_OSPEEDR, GPIOD_BoundaryAddress + GPIOx_OSPEEDR_AddressOffset
.equ GPIOD_OSPEEDR_ResetValue,  0x00000000
// GPIO port E output speed register
// Port E[31:10] are reserved
.equ GPIOE_OSPEEDR, GPIOE_BoundaryAddress + GPIOx_OSPEEDR_AddressOffset
.equ GPIOE_OSPEEDR_ResetValue,  0x00000000
// GPIO port H output speed register
// Port H[31:8, 5:4] are reserved
.equ GPIOH_OSPEEDR, GPIOH_BoundaryAddress + GPIOx_OSPEEDR_AddressOffset
.equ GPIOH_OSPEEDR_ResetValue,  0x00000000

// 9.5.4 GPIO port pull-up/pull-down register (GPIOx_PUPDR)
// (x = A to E and H)
// Address offset: 0x0C
.equ GPIOx_PUPDR_AddressOffset, 0x0C
// Bits 31:0 PUPD[15:0][1:0]: Port x configuration I/O pin y (y = 15 to 0)
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
// GPIO port A pull-up/pull-down register 
.equ GPIOA_PUPDR, GPIOA_BoundaryAddress + GPIOx_PUPDR_AddressOffset
.equ GPIOA_PUPDR_ResetValue, 0x64000000
// GPIO port B pull-up/pull-down register 
.equ GPIOB_PUPDR, GPIOB_BoundaryAddress + GPIOx_PUPDR_AddressOffset
.equ GPIOB_PUPDR_ResetValue, 0x00000100
// GPIO port C pull-up/pull-down register 
.equ GPIOC_PUPDR, GPIOC_BoundaryAddress + GPIOx_PUPDR_AddressOffset
.equ GPIOC_PUPDR_ResetValue, 0x00000000
// GPIO port D pull-up/pull-down register 
.equ GPIOD_PUPDR, GPIOD_BoundaryAddress + GPIOx_PUPDR_AddressOffset
.equ GPIOD_PUPDR_ResetValue, 0x00000000
// GPIO port E pull-up/pull-down register
// Port E[31:10] are reserved
.equ GPIOE_PUPDR, GPIOE_BoundaryAddress + GPIOx_PUPDR_AddressOffset
.equ GPIOE_PUPDR_ResetValue, 0x00000000
// GPIO port H pull-up/pull-down register
// Port H[31:8, 5:4] are reserved
.equ GPIOH_PUPDR, GPIOH_BoundaryAddress + GPIOx_PUPDR_AddressOffset
.equ GPIOH_PUPDR_ResetValue, 0x00000000

// 9.5.5 GPIO port input data register (GPIOx_IDR)
// (x = A to E and H)
// Address offset: 0x10
// Reset value: 0x0000 XXXX
.equ GPIOx_IDR_AddressOffset, 0x10
// Bits 31:16 Reserved, must be kept at reset value.
// Bits 15:0 ID[15:0]: Port x input data I/O pin y (y = 15 to 0)
// These bits are read-only. They contain the input value of the corresponding I/O port.
.equ ID0, 0
.equ ID1, 1
.equ ID2, 2
.equ ID3, 3
.equ ID4, 4
.equ ID5, 5
.equ ID6, 6
.equ ID7, 7
.equ ID8, 8
.equ ID9, 9
.equ ID10, 10
.equ ID11, 11
.equ ID12, 12
.equ ID13, 13
.equ ID14, 14
.equ ID15, 15
// GPIO port A input data register
.equ GPIOA_IDR, GPIOA_BoundaryAddress + GPIOx_IDR_AddressOffset
// GPIO port B input data register
.equ GPIOB_IDR, GPIOB_BoundaryAddress + GPIOx_IDR_AddressOffset
// GPIO port C input data register
.equ GPIOC_IDR, GPIOC_BoundaryAddress + GPIOx_IDR_AddressOffset
// GPIO port D input data register
.equ GPIOD_IDR, GPIOD_BoundaryAddress + GPIOx_IDR_AddressOffset
// GPIO port E input data register
// Port E[31:5] are reserved
.equ GPIOE_IDR, GPIOE_BoundaryAddress + GPIOx_IDR_AddressOffset
// GPIO port H input data register
// Port H[31:4, 2] are reserved
.equ GPIOH_IDR, GPIOH_BoundaryAddress + GPIOx_IDR_AddressOffset

// 9.5.6 GPIO port output data register (GPIOx_ODR)
// (x = A to E and H)
// Address offset: 0x14
// Reset value: 0x0000 0000
.equ GPIOx_ODR_AddressOffset, 0x14
.equ GPIOx_ODR_ResetValue, 0x00000000
// Bits 31:16 Reserved, must be kept at reset value.
// Bits 15:0 OD[15:0]: Port output data I/O pin y (y = 15 to 0)
// These bits can be read and written by software.
// Note: For atomic bit set/reset, OD bits can be individually set and/or reset by writing to GPIO 
// port bit set/reset register (GPIOx_BSRR) (x = A to E and H).
.equ OD0, 0
.equ OD1, 1
.equ OD2, 2
.equ OD3, 3
.equ OD4, 4
.equ OD5, 5
.equ OD6, 6
.equ OD7, 7
.equ OD8, 8
.equ OD9, 9
.equ OD10, 10
.equ OD11, 11
.equ OD12, 12
.equ OD13, 13
.equ OD14, 14
.equ OD15, 15
// GPIO port A output data register
.equ GPIOA_ODR, GPIOA_BoundaryAddress + GPIOx_ODR_AddressOffset
// GPIO port B output data register
.equ GPIOB_ODR, GPIOB_BoundaryAddress + GPIOx_ODR_AddressOffset
// GPIO port C output data register
.equ GPIOC_ODR, GPIOC_BoundaryAddress + GPIOx_ODR_AddressOffset
// GPIO port D output data register
.equ GPIOD_ODR, GPIOD_BoundaryAddress + GPIOx_ODR_AddressOffset
// GPIO port E output data register
// Port E[31:5] are reserved
.equ GPIOE_ODR, GPIOE_BoundaryAddress + GPIOx_ODR_AddressOffset
// GPIO port H output data register
// Port H[31:4, 2] are reserved
.equ GPIOH_ODR, GPIOH_BoundaryAddress + GPIOx_ODR_AddressOffset

// 9.5.7 GPIO port bit set/reset register (GPIOx_BSRR)
// (x = A to E and H)
// Address offset: 0x18
// Reset value: 0x0000 0000
// GPIO port B bit set/reset register 
.equ GPIOx_BSRR_AddressOffset, 0x18
.equ GPIOx_BSRR_ResetValue, 0x00000000
// Bits 15:0 BS[15:0]: Port x set I/O pin y (y = 15 to 0)
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
// Bits 31:16 BR[15:0]: Port x reset I/O pin y (y = 15 to 0)
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
// GPIO port A bit set/reset register
.equ GPIOA_BSRR, GPIOA_BoundaryAddress + GPIOx_BSRR_AddressOffset
// GPIO port B bit set/reset register
.equ GPIOB_BSRR, GPIOB_BoundaryAddress + GPIOx_BSRR_AddressOffset
// GPIO port C bit set/reset register
.equ GPIOC_BSRR, GPIOC_BoundaryAddress + GPIOx_BSRR_AddressOffset
// GPIO port D bit set/reset register
.equ GPIOD_BSRR, GPIOD_BoundaryAddress + GPIOx_BSRR_AddressOffset
// GPIO port E bit set/reset register
// Port E[31:21, 15:5] are reserved
.equ GPIOE_BSRR, GPIOE_BoundaryAddress + GPIOx_BSRR_AddressOffset
// GPIO port H bit set/reset register
// Port H[31:20, 18, 15:4, 2] are reserved
.equ GPIOH_BSRR, GPIOH_BoundaryAddress + GPIOx_BSRR_AddressOffset

// 9.5.8 GPIO port configuration lock register (GPIOx_LCKR)
// (x = A to E and H)
// This register is used to lock the configuration of the port bits when a correct write sequence 
// is applied to bit 16 (LCKK). The value of bits [15:0] is used to lock the configuration of the 
// GPIO. During the write sequence, the value of LCKR[15:0] must not change. When the 
// LOCK sequence has been applied on a port bit, the value of this port bit can no longer be 
// modified until the next MCU reset or peripheral reset.
// Note: A specific write sequence is used to write to the GPIOx_LCKR register. Only word access 
// (32-bit long) is allowed during this locking sequence.
// Each lock bit freezes a specific configuration register (control and alternate function 
// registers).
// Address offset: 0x1C
// Reset value: 0x0000 0000
.equ GPIOx_LCKR_AddressOffset, 0x1C
.equ GPIOx_LCKR_ResetValue, 0x00000000
// Bits 15:0 LCK[15:0]: Port x lock I/O pin y (y = 15 to 0)
// These bits are read/write but can only be written when the LCKK bit is ‘0.
// 0: Port configuration not locked
// 1: Port configuration locked
.equ LCK0, 0
.equ LCK1, 1
.equ LCK2, 2
.equ LCK3, 3
.equ LCK4, 4
.equ LCK5, 5
.equ LCK6, 6
.equ LCK7, 7
.equ LCK8, 8
.equ LCK9, 9
.equ LCK10, 10
.equ LCK11, 11
.equ LCK12, 12
.equ LCK13, 13
.equ LCK14, 14
.equ LCK15, 15
// Bit 16 LCKK: Lock key
// This bit can be read any time. It can only be modified using the lock key write sequence.
// 0: Port configuration lock key not active
// 1: Port configuration lock key active. The GPIOx_LCKR register is locked until the next MCU 
// reset or peripheral reset.
// LOCK key write sequence:
// WR LCKR[16] = ‘1’ + LCKR[15:0]
// WR LCKR[16] = ‘0’ + LCKR[15:0]
// WR LCKR[16] = ‘1’ + LCKR[15:0]
// RD LCKR
// RD LCKR[16] = ‘1’ (this read operation is optional but it confirms that the lock is active)
// Note: During the LOCK key write sequence, the value of LCK[15:0] must not change.
// Any error in the lock sequence aborts the lock.
// After the first lock sequence on any bit of the port, any read access on the LCKK bit 
// returns ‘1’ until the next MCU reset or peripheral reset.
.equ LCKK, 16
// Bits 31:17 Reserved, must be kept at reset value.
// GPIO port A configuration lock register
.equ GPIOA_LCKR, GPIOA_BoundaryAddress + GPIOx_LCKR_AddressOffset
// GPIO port B configuration lock register
.equ GPIOB_LCKR, GPIOB_BoundaryAddress + GPIOx_LCKR_AddressOffset
// GPIO port C configuration lock register
.equ GPIOC_LCKR, GPIOC_BoundaryAddress + GPIOx_LCKR_AddressOffset
// GPIO port D configuration lock register
.equ GPIOD_LCKR, GPIOD_BoundaryAddress + GPIOx_LCKR_AddressOffset
// GPIO port E configuration lock register
// Port E[31:17, 15:5] are reserved
.equ GPIOE_LCKR, GPIOE_BoundaryAddress + GPIOx_LCKR_AddressOffset
// GPIO port H configuration lock register
// Port H[31:17, 15:4, 2] are reserved
.equ GPIOH_LCKR, GPIOH_BoundaryAddress + GPIOx_LCKR_AddressOffset

// 9.5.9 GPIO alternate function low register (GPIOx_AFRL) 
// (x = A to E and H)
// Address offset: 0x20
// Reset value: 0x0000 0000
.equ GPIOx_AFRL_AddressOffset, 0x20
.equ GPIOx_AFRL_ResetValue, 0x00000000
// Bits 31:0 AFSEL[7:0][3:0]: Alternate function selection for port x I/O pin y (y = 7 to 0)
// These bits are written by software to configure alternate function I/Os.
// 0000: AF0
// 0001: AF1
// 0010: AF2
// 0011: AF3
// 0100: AF4
// 0101: AF5
// 0110: AF6
// 0111: AF7
// 1000: AF8
// 1001: AF9
// 1010: AF10
// 1011: AF11
// 1100: AF12
// 1101: AF13
// 1110: AF14
// 1111: AF15
.equ AFSEL00, 0
.equ AFSEL01, 1
.equ AFSEL02, 2
.equ AFSEL03, 3
.equ AFSEL10, 4
.equ AFSEL11, 5
.equ AFSEL12, 6
.equ AFSEL13, 7
.equ AFSEL20, 8
.equ AFSEL21, 9
.equ AFSEL22, 10
.equ AFSEL23, 11
.equ AFSEL30, 12
.equ AFSEL31, 13
.equ AFSEL32, 14
.equ AFSEL33, 15
.equ AFSEL40, 16
.equ AFSEL41, 17
.equ AFSEL42, 18
.equ AFSEL43, 19
.equ AFSEL50, 20
.equ AFSEL51, 21
.equ AFSEL52, 22
.equ AFSEL53, 23
.equ AFSEL60, 24
.equ AFSEL61, 25
.equ AFSEL62, 26
.equ AFSEL63, 27
.equ AFSEL70, 28
.equ AFSEL71, 29
.equ AFSEL72, 30
.equ AFSEL73, 31
// GPIO port A alternate function low register
.equ GPIOA_AFRL, GPIOA_BoundaryAddress + GPIOx_AFRL_AddressOffset
// GPIO port B alternate function low register
.equ GPIOB_AFRL, GPIOB_BoundaryAddress + GPIOx_AFRL_AddressOffset
// GPIO port C alternate function low register
.equ GPIOC_AFRL, GPIOC_BoundaryAddress + GPIOx_AFRL_AddressOffset
// GPIO port D alternate function low register
.equ GPIOD_AFRL, GPIOD_BoundaryAddress + GPIOx_AFRL_AddressOffset
// GPIO port E alternate function low register
// Port E[31:20] are reserved
.equ GPIOE_AFRL, GPIOE_BoundaryAddress + GPIOx_AFRL_AddressOffset
// GPIO port H alternate function low register
// Port H[31:16, 11:8] are reserved
.equ GPIOH_AFRL, GPIOH_BoundaryAddress + GPIOx_AFRL_AddressOffset

// 9.5.10 GPIO alternate function high register (GPIOx_AFRH)
// (x = A to E and H)
// Address offset: 0x24
// Reset value: 0x0000 0000
.equ GPIOx_AFRH_AddressOffset, 0x24
.equ GPIOx_AFRH_ResetValue, 0x00000000
// Bits 31:0 AFSEL[15:8][3:0]: Alternate function selection for port x I/O pin y (y = 15 to 8)
// These bits are written by software to configure alternate function I/Os.
// 0000: AF0
// 0001: AF1
// 0010: AF2
// 0011: AF3
// 0100: AF4
// 0101: AF5
// 0110: AF6
// 0111: AF7
// 1000: AF8
// 1001: AF9
// 1010: AF10
// 1011: AF11
// 1100: AF12
// 1101: AF13
// 1110: AF14
// 1111: AF15
.equ AFSEL80, 0
.equ AFSEL81, 1
.equ AFSEL82, 2
.equ AFSEL83, 3
.equ AFSEL90, 4
.equ AFSEL91, 5
.equ AFSEL92, 6
.equ AFSEL93, 7
.equ AFSEL100, 8
.equ AFSEL101, 9
.equ AFSEL102, 10
.equ AFSEL103, 11
.equ AFSEL110, 12
.equ AFSEL111, 13
.equ AFSEL112, 14
.equ AFSEL113, 15
.equ AFSEL120, 16
.equ AFSEL121, 17
.equ AFSEL122, 18
.equ AFSEL123, 19
.equ AFSEL130, 20
.equ AFSEL131, 21
.equ AFSEL132, 22
.equ AFSEL133, 23
.equ AFSEL140, 24
.equ AFSEL141, 25
.equ AFSEL142, 26
.equ AFSEL143, 27
.equ AFSEL150, 28
.equ AFSEL151, 29
.equ AFSEL152, 30
.equ AFSEL153, 31
// GPIO port A alternate function high register
.equ GPIOA_AFRH, GPIOA_BoundaryAddress + GPIOx_AFRH_AddressOffset
// GPIO port B alternate function high register
.equ GPIOB_AFRH, GPIOB_BoundaryAddress + GPIOx_AFRH_AddressOffset
// GPIO port C alternate function high register
.equ GPIOC_AFRH, GPIOC_BoundaryAddress + GPIOx_AFRH_AddressOffset
// GPIO port D alternate function high register
.equ GPIOD_AFRH, GPIOD_BoundaryAddress + GPIOx_AFRH_AddressOffset
// GPIO port E alternate function high register
// Port E[31:0] are reserved
.equ GPIOE_AFRH, GPIOE_BoundaryAddress + GPIOx_AFRH_AddressOffset
// GPIO port H alternate function high register
// Port H[31:0] are reserved
.equ GPIOH_AFRH, GPIOH_BoundaryAddress + GPIOx_AFRH_AddressOffset

// 9.5.11 GPIO port bit reset register (GPIOx_BRR) (x = A to E and H)
// Address offset: 0x28
// Reset value: 0x0000 0000
.equ GPIOx_BRR_BoundaryAddress, 0x28
.equ GPIOx_BRR_ResetValue, 0x00000000
// use BSRR instead!
// has conflicting BR definitions!

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

// 10.2.3 SYSCFG external interrupt configuration register 1
// (SYSCFG_EXTICR1)
// Address offset: 0x008
// Reset value: 0x0000 0000
.equ SYSCFG_EXTICR1_AddressOffset, 0x008
.equ SYSCFG_EXTICR1_ResetValue, 0x00000000
.equ SYSCFG_EXTICR1, SYSCFG_BoundaryAddress + SYSCFG_EXTICR1_AddressOffset
// Bits 31:15 Reserved, must be kept at reset value.
// Bits 14:12 EXTI3[2:0]: EXTI 3 configuration bits
// These bits are written by software to select the source input for the EXTI3
// external interrupt.
// 000: PA[3] pin
// 001: PB[3] pin
// 010: PC[3] pin (STM32WB55xx only)
// 011: PD[3] pin (STM32WB55xx only)
// 100: PE[3] pin (STM32WB55xx only)
// 101: Reserved
// 110: Reserved
// 111: PH[3] pin
.equ EXTI30, 12
.equ EXTI31, 13
.equ EXTI32, 14
// Bit 11 Reserved, must be kept at reset value.
// Bits 10:8 EXTI2[2:0]: EXTI 2 configuration bits
// These bits are written by software to select the source input for the EXTI2
// external interrupt.
// 000: PA[2] pin
// 001: PB[2] pin
// 010: PC[2] pin (STM32WB55xx only)
// 011: PD[2] pin (STM32WB55xx only)
// 100: PE[2] pin (STM32WB55xx only)
// 101: Reserved
// 110: Reserved
// 111: Reserved
.equ EXTI20, 8
.equ EXTI21, 9
.equ EXTI22, 10
// Bit 7 Reserved, must be kept at reset value.
// Bits 6:4 EXTI1[2:0]: EXTI 1 configuration bits
// These bits are written by software to select the source input for the EXTI1
// external interrupt.
// 000: PA[1] pin
// 001: PB[1] pin
// 010: PC[1] pin (STM32WB55xx only)
// 011: PD[1] pin (STM32WB55xx only)
// 100: PE[1] pin (STM32WB55xx only)
// 101: Reserved
// 110: Reserved
// 111: PH[1] pin (STM32WB55xx only)
.equ EXTI10, 4
.equ EXTI11, 5
.equ EXTI12, 6
// Bit 3 Reserved, must be kept at reset value.
// Bits 2:0 EXTI0[2:0]: EXTI 0 configuration bits
// These bits are written by software to select the source input for the EXTI0
// external interrupt.
// 000: PA[0] pin
// 001: PB[0] pin
// 010: PC[0] pin (STM32WB55xx only)
// 011: PD[0] pin (STM32WB55xx only)
// 100: PE[0] pin (STM32WB55xx only)
// 101: Reserved
// 110: Reserved
// 111: PH[0] pin (STM32WB55xx only)
// Note: Some of the I/O pins mentioned in this register may be not available on small packages.
.equ EXTI00, 0
.equ EXTI01, 1
.equ EXTI02, 2
