org 100h

add AX, [a]
add BL, [b]
DIV BL
add AL, [c]
mov word [y], AX

mov AX, 4c00h
int 21h

a dw 0x05
b dw 0x05
c dw 0x0A
y dw 0x0
