org 100h

add AX, [a]
add BL, [b]
add BL, [c]
DIV BL
mov word [y], AX

mov AX, 4c00h
int 21h

a dw 0x05
b dw 0x0A
c dw 0x05
y dw 0x0
