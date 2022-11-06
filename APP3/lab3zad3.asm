org 100h

mov ah, 00
int 16h		;Czekaj na klikniecie klawiatury

mov ax, 4C00h	;
int 21h		;koniec programu
