DATAS SEGMENT
    string DB 'AbcdE3a79G'
    len DB 10
    a DB 'A'
    z DB 'Z'
    ;�˴��������ݶδ���
DATAS ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    MOV CX, 10
    MOV AX, 0
    MOV SI, 0
find_max:
	MOV AL, string[SI]
	CMP AL, a
	JB increment;���Ƚ��ַ�С��A��ASCII��ֵ����ת���±��ƶ����
	CMP AL, z
	JA increment;���Ƚ��ַ�����Z��ASCII��ֵ����ת���±��ƶ����
	MOV DL, AL;��������ַ��浽DL��
	MOV AH, 2
	INT 21H
	;JMP increment������������תҲ��ִ�е������𣬿����н���ǿ��Ե�
	
increment:
	ADD SI, 1
	LOOP find_max
    ;�˴��������δ���
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START


