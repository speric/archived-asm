%TITLE "Lab 6 - The Millionaire Game"
IDEAL
MODEL SMALL
STACK 256
DATASEG
EXCODE db 	0 	;end of program variable
BANNER	  db 	13,10,":.::The Monty Python Millionaire Game:..:","$"
GETANS	  db	13,10,"Enter your answer:","$"
QUESTION1 db	13,10,"What is your name?","$"
Q1A	  db	13,10,"A]Arthur, King Of the Britons","$"
Q1B	  db	13,10,"B]John Doe","$"
Q1C	  db	13,10,"C]The Black Night","$"
Q1D	  db	13,10,"D]Harry Potter","$"
SPACE     db	13,10," ","$"
QUESTION2 db 	13,10,"What is your quest?","$"
Q2A	  db	13,10,"A]To get an A in philosophy","$"
Q2B	  db	13,10,"B]To pass philosophy","$"
Q2C	  db	13,10,"C]To find the Holy Grail","$"
Q2D	  db	13,10,"D]To get through this semester","$"
QUESTION3 db	13,10,"What is the air-speed velocity of an unlaiden swallow?","$"
Q3A	  db 	13,10,"A]13 miles an hour","$"
Q3B	  db 	13,10,"B]African, or European?","$"
Q3C	  db 	13,10,"C]What's a swallow?","$"
Q3D	  db 	13,10,"D]Are you saying cocunuts migrate?","$"
INCORRECT db 	13,10,"INCORRECT RESPONSE, GAME OVER","$"
WINNER    db	13,10,"YOU JUST WON A MILLION DOLLARS!","$"


CODESEG
MAIN:   MOV ax,@DATA	;opening instructions
	MOV ds,ax
	MOV dx, OFFSET BANNER
	MOV ah,9
	INT 21h
	
ASK_1:	MOV dx, OFFSET SPACE
	MOV ah,9
	INT 21h
	MOV dx, OFFSET QUESTION1
	MOV ah,9
	INT 21h
	MOV dx, OFFSET Q1A
	MOV ah,9
	INT 21h
	MOV dx, OFFSET Q1B
	MOV ah,9
	INT 21h
	MOV dx, OFFSET Q1C
	MOV ah,9
	INT 21h
	MOV dx, OFFSET Q1D
	MOV ah,9
	INT 21h
	MOV dx, OFFSET GETANS
	MOV ah,9
	INT 21h
	MOV ah,7
	INT 21h
	CMP al, 'A'
	JE ASK_2
	CMP al, 'a'
	JE ASK_2
	MOV dx, OFFSET INCORRECT
	MOV ah, 9
	INT 21h
	JMP THE_END
	MOV dx, OFFSET SPACE
	MOV ah,9
	INT 21h

ASK_2:	MOV dx, OFFSET SPACE
	MOV ah,9
	INT 21h
	MOV dx, OFFSET QUESTION2
	MOV ah,9
	INT 21h
	MOV dx, OFFSET Q2A
	MOV ah,9
	INT 21h
	MOV dx, OFFSET Q2B
	MOV ah,9
	INT 21h
	MOV dx, OFFSET Q2C
	MOV ah,9
	INT 21h
	MOV dx, OFFSET Q2D
	MOV ah,9
	INT 21h
	MOV dx, OFFSET GETANS
	MOV ah,9
	INT 21h
	MOV ah,7
	INT 21h
	CMP al, 'C'
	JE ASK_3
	CMP al, 'c'
	JE ASK_3
	MOV dx, OFFSET INCORRECT
	MOV ah, 9
	INT 21h
	JMP THE_END
	


ASK_3:	MOV dx, OFFSET SPACE
	MOV ah,9
	INT 21h
	MOV dx,OFFSET QUESTION3
	MOV ah,9
	INT 21h
	MOV dx, OFFSET Q3A
	MOV ah,9
	INT 21h
	MOV dx, OFFSET Q3B
	MOV ah,9
	INT 21h
	MOV dx, OFFSET Q3C
	MOV ah,9
	INT 21h
	MOV dx, OFFSET Q3D
	MOV ah,9
	INT 21h
	MOV dx, OFFSET GETANS
	MOV ah,9
	INT 21h
	MOV ah,7
	INT 21h
	CMP al, 'B'
	JE YOUWIN
	CMP al, 'b'
	JE YOUWIN
	MOV dx, OFFSET INCORRECT
	MOV ah, 9
	INT 21h
	JMP THE_END
	
YOUWIN:MOV dx, OFFSET WINNER
	MOV ah, 9
	INT 21h

THE_END:MOV ah,04ch	;ending instructions
	MOV al,[EXCODE]
	INT 21h
END MAIN		;end

