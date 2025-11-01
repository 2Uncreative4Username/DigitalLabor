/*
 * Aufgabe_1_1.S
 *
 * SoSe 2024
 *
 *  Created on: 30.10.2025
 *      Author: <$Name>
 *
 *	Aufgabe : Zahlendarstellung
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
        mov R0, #0xFFFFFFF4 // hexadezimal schreibweise unsinged
        mov R1, #4294967284 // dezimal unsinged
        mov R2, #-12        // dezimal singed
        mov R3, #-0xC       // hexadezimal singed
        mov R4, #~11        // dezimal 11 + bits invertiert
        mov R5, #0b11111111111111111111111111110100 //binär


stop:
	nop
	bal stop

.end
