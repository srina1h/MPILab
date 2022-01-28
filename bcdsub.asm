assume cs:code,ds:data

data segment
    opr1 db 56h
    opr2 db 74h
    difference db 00h
    sign db 00h
data ends

code segment
    ORG 0100h
start:    
    MOV ax,data
    MOV ds,ax
    MOV al,opr1
    MOV bl,opr2
    MOV cl,00h
    SUB al,bl
    JNC here
    NEG al
    INC cl
here:    
    SUB al,00h
    DAS
    MOV difference,al
    MOV sign,cl
    MOV ah,4ch
    INT 21h
code ends

end start