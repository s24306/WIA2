org 100h

mov AX, [a]
add AX, [b]
mov BL, [a]
mul BL
mov BL, [c]
div BL

mov word [y], AX

mov AX, 4c00h
int 21h

a dw 0x05
b dw 0x0A
c dw 0x05
y dw 0x0
