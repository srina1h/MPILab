assume cs:code,ds:data

data segment
	num1 db 99h
	num2 db	76h
    res	db	?
	res1 db ?
    carry db ?
data ends

code segment
	ORG 0100h
start:	
    MOV	ax, data	
	MOV	ds, ax
	MOV	al, num1
    MOV	bl, num2
	MOV	cl, 00h
	ADD	al, bl
	DAA			
	JNC	resume
	INC	cl
resume: 
	MOV bl, 10h
	MOV ah, 00h
	DIV bl
	;ROR ax, 8
	XCHG ah, al
    MOV	res, ah
	MOV res1, al
    MOV	carry, cl     
	MOV ah, 4ch
	INT 21h
code ends

end start
	