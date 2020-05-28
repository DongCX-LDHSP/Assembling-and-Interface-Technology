datarea SEGMENT
    number dw 10, 9, 23, 4
    adr dw number
    count dw 0;此处输入数据段代码  
datarea ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
program segment
	ASSUME SS:STACKS
    MOV AX,DATAS
    MOV DS,AX
main proc far
    ASSUME CS:CODES, DS:datarea
START:
;设定返回堆栈
	push DS
	sub ax, ax
	push ax
;设置段寄存器
	mov ax, datarea
	mov ds, ax
;这里是编写的主程序
	mov cx, 0
	mov bx, adr
	mov ax, [bx]
    ;此处输入代码段代码
    MOV AH,4CH
    INT 21H
program ENDS
CODES ENDS
    END START

