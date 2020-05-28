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
    array DW 10, 4, 10H, 0
    MOV CX, 4
    MOV AX, 0
    MOV SI, 0
	array_add:
	    ADD AX, array[SI]
	    ADD SI, 2
    LOOP array_add;此处输入代码段代码
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

