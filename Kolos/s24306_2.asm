	org 100h
	
	mov AH, 00h	
	int 16h	;
	sub AL, 30h
	mov [counter], AL


	mov AH, 0x00	;
	mov AL, 12h	;
	int 10h		;set graphic mode 640x480 16 colors VGA
	
	mov AH, 0
	mov BL, 2
	div BL
	sub [screen_height], AL
	mov [begin], AL
	
	mov AH, 0Ch		;
	mov CX, [screen_width]		;
	mov DX, [screen_height]	
	mov AL, 2
	loop:		
		int 10h
		INC DX
		DEC byte [counter]
		cmp byte [counter], 0
		je end
		jmp loop

	
	end:
		mov AX, 4C00h	;
		int 21h		;end prog
		

counter db 2h
begin db 2h
num_of_lines db 2h
screen_width DW 320
screen_height DW 240
