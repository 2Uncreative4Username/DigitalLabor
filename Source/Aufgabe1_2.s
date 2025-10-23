/*
 * Aufgabe_1_2.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Addition von Zahlen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
        // a)
        mov R0, #4294967295
        mov R1, #1
        add R2, R1, R0
        
        // b)
        mov R3, #0xFFFFFFFF
        mov R4, #1
        add R5, R4, R3

        // c) 
        mov R6, #0x80000000
        mov R7, #0x80000000
        add R8, R7, R6

stop:
 	nop
	bal stop

.end
