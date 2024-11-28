/*
 * stu32wb55rgvx.ld
 *
 * - Contains the linker script for
 * STM32WB55RG MCU.
 */

MEMORY {
    FLASH (rx): ORIGIN = 0x8000000, LENGTH = 1M
    SRAM (rw): ORIGIN = 0x20000000, LENGTH = 256K
}

SECTIONS {
    .VectorTable : {
        *(.VectorTable)
    } >FLASH

    .text : {
        *(.text)
    } >FLASH

    .data (NOLOAD) : {
        . = . + 0x30000;
        _StackEnd = .;
        *(.data)
    } >SRAM
}

