org 100h

mov AX, [a]
add BL, 2h
div BL

mov CX, AX
mov AX, [b]
mov BL, 3h
div BL

add CX, AX

mov AX, [c]
mov BL, 4h
div BL

add AX, CX

mov word [y], AX

mov AX, 4c00h
int 21h

a dw 0x05
b dw 0x0A
c dw 0x05
y dw 0x0
