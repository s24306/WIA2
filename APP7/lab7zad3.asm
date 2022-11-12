;a/b+c

org 100h

push word [a]
push word [b]
pop word BX		;b
pop word AX		;a
div BL
push word AX		;a/b

push word [c]
pop word BX		;c
pop word AX		;a/b
add AX, BX

mov word [y], AX

mov AX, 4C00h	;
int 21h	;end prog

a dw 0x000A
b dw 0x0005
c dw 0x0005
y dw 0x0000
