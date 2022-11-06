org 100h

mov ah, 3Ah
mov dx, dupa

int 21h

mov AX, 0x4C00
int 21h

dupa db "DH06", 0h
