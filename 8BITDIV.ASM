;8 bit division
assume cs:code,ds:data
data segment
	opr1 dw 0099h
	opr2 db 11h
	quotient db 00H
	remainder db 00H
data ends
code segment
	org 0100h
start: mov ax,data
	mov ds,ax
	mov AX,opr1
	mov BL,opr2
	div BL
	mov quotient,AL
	mov remainder,AH
	mov ah,4ch
	int 21h
	code ends
end start
