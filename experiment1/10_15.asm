SSTACK SEGMENT STACK ; 定义堆栈段
	DW 32 DUP(?)
SSTACK ENDS

CODE SEGMENT
	ASSUME CS:CODE, SS:SSTACK
START:
	PUSH DS
	XOR AX, AX
	MOV DS, AX
	MOV SI, 3000H ; 建立数据起始地址
	MOV CX, 16	; 循环次数16次
AA1:
	MOV [SI], AL
	INC SI	; 地址自加1
	INC AL	; 数据自加1
	LOOP AA1
	MOV AX, 4C00H
	INT 21H ; EXIT
CODE ENDS
	END START
	