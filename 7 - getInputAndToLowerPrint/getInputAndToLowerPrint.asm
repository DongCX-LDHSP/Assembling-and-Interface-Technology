DATAS SEGMENT
    string DB 10 DUP(?)
    a DB 'A'
    z DB 'Z'
    s DB 'a' - 'A'
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
    
    ;�������㼰��ʼ��
    MOV CX, 10
    MOV AX, 0
    MOV SI, 0

get_input:
	MOV AH, 1
	INT 21H
	MOV string[SI], AL
	ADD SI, 1
LOOP get_input
	
	MOV AL, 10
	MOV DL, 10
	MOV AH, 2
	INT 21H
	;�������㼰��ʼ��
	MOV CX, 10
	MOV SI, 0
	MOV AX, 0

to_lower:
	MOV AL, string[SI]
	CMP AL, a
	JB increment;��ת���ַ�С��A��ASCII��ֵ����ת���±��ƶ����
	CMP AL, z
	JA increment;��ת���ַ�����Z��ASCII��ֵ����ת���±��ƶ����
	ADD AL, s;��ת���ַ��Ǵ�д��ĸ���������'a'��'A'��ASCII��ֵ�Ĳ�ֵת����Сд��ĸ
	MOV DL, AL;��������ַ��浽DL��
	MOV AH, 2
	INT 21H
	
increment:
	ADD SI, 1
LOOP to_lower
	
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

