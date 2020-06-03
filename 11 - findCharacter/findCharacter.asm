DATAS SEGMENT
    numCount DB 0
    alphaCount DB 0
    otherCount DB 0
    string DB 'AbcdE3a79G,.'
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    MOV CX, 12
    MOV AX, 0
    MOV SI, 0
find_character:
	MOV AL, string[SI]
	CMP AL, '0'
	JB other;小于0，跳转到其他字符统计
	CMP AL, 58;9的ASCII码值加1
	JB num;小于等于9，跳转到数字统计块
	CMP AL, 'A'
	JB other;小于A，跳转到其他字符统计
	CMP AL, 91;Z的ASCII码值加1
	JB alpha;小于等于Z，跳转到字母统计块
	CMP AL, 'a'
	JB other;小于a，跳转到其他字符统计
	CMP AL, 123;z的ASCII码值加1
	JB alpha;小于等于z，跳转到字母统计块
other:
	INC otherCount
	JMP increment
num:
	INC numCount
	JMP increment
alpha:
	INC alphaCount
	JMP increment
increment:
	ADD SI, 1
LOOP find_character
	MOV AX, 0
	MOV BX, 0
	MOV AL, otherCount
	MOV AH, numCount
	MOV BL, alphaCount
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

