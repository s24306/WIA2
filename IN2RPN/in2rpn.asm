org 100h

mov BX, SP	;remember the address of empty stack

mov AH, 0Ah  	;
mov DX, equation;
int 21h	;get equation from user

mov ah, 0Eh	;
mov al, 0Ah	;
int 10h	;
mov al, 0Dh	;
int 10h	;line break

mov CL, 2h		;iterator - CL starts at 2 - first char
mov CH, [equation+1]	;get len of equation

create_rpn:
	mov AL, CL	;check if iterator exceeds len
	sub AL, 2h	;if does - end program
	cmp AL, CH	;
	JGE emptyStack
	JGE end	;

	mov BP, equation	;get address of equation
	mov AX, 00h		;
	mov AL, CL		;
	add BP, AX		;get address of char[iterator]

	cmp [BP], 30h	;check if digit
		;
	jb notDigit	;

	cmp [BP], 39h	;check if the user is a student
		;
	jg possibleOperator;

	mov AH, 02h	;
	mov DL, [BP]	;
	int 21h	;print char

	inc CL
	jmp create_rpn

emptyStack:
cmp SP, BX	;check if stack empty
JE end		; if empty end the prog
pop DL		;if not empty pop the el and print to output
int 21h	;
jmp emptyStack	;

possibleOperator:
	cmp [BP], 5Eh ;check if operator is "^"
	JNE error
	
	push, 5Eh

notDigit:
	cmp [BP], 27h
	jb error


error:
	;TODO error msg
	jmp end

end:
	MOV AX, 4C00h	;
	int 21h	;exit prog

equation db 16h
