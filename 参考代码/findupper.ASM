DATAS SEGMENT
    STR DB 'a','b','c','D','e','f','g','F','h','i', '$'
DATAS ENDS

STACKS SEGMENT
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    
    MOV CX, 10
    XOR SI, SI 
    L:
    	MOV AL, DS:[STR+SI]
    	INC SI
    	CMP AL, 90
    	JGE NEXT
    	CMP AL, 65
    	JGE PRINT
    	NEXT:
    LOOP L
    	JMP EXIT
    	
    PRINT:
    	MOV DL, AL
    	MOV AH, 2
    	INT 21H
    	JMP NEXT
    	
    EXIT:
    	MOV AH,4CH
    	INT 21H
CODES ENDS
    END START
