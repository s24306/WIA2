org 100h

mov AH, 00h  	;
int 16h	;get key from the user

cmp AL, 40h	;check if key is smaller than "A"

JLE print

cmp AL, 7Ah	;check if key is bigger than "z"

JG print

cmp AL, 5Ah	;check if key is bigger than "Z"
		;if not then key is between
JG notBig	;"A" and "Z" - no need to jump
	
add AL, 05h	
jmp print	

notBig:	;
cmp AL, 61h	;check if key is bigger or equal to "a"
JGE small	;if not then it's between "Z" and "a"
jmp print	;so not a letter

small:	
sub AL, 05h
jmp print


print:
mov AH, 02h	
mov DL, AL
int 21h	

end:
MOV AX, 4C00h	;
int 21h	;exit prog


