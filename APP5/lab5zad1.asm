org 100h

add AX, [a]
add AX, [b]
add AX, [c]
mov word [y], AX

mov AX, 4c00h
int 21h

a dw 0x05
b dw 0x3B
c dw 0x4C
y dw 0x0
