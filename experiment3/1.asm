SSTACK SEGMENT STACK   
	DW 64 DUP(?) 
SSTACK ENDS 
 
CODE SEGMENT   
ASSUME CS:CODE 
 
START: MOV AX, 0000H   
	MOV DS, AX   
	MOV SI, 3000H  ; 数据区首址
	MOV CX, 0008H   
	CALL BRANCH   ; 调用子程序 
HERE: JMP HERE 
;====================================================== 
; 子程序，出口参数在AX中 
;====================================================== 
BRANCH PROC NEAR   
	JCXZ A4   
	PUSH SI   
	PUSH CX   
	PUSH BX   
	MOV BH, [SI]   
	MOV BL, BH   
	CLD 
A1: LODSB   
	CMP AL, BH   
	JBE A2
	MOV DH,BH   
	MOV BH, AL   
	JMP A3 
A2: CMP AL, BL   
	JAE A3
	MOV DL,BL   
	MOV BL, AL 
A3: LOOP A1   
	MOV AX, BX   
	POP BX   
	POP CX   
	POP SI 
A4: RET 
BRANCH ENDP 
CODE  ENDS   
	END START 