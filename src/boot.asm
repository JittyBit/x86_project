%define lnstr(str) db str, 0x0D, 0x0A, 0
%define string(str) db str, 0

ORG 0x7C00
BITS 16

xor ax, ax 
mov cs, ax 
mov ds, ax
mov es, ax 

mov si, helo
call print
call print

hlt
jmp $

print:
	push si
.loop:
	mov al, [si]
	cmp al, 0
	jz .end 
	mov ah, 0x0e
	int 0x10
	inc si
	jmp .loop
.end:
	pop si
	ret

helo: lnstr("Hello World!") 

times 510-($-$$) db 0
dw 0x0AA55

