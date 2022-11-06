org     100h               ; Program typu COM - na poczatek


	mov dx, tekst      ; teraz zapisujemy adres etykiety tekst do rejestru DX
	mov ah, 9          ; ustawiamy AH (czyli bardziej znaczacy bajt rejestru AX)
	int 0x21           ; wywolujemy przerwanie 21h - przerwanie dosowe - 

	mov ax, 0x4C00     ; dosowi mowimy ze juz konczymy
	int 0x21           ; i wywolanie przerwania w zwiazku z tym

tekst db "Witaj okrutny swiecie!",0Ah,0Dh,"$"    ; to jest napis do pokazania

