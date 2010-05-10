%TITLE "The Multiple Program"
;Write a program to add the multiples of 10 from 10 to 500 using the stack
;10.26.01
IDEAL
MODEL SMALL
STACK 256
DATASEG
EXCODE 	db 0
COUNT 	dw 10	;count of numbers
SUM 	dw 0	;sum		
I 	dw 0	;count of pushes
J 	dw 0	;count of pops
CODESEG
MAIN:		MOV ax,@DATA	;opening instructions
		MOV ds,ax

		MOV bx,0	;bx will hold "popped" numbers

PUSH_LOOP:	CMP [COUNT],500	;loop that pushes the numbers
		JG MOVE_I
		PUSH [COUNT]
		ADD [COUNT],10
		INC [I]
		JMP PUSH_LOOP

MOVE_I:		MOV cx,[I]	;cx will hold the "push" counter

POP_LOOP:	CMP [J],cx	;loop that pops the numbers "i" times
		JE THE_END
		POP bx
		ADD [SUM],bx
		INC [J]
		JMP POP_LOOP

THE_END:	MOV ah,04Ch	;ending instructions
		MOV al,[EXCODE]
		INT 21h
END MAIN
	