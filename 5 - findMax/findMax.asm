datarea SEGMENT
    number dw 10, 9, 23, 4
    adr dw number
    count dw 0;�˴��������ݶδ���  
datarea ENDS

STACKS SEGMENT
    ;�˴������ջ�δ���
STACKS ENDS

CODES SEGMENT
program segment
	ASSUME SS:STACKS
    MOV AX,DATAS
    MOV DS,AX
main proc far
    ASSUME CS:CODES, DS:datarea
START:
;�趨���ض�ջ
	push DS
	sub ax, ax
	push ax
;���öμĴ���
	mov ax, datarea
	mov ds, ax
;�����Ǳ�д��������
	mov cx, 0
	mov bx, adr
	mov ax, [bx]
    ;�˴��������δ���
    MOV AH,4CH
    INT 21H
program ENDS
CODES ENDS
    END START

