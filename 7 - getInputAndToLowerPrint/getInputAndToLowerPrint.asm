DATAS SEGMENT
    string DB 10 DUP(?)
    a DB 'A'
    z DB 'Z'
    s DB 'a' - 'A'
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
    
    ;数据清零及初始化
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
	;数据清零及初始化
	MOV CX, 10
	MOV SI, 0
	MOV AX, 0

to_lower:
	MOV AL, string[SI]
	CMP AL, a
	JB increment;待转换字符小于A的ASCII码值，跳转到下标移动语句
	CMP AL, z
	JA increment;待转换字符大于Z的ASCII码值，跳转到下标移动语句
	ADD AL, s;待转换字符是大写字母，则将其加上'a'和'A'的ASCII码值的差值转换成小写字母
	MOV DL, AL;将待输出字符存到DL中
	MOV AH, 2
	INT 21H
	
increment:
	ADD SI, 1
LOOP to_lower
	
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START

