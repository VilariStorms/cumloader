bits 16   
org 0x7c00 

boot:
    ; clear the screen
    mov ax, 0x3
    int 0x10
    mov si, bubble 
    call print
    mov si, welcome
    call print
    mov si, bubble 
    call print
    mov si, bottom
    call print
    mov si, hello
    call print
.main:
    mov si, prompt
    call print
    call cumloader
    jmp .main

print:
    mov ah, 0x0e 
    mov bh, 0x00 
    mov bl, 0x07 
.loop:
    lodsb       
    cmp al, 0  
    je .donep 
    int 0x10 
    jmp .loop 
.donep:
    ret      

cumloader: 
    xor cl, cl
    mov di, buffer
.readloop: 
    mov ah, 0x00
    int 0x16
    cmp al, 0x0d
    je .done
    cmp cl, 63
    je .done
    ; ignore backspace
    cmp al, 0x08
    je .readloop
    ; echo the character
    mov ah, 0x0e
    mov bh, 0x00
    mov bl, 0x07
    int 0x10
    stosb
    inc cl
    jmp .readloop 
.done:
    mov ax, 0x3
    int 0x10
    mov si, bubble
    call print
    mov si, space
    call print
    mov si, buffer
    call print
    mov si, bubble
    call print
    mov si, bottom
    call print
    ; set buffer to 0 again
    xor cl, cl
    mov di, buffer
    mov si, buffer
    mov cx, 64
    rep stosb
    ret
bubble:
        db 0x0a, 0x0d, "~~o   ~~o     ~~o   ~~o     ~~o   ~~o      ~~o     ~~o   ~~o", 0x0a, 0x0d, 0
welcome:
    db "      CUMLOADER LESSGO CUMSAY IN YOUR BOOT SECTOR", 0
bottom:
    db "                ____     _/", 0x0a, 0x0d
    db "______     ___.'  o `.  /", 0x0a, 0x0d
    db "/~----,\___/,--.   ,_ |", 0x0a, 0x0d
    db "        `-----'   `---'", 0x0a, 0x0d, 0
hello:
    db "Type something and press enter to ejaculate it!", 0x0a, 0x0d, 0
space:
    db "                ", 0
new_line:
    db 0x0a, 0x0d, 0
prompt:
    db 0x0a, 0x0d, ">", 0
buffer times 64 db 0

times 510-($-$$) db 0 
dw 0xAA55 


