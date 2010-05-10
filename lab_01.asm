%TITLE "Program One-Calculate the sum of odd numbes 1-99"
;10.19.01
IDEAL
MODEL SMALL
STACK 256
DATASEG
EXCODE	 db 	0 	;end of program variable
SUM    	 dw	0	;sum
COUNT  	 dw	3	;count of numbers 
CODESEG
MAIN:   MOV ax,@DATA	;opening instructions
	MOV ds,ax
	MOV bx,1
NUMLOOP:CMP [COUNT],99
	JG EOL
	ADD bx,[COUNT]
	ADD [COUNT],2
	JMP NUMLOOP
EOL:	MOV [SUM],bx

THE_END:MOV ah,04ch	;ending instructions
	MOV al,[EXCODE]
	INT 21h
END MAIN		;end

