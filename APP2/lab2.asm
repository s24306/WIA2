org 100h

mov ah, 02h	;
mov dl, 41h	;
int 21h		;Wydruk literki "A"

mov ax, 4C00h	;
int 21h		;koniec programu
