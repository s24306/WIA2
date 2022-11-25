org 100h

loop:
mov AH, 00h  	;
int 16h	;get key from the user

cmp AL, 51h	;check if key is "Q"
JE end		;

mov AH, 02h	;
mov DL, AL	;
int 21h	;print user input

mov DL, 0Ah	;
int 21h	;newline

jmp loop

end:
MOV AX, 4C00h	;
int 21h	;exit prog
