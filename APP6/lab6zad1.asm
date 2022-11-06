org 100h

mov AH, 00h  	;
int 16h	;get key from the user

cmp AL, 5Fh

JE equal
JG greater

mov AH, 02h	;
mov DL, 3Ch	;
int 21h	;
jmp end	; key less than 5Fh, print "<"

equal:
mov AH, 09h	;
mov DX, string	;
int 21h	;
jmp end	;print "=="

greater:
mov AH, 02h	;
mov DL, 3Eh	;
int 21h	;
jmp end	;print ">"

end:
MOV AX, 4C00h	;
int 21h	;exit prog

string db '==$', 0Ah
