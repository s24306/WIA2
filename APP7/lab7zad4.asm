;a/(b+c)

org 100h

push word [a]
push word [b]
push word [c]
pop word BX		;c
pop word AX		;b
add AX, BX
push word AX		;b+c

pop word BX		;b+c
pop word AX		;a
div BL

mov word [y], AX

mov AX, 4C00h	;
int 21h	;end prog

a dw 0x000A
b dw 0x0005
c dw 0x0005
y dw 0x0000
