DATAS SEGMENT
    string DB 'AbcdE3a79G'
    len DB 10
    a DB 'A'
    z DB 'Z'
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
    MOV CX, 10
    MOV AX, 0
    MOV SI, 0
find_max:
	MOV AL, string[SI]
	CMP AL, a
	JB increment;待比较字符小于A的ASCII码值，跳转到下标移动语句
	CMP AL, z
	JA increment;待比较字符大于Z的ASCII码值，跳转到下标移动语句
	MOV DL, AL;将待输出字符存到DL中
	MOV AH, 2
	INT 21H
	;JMP increment，这块儿不用跳转也会执行到后面吗，看运行结果是可以的
	
increment:
	ADD SI, 1
	LOOP find_max
    ;此处输入代码段代码
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START


