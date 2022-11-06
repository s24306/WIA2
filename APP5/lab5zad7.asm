org 100h

mov AX, [a]
mov BL, [a]
mul BL
mov CX, AX
mov AX, [b]
mov BL, 2h
mul BL
add AX, CX
add AX, [c]

mov word [y], AX

mov AX, 4c00h
int 21h

a dw 0x05
b dw 0x0A
c dw 0x05
y dw 0x0
