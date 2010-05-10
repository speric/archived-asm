%TITLE "Program 4"
IDEAL
MODEL SMALL
STACK 256
DATASEG
EXCODE		db 	0 	;end of program variable
QUESTION 	db	13,10,"Do you wish to drop the lowest grade? Enter Y or N:","$" 
A_GRADE		db	13,10,"Sam's grade is A","$"
B_GRADE		db	13,10,"Sam's grade is B","$"
C_GRADE		db	13,10,"Sam's grade is C","$"
D_GRADE		db	13,10,"Sam's grade is D","$"
F_GRADE		db 	13,10,"Sam's grade is F","$"
DIVISOR 	dw	5
DIVISORL 	dw	4
CODESEG
MAIN:   MOV ax,@DATA	;opening instructions
	MOV ds,ax
ASK:	MOV dx,OFFSET QUESTION
	MOV ah,9
	INT 21h
RESPOND:MOV ah,7
	INT 21h
	CMP al,'Y'
	JE DROP_LOW
	CMP al,'y'
	JE DROP_LOW
	CMP al,'N'
	JE NO_DROP
	CMP al,'n'
	JE NO_DROP
	JMP ASK
DROP_LOW:MOV ax,0
	ADD ax,84
	ADD ax,91
	ADD ax,90	
	ADD ax,95
	MOV dx,0
	DIV [DIVISORL]
	JMP GETGRADE

NO_DROP:MOV ax,0
	ADD ax,84
	ADD ax,91
	ADD ax,90	
	ADD ax,95
	ADD ax,68
	MOV dx,0
	DIV [DIVISOR]
	JMP GETGRADE

GETGRADE:CMP ax,89
	JLE B_RANGE
	MOV dx,OFFSET A_GRADE
	MOV ah,9
	INT 21h
	JMP THE_END
B_RANGE:CMP ax,79
	JLE C_RANGE
	MOV dx,OFFSET B_GRADE
	MOV ah,9
	INT 21h
	JMP THE_END
C_RANGE:CMP ax,69
	JLE D_RANGE
	MOV dx,OFFSET C_GRADE
	MOV ah,9
	INT 21h
	JMP THE_END
D_RANGE:CMP ax,59
	JLE F_RANGE
	MOV dx,OFFSET D_GRADE
	MOV ah,9
	INT 21h
	JMP THE_END
F_RANGE:MOV dx,OFFSET F_GRADE
	MOV ah,9
	INT 21h
	JMP THE_END

THE_END:MOV ah,04ch	;ending instructions
	MOV al,[EXCODE]
	INT 21h
END MAIN		;end

