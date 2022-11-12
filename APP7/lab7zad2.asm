;2a + 2b - 2c

org 100h

push word [a]
push word 0x0002
pop word AX		;2
pop word BX		;a
mul BX
push word AX		;2a

;stack - 2a

push word [b]
push word 0x0002
pop word AX		;2
pop word BX		;b
mul BX
push word AX		;2b

;stack - 2b 2a

pop word AX	;2b
pop word BX	;2a
add AX, BX	;2a+2b
push AX
push word [c]
push 0x0002

;stack - 2 c 2a+2b

pop word AX		;2
pop word BX		;c
mul BX
push word AX		;2c

;stack - 2c 2a+2b

pop word AX		;2c
pop word BX		;2a+2b
sub BX, AX

mov word [y], BX

mov AX, 4C00h	;
int 21h	;end prog

a dw 0x0005
b dw 0x000A
c dw 0x0005
y dw 0x0000
