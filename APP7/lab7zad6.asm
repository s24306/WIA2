;a^2+2b+c

org 100h

call do_power		;a^2

call do_mul		;2*b

call do_add		;a^2+2*b
		
call do_add2		;a^2+2*b+c		

mov AX, [a]
mov word [y], AX

mov AX, 4C00h	;
int 21h	;end prog

do_mul:
pusha
push 0x0002
push word [b]
pop word BX		
pop word AX		
mul BL
mov [b], AX
popa
ret

do_add:
pusha	
mov AX, [b]	
add [a], AX
popa
ret

do_add2:
pusha	
mov AX, [c]	
add [a], word AX
popa
ret

do_power:
pusha
push word [a]
push 0x0002
pop word BX		
pop word AX
mov CL, 0	;loop counter
call loop_over
mov [a], word AX
popa
ret

loop_over:
mov CH, BL	;number of loops to make, if the power
		; is 1, then obviously no loops to make
sub CH, 0x0001	;
cmp CL, CH
JNE dupa
ret

dupa:
mul AX
add CL, 0x0001
jmp loop_over

a dw 0x000A
b dw 0x0005
c dw 0x0005
y dw 0x0000
