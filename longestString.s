		.text
		.global _start

_start:
		MOV	R0, #TEST_NUM	// get word
		LDR	R0, [R0]
		MOV	R1, R0
		BL	ONES		// call each subroutine and reset R1 to inital word each time
		MOV	R1, R0
		BL	ZEROS
		MOV	R1, R0
		BL	ALTERNATE
END:		B	END

ONES:		MOV	R5, #0		// set value of register to 0
LOOP0:		CMP	R1, #0		// see if R1 is equal to 0
		BEQ	DONE
		LSR	R2, R1, #1	// shift value right or divide by 2
		AND	R1, R1, R2	// bitwise and operator
		ADD	R5, #1		// increment count by 1
		B	LOOP0

ZEROS:		MOV	R6, #0		// set value of register to 0
		LDR	R3, [R1, #4]	// load a 32 bit number with only 1s
		EOR	R1, R1, R3	// XOR R1 and R3
LOOP1:		CMP	R1, #0
		BEQ	DONE
		LSR	R2, R1, #1
		AND	R1, R1, R2
		ADD	R6, #1
		B	LOOP1

ALTERNATE:	MOV	R7, #0		// set value of register to 0
		LDR	R3, [R1, #8]	// load a 32 bit number 101010...
		LDR	R4, [R1, #12]	// load a 32 bit number 010101...
		EOR	R1, R1, R3	// XOR R1 and R3
LOOP2:		CMP	R1, #0
		BEQ	ALTERNATE2
		LSR	R2, R1, #1
		AND	R1, R1, R2
		ADD	R7, #1
		B	LOOP2
ALTERNATE2:	MOV	R8, #0		// set value of register to 0
		MOV	R1, R0
		EOR	R1, R1, R4	// XOR R1 and R4
LOOP3:		CMP	R1, #0
		BEQ	ALTERNATE3
		LSR	R2, R1, #1
		AND	R1, R1, R2
		ADD	R8, #1
		B	LOOP3
ALTERNATE3:	CMP	R7, R8		// take larger result for alternating string of numbers
		BGE	DONE
		MOV	R8, R7

DONE:		MOV	PC, LR
 
TEST_NUM:	.word	0x103fe00f, 0xffffffff, 0xaaaaaaaa, 0x55555555

		.end