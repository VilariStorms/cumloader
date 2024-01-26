# Cumloader

Cum in your bootloader! 

<img src="https://cdn.discordapp.com/attachments/1146950003647074404/1200386866730520607/image.png" width="400">

# Running 
Can be run in an emulator such as qemu or bochs or can be written to a floppy disk and booted on real hardware if you really want. You can also test it without downloading an emulator by booting the floopy img in the wasm x86 emulator on [copy.sh/v86](https://copy.sh/v86)!


## Building
Requires `nasm` to assemble the bootloader. Qemu is required to run the bootloader for testing and dd is required to create the floppy image.

Run `make` to build the bootloader as well as the floppy image that can be used to boot it.
Run `make test` to run the bootloader in qemu.


