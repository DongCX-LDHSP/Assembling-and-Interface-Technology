DATAS SEGMENT
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
    
INIT:
	MOV AL, 80H
	MOV DX, 0646H
	OUT DX, AL
	
	;��AX��ֵ��ʼ��Ϊ��0000,1000,0001,0000
	MOV BH, 8H
	MOV BL, 10H
circle:
	;���Ͱ�λ��ֵ����PA��
	MOV DX, 640H
	OUT DX, BL
	ROR BL, 2;ѭ������AX�Ͱ�λ�γ����ҷ�ɢ�ƶ���Ч��������Ϊ2
	;��AX�߰�λ��ֵ����PB��
	MOV DX, 642H
	OUT DX, AH
	ROL AH, 2;ѭ������AX�߰�λ�γ������ɢ�ƶ���Ч��������Ϊ2
JMP circle
    
    ;�˴��������δ���
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

