org 100h

mov ah, 02h  
mov dl, 39 
mov dh, 12  ;set cursor position to the middle of the screen
int 10h

mov ah, 9
mov dx, dupa  ;print the value of dupa
int 21h

mov ah, 02h
mov dl, 0 
mov dh, 0
int 10h


mov ax, 0x4C00 	;
int 0x21		;koniec programu

dupa db "Hoffmeister Dawid", 0Ah,0Dh,"$"
