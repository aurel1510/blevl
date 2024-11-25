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

// TODO
.equ RCC_AHB2ENR, RCC_BoundaryAddress + 0x4c
.equ GPIOBEN, 1

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

