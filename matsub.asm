assume cs:code,ds:data

data segment
	row1 db 02h
	row2 db 02h
	col1 db 04h
	col2 db 04h
	org 0010h
	matrix1 db 94h, 88h, 73h, 87h, 80h, 94h, 89h, 85h
	org 0020h
	matrix2 db 83h, 75h, 96h, 37h, 23h, 52h, 75h, 76h
	org 0030h
	result dw ?
data ends

code segment
	ORG 0100h
start:  
	MOV ax,data
	MOV ds,ax
	MOV cl,row1
	MOV dl,row2
	CMP cl,dl
	JNE last
	MOV cl,col1
	MOV dl,col2
	CMP cl,dl
	JNE last
	MOV al,row2
	MUL cl	
	MOV cx,ax
	MOV si, offset matrix1
	MOV di, offset matrix2
	MOV bx, offset result
here:	
	MOV ah,00h
	MOV al, [si]
	sub al, [di]
    JNC here1
	NEG al
	INC ah
here1:	
	MOV [bx], ax
	INC si
	INC di
	INC bx
    INC bx
	loop here
last:	
	MOV ah,4ch
	INT 21h
code ends

end start