org 100h

mov ah, 0Ah	;	
mov dx, dupa	;
int 21h	;allocate memory

mov ah, 0Eh	;
mov al, 0Ah	;
int 10h	;
mov al, 0Dh	;
int 10h	;add an empty line

mov bp, dupa		;
mov al, [dupa+1]	; get dupa length

mov ah, 00h		;
mov bh, 00h		;
mov bl, 02h		;
div bl			;div dupa len by 2

mov ah, 00h			;
mov bp, dupa			;
add bp, ax			;
mov byte [ES:BP+2], 24h	;insert $ character at dupa[len]

MOV AH,09h	;
MOV DX, dupa+2	;
int 21h	; print dupa

MOV AX, 4C00h	;
int 21h	;end prog

dupa db 16h  ;string
