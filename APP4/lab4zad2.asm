org 100h

mov bp, dupa		;
mov byte [bp+3], "$"	;insert $ character at dupa[3]

mov ah, 09h	;
mov dx, bp	;
int 21h	;print string until $

mov ax, 0x4C00 	;
int 0x21		;end prog

dupa db "GALAKTYKA KURVIX", 0h  ;string
