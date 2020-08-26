.global _start
_start:		LDR	R0, =0xFF200020
			MOV	R1, #BIT_CODES
			LDRB	R1, [R1]
			STR	R1, [R0]
			MOV	R2, #0
			

MAIN:		LDR	R4, [R0, #0x30]
			CMP	R4, #0
			BEQ	MAIN

			MOV	R5, R4
			MOV	R6, R4
			MOV	R7, R4
			MOV	R8, R4		

			AND	R5, #0b0001
			CMP	R5, #0
			BNE	WAIT_0
			AND	R6, #0b0010
			CMP	R6, #0
			BNE	WAIT_1
			AND	R7, #0b0100
			CMP	R7, #0
			BNE	WAIT_2
			AND	R8, #0b1000
			CMP	R8, #0
			BNE	WAIT_3
		
WAIT_0:		LDR	R4, [R0, #0x30]
			CMP	R4, #0
			BEQ	NO_KEY_0
			B	WAIT_0

WAIT_1:		LDR	R4, [R0, #0x30]
			CMP	R4, #0
			BEQ	NO_KEY_1
			B	WAIT_1

WAIT_2:		LDR	R4, [R0, #0x30]
			CMP	R4, #0
			BEQ	NO_KEY_2
			B	WAIT_2

WAIT_3:		LDR	R4, [R0, #0x30]
			CMP	R4, #0
			BEQ	NO_KEY_3
			B	WAIT_3

NO_KEY_0:	MOV	R1, #BIT_CODES
			LDRB	R1, [R1]
			STR	R1, [R0]
			MOV	R2, #0
			B	MAIN

NO_KEY_1:	CMP	R2, #9
			BGE	MAIN
			MOV	R1, #BIT_CODES
			ADD	R2, #1
			ADD	R1, R2
			LDRB	R1, [R1]
			STR	R1, [R0]
			B	MAIN

NO_KEY_2:	CMP	R2, #0
			BLE	MAIN
			MOV	R1, #BIT_CODES
			SUB	R2, #1
			ADD	R1, R2
			LDRB	R1, [R1]
			STR	R1, [R0]
			B	MAIN

NO_KEY_3:	MOV	R1, #0
			STR	R1, [R0]
LOOP:		LDR	R4, [R0, #0x30]
			AND	R3, R4, #0b1111
			CMP	R3, #0
			BEQ	LOOP
NEXT:		LDR	R4, [R0, #0x30]
			CMP	R4, #0
			BNE	NEXT
			MOV	R1, #BIT_CODES
			LDRB	R1, [R1]
			STR	R1, [R0]
			MOV	R2, #0
			B	MAIN

SEG7_CODE:	MOV	R1, #BIT_CODES
			ADD	R1, R0		// index into the BIT_CODES "array"
			LDRB	R0, [R1]	// load the bit pattern (to be returned)
			MOV	PC, LR

BIT_CODES:	.byte	0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100110
			.byte	0b01101101, 0b01111101, 0b00000111, 0b01111111, 0b01100111
			.skip	2