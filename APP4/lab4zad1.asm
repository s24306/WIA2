org 100h

mov ah, 0Ah	;	
mov dx, dupa	;
int 21h	;allocate memory

mov ah, 0Eh	;
mov al, 0Ah	;
int 10h	;
mov al, 0Dh	;
int 10h	;add an empty line

mov ah, 0eh	;
mov al, [dupa+4];
int 10h	;print char at the memory address dupa+4

mov ax, 0x4C00 	;
int 0x21		;koniec programu

dupa db 16h  ;string
