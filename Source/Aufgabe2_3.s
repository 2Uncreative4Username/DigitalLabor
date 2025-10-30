/*
 * Aufgabe_2_3.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Werte Binarisieren
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
.equ THRESHHOLD, 80
main:

        mov R0, #0
        mov R1, #0
        mov R2, #0
        mov R3, #0
        mov R4, #0
        mov R5, #0
        mov R6, #0
        mov R7, #0

        mov R8, #0

        cmp R0, THRESHHOLD
        cmp R1, THRESHHOLD
        cmp R2, THRESHHOLD
        cmp R3, THRESHHOLD
        cmp R4, THRESHHOLD
        cmp R5, THRESHHOLD
        cmp R6, THRESHHOLD
        cmp R7, THRESHHOLD

stop:
	nop
	bal stop

.end
