;8 bit multiplication
assume cs:code,ds:data
data segment
	opr1 db 11h
	opr2 db 99h
	result dw 0000H
data ends
code segment
	org 0100h
start: mov ax,data
	mov ds,ax
	mov AL,opr1
	mov BL,opr2
	mul bl
	mov result,ax
	mov ah,4ch
	int 21h
	code ends
end start
