DATAS SEGMENT
    numCount DB 0
    alphaCount DB 0
    otherCount DB 0
    string DB 'AbcdE3a79G,.'
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
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
	JB other;С��0����ת�������ַ�ͳ��
	CMP AL, 58;9��ASCII��ֵ��1
	JB num;С�ڵ���9����ת������ͳ�ƿ�
	CMP AL, 'A'
	JB other;С��A����ת�������ַ�ͳ��
	CMP AL, 91;Z��ASCII��ֵ��1
	JB alpha;С�ڵ���Z����ת����ĸͳ�ƿ�
	CMP AL, 'a'
	JB other;С��a����ת�������ַ�ͳ��
	CMP AL, 123;z��ASCII��ֵ��1
	JB alpha;С�ڵ���z����ת����ĸͳ�ƿ�
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

