DATAS SEGMENT
    strA DB 'hello'
    strB DB 'hlllo';�˴��������ݶδ���  
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    MOV AX, 0
    MOV CX, 5
    MOV SI, 0
	COMPARE:
		MOV AL, strA[SI]
    	CMP AL, strB[SI]
    	ADD SI, 1
    LOOP COMPARE
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START






