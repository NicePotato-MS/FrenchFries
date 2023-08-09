ENTRY(_start)

SECTIONS {
    . = 0x400000;        /* Origin of the program in memory */

    .text : {
        *(.text)
    }

    .data : {
        *(.data)
    }

    .bss : {
        *(.bss)
    }
}
