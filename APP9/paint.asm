segment .data
	cur_cur_colour dw 8000h	;black
	cur_bg_colour  dw 000Fh	;white

segment .text
	org 100h
	
	mov AH, 0x00	;
	mov AL, 12h	;
	int 10h		;set graphic mode 640x480 16 colors VGA
	
	mov AL, [cur_bg_colour]
	call clear_screen
	call cur_colour

	jmp while
	
	endwhile:
	
		call hide_cursor
		
		mov AL, 03h	;
		int 10h		;set default text mode
		
		mov AX, 4C00h	;
		int 21h		;end prog
	
	while:
		mov AX, 0003h
		int 33h
		cmp BL, 00000001b	;check if left button is pressed (bit 0)
		je write_pixel
		call show_cursor
		jmp check_keyboard
	
	clear_screen:
		mov AH, 0Ch		;
		mov CX, 0x0000		;
		mov DX, 0x0000		;change all the pixels on the screen
		clean_loop:		;to the chosen colour - white on startup
			int 10h
			INC CX
			cmp CX, 640
			jnz clean_loop
			mov CX, 0x0000
			INC DX
			cmp DX, 480
			jnz clean_loop
			ret
			
	write_pixel:
		call hide_cursor
		mov AX, [cur_cur_colour]
		mov AH, 0Ch
		int 10h
		jmp while
		
	check_keyboard:
		mov AH, 0x01	;
		int 16h		;
		jz while	;check for keystroke - if not - loop
		
		mov AH, 0x00
		int 16h
		cmp AL, "q" 
		je endwhile
		cmp AH, 0x48	;up arrow
		je color_up
		cmp AH, 0x50	;down arrow
		je color_down
		cmp AL, "c"
		je change_background_colour
		cmp AL, "r"
		mov AL, 0x0F
		call clear_screen
		call cur_colour
		jmp while
		
	show_cursor:
		mov AX, 0x0001
		int 33h	
		ret
	
	hide_cursor:
		mov AX, 0x0002
		int 33h	
		ret
	
	color_up:
		INC word [cur_cur_colour]
		call cur_colour
		jmp while
		
	color_down:
		DEC word [cur_cur_colour]
		call cur_colour
		jmp while
	
	cur_colour:
		mov AX, [cur_cur_colour]
		mov AH, 0Ch			;
		mov CX, 628			;
		mov DX, 8			;show current chosen colour
		colour_loop:			;for drawing at 628-638x8-18
			int 10h
			INC CX
			cmp CX, 638
			jnz colour_loop
			mov CX, 628
			INC DX
			cmp DX, 18
			jnz colour_loop
			ret
	
	change_background_colour:
		INC word [cur_bg_colour]
		call hide_cursor
		mov AL, [cur_bg_colour]
		call clear_screen
		call cur_colour
		jmp while
