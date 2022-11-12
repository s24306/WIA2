;a * b + c

org 100h

push word [a]
push word [b]
pop word AX
pop word BX
mul BX
push word AX
push word [c]
pop word AX
pop word BX
add AX, BX
mov word [y], AX

mov AX, 4C00h	;
int 21h	;end prog

a dw 0x0005
b dw 0x000A
c dw 0x0005
y dw 0x0000
