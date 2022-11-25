;2a*(b/2c)
;2 a * b 2 c * / *

org 100h

push 0x002	;
push word [a]	;
pop AX		;
pop BX		;
mul BL		;2*a
push AX

push word [b]	;
push 0x002	;
push word [c]	;
pop AX		;
pop BX		;
mul BL		;2*c
push AX

pop BX		;
pop AX		;
div BL		;b/2*c
push AX

pop BX		;
pop AX		;
mul BL		;2*a*(b/2*c)

mov word [y], AX

mov AX, 4C00h	;
int 21h		;end prog

a dw 0x0005
b dw 0x000A
c dw 0x0005
y dw 0x0000
