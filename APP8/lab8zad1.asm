segment .code

	text db "Jaka choinka wariacie:",0Ah,0Dh, "mala - 3",0Ah,0Dh, "srednia - 5",0Ah,0Dh, "duza - 7",0Ah,0Dh, "bardzo duza [OSTROZNIE] - 10",0Ah,0Dh, "$"
	
	outside_counter db 0
	inside_counter db 0

segment .bss

	num_of_lines resw 0

segment .text
	org 100h

	mov ah, 0	;change to 640x480 color text mode
	mov al, 12
	int 10h
	
	call print_msg

	mov AH, 0Ah		;
	mov DX, num_of_lines	;
	int 21h			;get height of choinka


	mov BL, [num_of_lines+2]	;
	sub BL, 30h			;convert string digit to int
	
	mov [outside_counter], BL

	mov AH, 02h  
	mov DL, 2Bh 
	mov DH, 08h	;set cursor position to the "middle" of the screen
	int 10h

	mov AH, 0Eh	;
	mov AL, "*"	;
	mov BH, 00h	;
	int 10h		;co to za choinka bez gwiazdki

	push word [outside_counter]
	push BP
	mov BP, SP
	pusha
	
	call build_choinka
	
	popa
	pop BP

	mov AH, 02h	;
	mov DL, 00h	;
	int 10h		;set cur to the left side of the screen

	mov AX, 4C00h	;
	int 21h		;end prog

	build_choinka:
		inc byte [BP+4]
		mov AH, [outside_counter]
		cmp [BP+4], AH
		jng move_cur
		ret

	move_cur:
		mov AH, 02h  
		mov DL, 2Ah 
		mov DH, 09h	;set cursor position to the "middle" of the screen
		
		mov BL, [BP+4]	;
		DEC BL		;
		sub DL, BL	;
		add DH, BL	;
		int 10h		;adjust cursor position
		
		call print_line
		jmp build_choinka

	print_line:
		pusha
		mov AL, [BP+4]	;
		mov BL, 02h	;
		mul BL		;
		INC AL		;2*i+1 of things to print
		mov CH, 00h
		mov CL, AL
		
		mov AH, 0AH
		mov AL, "#"
		mov BH, 00h
		int 10h
		
		popa
		ret
	
	print_msg:
		pusha
		mov AH, 09h
		mov DX, text
		int 21h
		popa
		ret
