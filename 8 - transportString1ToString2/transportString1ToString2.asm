DATAS SEGMENT
    string1 DB 'AbcdE3a79G'
    string2 DB 10 DUP(?)
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
    
;output1:
;	MOV AL, string1[SI]
;	MOV DL, AL
;	MOV AX, 2
;	INT 21H
;	ADD SI, 1
;	LOOP output1

;	�������㼰��ʼ��
;	MOV CX, 10
;	MOV AX, 0
;   MOV SI, 0

copy:
	MOV AL, string1[SI]
	MOV string2[SI], AL
	ADD SI, 1
	LOOP copy
	
;	XOR AX, AX
;	MOV DL, 10;���з���ASCII��ֵ��10
;	MOV AX, 2
;	INT 21H
	;�������㼰��ʼ��
;   MOV CX, 10
;   MOV AX, 0
;   MOV SI, 0

;output2:
;	MOV AL, string2[SI]
;	MOV DL, AL
;	MOV AX, 2
;	INT 21H
;	ADD SI, 1
;	LOOP output2
	
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

