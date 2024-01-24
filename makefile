# makefile for nasm boot loader

all: boot.bin 
boot.bin: boot.asm
	nasm -f bin boot.asm -o boot.bin
test: boot.bin
	qemu-system-x86_64  -fda boot.bin
clean:
	rm -f boot.bin
