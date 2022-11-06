org 100h

mov AX, [a]	;
mov CL, 2h	;
mul CL		;mul a by 2

mov BX, AX	;
mov AX, [b]	;
mul CL		;mul b by 2

add BX, AX	;
mov AX, [c]	;
mul CL		;add b to a and mul c by 2

sub BX, AX	;sub c from a+b

mov word [y], BX ;result

mov AX, 4c00h	;
int 21h	;end prog

a dw 0x05
b dw 0x0A
c dw 0x05
y dw 0x0
