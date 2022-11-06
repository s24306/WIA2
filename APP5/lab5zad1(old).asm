org 100h

mov ah, 00h 	;
int 16h	;get keystroke

add al, 10h	;increase char by 10 in ascii
mov ah, 02h	;
mov dl, al	;
int 21h	;print char


MOV AX, 4C00h	;
int 21h	;end prog

dupa db 16h  ;string
