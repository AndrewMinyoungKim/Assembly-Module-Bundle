.global _start
_start:		LDR	R0, =0xFF200020
			LDR	R10, [R0, #0x3C]
			STR	R10, [R0, #0x3C]
			
			LDR	R4, =0xFFFEC600
			LDR	R5, =50000000
			STR	R5, [R4]
			
			MOV	R5, #0b011
			STR	R5, [R4, #8]
			
			LDR	R6, [R4, #0xC]
			STR	R6, [R4, #0xC]
			
			MOV	R11, #0
			MOV	R12, #0

MAIN:		MOV	R1, #BIT_CODES
			MOV	R2, #BIT_CODES
			ADD	R1, R11
			ADD	R2, R12
			LDRB	R1, [R1]
			LDRB	R2, [R2]
			LSL	R2, #8
			ORR	R1, R2
			STR	R1, [R0]
			
			LDR	R6, [R4, #0xC]
			CMP	R6, #0
			BEQ	MAIN
			STR	R6, [R4, #0xC]
			
			LDR	R10, [R0, #0x3C]
			AND	R10, #0b1111
			CMP	R10, #0
			BNE	TOGGLE
			
			ADD	R11, #1
			CMP	R11, #10
			BGE	RESET
			B	MAIN
			
RESET:		MOV	R11, #0
			ADD	R12, #1
			
			CMP	R12, #10
			BLT	MAIN
			
			MOV	R11, #0
			MOV	R12, #0
			B	MAIN

TOGGLE:		STR	R10, [R0, #0x3C]
TOGGLE_2:	LDR	R10, [R0, #0x3C]
			AND	R10, #0b1111
			CMP	R10, #0
			BEQ	TOGGLE_2
			STR	R10, [R0, #0x3C]
			B	MAIN

SEG7_CODE:	MOV	R1, #BIT_CODES
			ADD	R1, R0		// index into the BIT_CODES "array"
			LDRB	R0, [R1]	// load the bit pattern (to be returned)
			MOV	PC, LR

BIT_CODES:	.byte	0b00111111, 0b00000110, 0b01011011, 0b01001111, 0b01100110
			.byte	0b01101101, 0b01111101, 0b00000111, 0b01111111, 0b01100111
			.skip	2