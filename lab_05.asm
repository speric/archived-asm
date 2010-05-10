%TITLE "Program 5"
;11.15.01
IDEAL
MODEL SMALL
STACK 256
DATASEG
EXCODE	 dw 	0 	;end of program variable
SWITCH	 dw	0	;
USERNUM	 dw 	0
DIVISOR  dw	2
BOOL1	 dw 	0	;these will hold "flags" indicating
BOOL2	 dw	0	;e.g. 1 for even, 0 for odd.
BOOL3	 dw	0
PROMPT 	 db	13,10,"Please enter a value between 1 and 9:","$"
NUMIS	 db	13,10,"The number is ","$"
ODD	 db 	"odd ","$"
ANEVEN 	 db	"even ","$"
ISPRIME	 db 	"prime ","$"
NOTPRIME db	"not prime ","$"
PSQUARE  db 	"a perfect square.","$"
NOSQUARE db 	"not a perfect square.","$"
CODESEG
MAIN:   MOV ax,@DATA	;opening instructions
	MOV ds,ax
	MOV ax,0

ASKUSER:MOV dx,OFFSET PROMPT
	MOV ah,9
	INT 21h		;ask user for number
	
GETNUM: MOV ah,7 
	INT 21h
	MOV ax,000Fh	
	MOV [USERNUM],ax
	

EVENODD:MOV dx,0
	DIV [DIVISOR]
	CMP dx,0
	JG PRIME
	OR [SWITCH],0001h ;turn on bit 0 if it's even
	MOV [BOOL1],1	  ;1 if number is even

PRIME:	CMP [USERNUM],1
	JE DO_SWITCH
	CMP [USERNUM],2
	JE DO_SWITCH
	CMP [USERNUM],3
	JE DO_SWITCH
	CMP [USERNUM],5
	JE DO_SWITCH
	CMP [USERNUM],7
	JE DO_SWITCH
	JMP SQUARE

DO_SWITCH:OR [SWITCH],2h ;turn on bit 1 if it's a prime
	  MOV [BOOL2],1	 ;1 if number is prime

SQUARE:	CMP [USERNUM],1
	JE DO_SWITCH2
	CMP [USERNUM],4
	JE DO_SWITCH2
	CMP [USERNUM],9
	JE DO_SWITCH2
	JMP OUTPUT

DO_SWITCH2:OR [SWITCH],4h ;turn on bit 2 if it's a perfect square
	MOV [BOOL3],1	 ;1 if number is a perfect square

;this section prints the output
OUTPUT:	MOV dx,OFFSET NUMIS
      	MOV ah,9
	INT 21h
ODDOREVEN:
	CMP [BOOL1],0
	JG NUMEVEN
	MOV dx,OFFSET ODD
	MOV ah,9
	INT 21h		
	JMP PRIMEORNOT
NUMEVEN:MOV dx,OFFSET ANEVEN
	MOV ah,9
	INT 21h
PRIMEORNOT:
	CMP [BOOL2],0
	JG NUMPRIME
	MOV dx,OFFSET NOTPRIME
	MOV ah,9
	INT 21h
	JMP SQUAREORNOT
NUMPRIME:MOV dx,OFFSET ISPRIME
	MOV ah,9
	INT 21h
SQUAREORNOT:
	CMP [BOOL3],0
	JG ISSQUARE
	MOV dx,OFFSET NOSQUARE
	MOV ah,9
	INT 21h
	JMP THE_END
ISSQUARE:MOV dx,OFFSET PSQUARE
	MOV ah,9
	INT 21h
	
THE_END:MOV ah,04ch	;ending instructions
	MOV al,0
	INT 21h
END MAIN		;end

