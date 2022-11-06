org 100h

mov ah, 02h  
mov dl, 39 
mov dh, 12  ;set cursor position to the middle of the screen
int 10h

mov ah, 0Ah	;	
mov dx, dupa	;
int 21h	;allocate memory

mov ah, 0Eh	;
mov al, 0Ah	;
int 10h	;
mov al, 0Dh	;
int 10h	;add an empty line

mov bp, dupa
mov al, [dupa+1]
mov ah, 00h
add bp, ax
mov byte [ES:BP+2], 24h	;insert $ character at dupa[len]

MOV AH,09h
MOV DX, dupa+2
int 21h	; print dupa

MOV AX, 4C00h
int 21h

dupa db 16h  ;string
