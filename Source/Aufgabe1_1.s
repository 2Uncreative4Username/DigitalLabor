/*
 * Aufgabe_1_1.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Zahlendarstellung
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
        mov R0, #0xFFFFFFF4
        mov R1, #4294967284
        mov R2, #-12
        mov R3, #-0xC
        mov R4, #~11
        mov R5, #0b11111111111111111111111111110100


stop:
	nop
	bal stop

.end
