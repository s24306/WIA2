org 100h

mov AX, [a]	;
mov BL, [b]	;
mul BL		; mul a by b

add AX, [c]	;add c to a

mov word [y], AX ;result

mov AX, 4c00h	;
int 21h	;end prog

a dw 0x05
b dw 0x0A
c dw 0x05
y dw 0x0
