DATAS SEGMENT
    ;此处输入数据段代码  
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    
INIT:
	MOV AL, 80H
	MOV DX, 0646H
	OUT DX, AL
	
	;将AX的值初始化为：0000,1000,0001,0000
	MOV BH, 8H
	MOV BL, 10H
circle:
	;将低八位的值送入PA口
	MOV DX, 640H
	OUT DX, BL
	ROR BL, 2;循环右移AX低八位形成向右分散移动的效果，步长为2
	;将AX高八位的值送入PB口
	MOV DX, 642H
	OUT DX, AH
	ROL AH, 2;循环左移AX高八位形成向左分散移动的效果，步长为2
JMP circle
    
    ;此处输入代码段代码
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

