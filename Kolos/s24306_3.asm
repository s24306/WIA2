org 100h

mov ah, 0Ah	;	
mov dx, dupa	;
int 21h	;get buffered input

mov ah, 0Eh	;
mov al, 0Ah	;
int 10h		;
mov al, 0Dh	;
int 10h		;break line

mov bp, dupa
mov al, [dupa+1]
mov ah, 00h
mov bl, 2
div bl
jmp check_for_odd

back:
mov ah, 0
add bp, ax
mov byte [ES:BP+2], 24h	;insert $ character at dupa[len]

MOV AH,09h
MOV DX, dupa+2
int 21h	; print dupa

MOV AX, 4C00h
int 21h

check_for_odd:
	cmp ah, 0h
	je back
	call odd
	jmp back

odd:
	inc al
	ret

dupa db 50h  ;string
