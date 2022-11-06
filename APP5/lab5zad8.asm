org 100h

add AX, [c]	;
mov bl, 2	;
mul bl		; mul c by 2 = 2c

mov dl, al	;
mov ax, [b]	;
div dl		;div b by 2c

mov cl, 02h	;
mul cl		; mul earlier by 2

mov cl, [a]	;
mul cl		; mul earlier by a

mov word [y], AX

mov AX, 4c00h
int 21h

a dw 0x05
b dw 0x0A
c dw 0x05
y dw 0x0
