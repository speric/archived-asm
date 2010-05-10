%TITLE "The Average Calculator"
;11.02.01
IDEAL
MODEL SMALL
STACK 256
DATASEG
EXCODE  db 	0 	;end of program variable
AVERAGE dw	0
DIVISOR dw 	6	;6 grades
;grade variables
GRADE1	dw	100
GRADE2	dw	74
GRADE3	dw	82
GRADE4	dw	90
GRADE5	dw	85
GRADE6	dw	91
CODESEG
MAIN:   MOV ax,@DATA	;opening instructions
	MOV ds,ax
	MOV ax,0	;ax will hold the sum of the grades
	ADD ax,[GRADE1]
	ADD ax,[GRADE2]
	ADD ax,[GRADE3]
	ADD ax,[GRADE4]
	ADD ax,[GRADE5]
	ADD ax,[GRADE6]
	DIV [DIVISOR]	;divide by 6
	MOV [AVERAGE],ax

THE_END:MOV ah,04ch	;ending instructions
	MOV al,[EXCODE]
	INT 21h
END MAIN		;end

