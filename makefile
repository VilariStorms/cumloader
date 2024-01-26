# makefile for nasm boot loader

all: boot.bin floppy
boot.bin: boot.asm
	nasm -f bin boot.asm -o boot.bin
floppy: boot.bin
	dd if=/dev/zero of=floppy.img bs=1024 count=1440
	dd if=boot.bin of=floppy.img seek=0 count=1 conv=notrunc
test: boot.bin
	qemu-system-x86_64  -fda boot.bin
clean:
	rm -f boot.bin
	rm -f floppy.img


