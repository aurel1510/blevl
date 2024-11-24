/*
 * stu32wb55rgvx.ld
 */

MEMORY {
    FLASH (rx): ORIGIN = 0x8000000, LENGTH = 512K
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

