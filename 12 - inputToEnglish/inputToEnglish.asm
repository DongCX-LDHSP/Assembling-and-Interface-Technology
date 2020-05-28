DATAS SEGMENT
    jan DB 'January '
    feb DB 'February'
    mar DB 'March   '
    pass DB 'Pass    '
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

    MOV CX, 8
    MOV AX, 0
    MOV SI, 0
get_input:
	MOV AH, 01H
	INT 21H
	CMP AL, '1'
	JZ output1
	CMP AL, '2'
	JZ output2
	CMP AL, '3'
	JZ output3
passoutput:
	MOV AL, pass[SI]
	MOV DL, AL
	MOV AH, 2
	INT 21H
	INC SI
	LOOP passoutput
	JMP endpro
output1:
	MOV AL, jan[SI]
	MOV DL, AL
	MOV AH, 2
	INT 21H
	INC SI
	LOOP output1
	JMP endpro
output2:
	MOV AL, feb[SI]
	MOV DL, AL
	MOV AH, 2
	INT 21H
	INC SI
	LOOP output2
	JMP endpro
output3:
	MOV AL, mar[SI]
	MOV DL, AL
	MOV AH, 2
	INT 21H
	INC SI
	LOOP output3
	JMP endpro
endpro:	
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

