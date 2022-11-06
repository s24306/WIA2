org 100h

mov AH, 00h  	;
int 16h	;get key from the user

cmp AL, 40h	;check if key is smaller than "A"

JLE error

cmp AL, 7Ah	;check if key is bigger than "z"

JG error

cmp AL, 5Ah	;check if key is bigger than "Z"
		;if not then key is between
JG notBig	;"A" and "Z" - no need to jump

mov AH, 09h	;
mov DX, wielka	;
int 21h	;
jmp end	;key is a big letter

notBig:	;
cmp AL, 61h	;check if key is bigger or equal to "a"
JGE small	;if not then it's between "Z" and "a"
jmp error	;so not a letter

small:
mov AH, 09h	;
mov DX, mala	;
int 21h	;
jmp end	;key is a small letter

error:
mov AH, 09h	;
mov DX, errormsg;
int 21h	;
jmp end	;user is a university student

end:
MOV AX, 4C00h	;
int 21h	;exit prog

wielka db 'wielka litera$', 0Ah
mala db 'mala litera$', 0Ah
errormsg db 'error$', 0Ah
