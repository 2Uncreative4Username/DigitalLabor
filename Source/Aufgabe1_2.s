/*
 * Aufgabe_1_2.S
 *
 * SoSe 2024
 *
 *  Created on: 30.10.2025
 *      Author: <$Name>
 *
 *	Aufgabe : Addition von Zahlen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
        // a)
        mov R0, #0xFFFFFFFF
        mov R1, #1
        add R2, R1, R0
        
        // b)
        mov R3, #~0
        mov R4, #1
        add R5, R4, R3

        // c) 
        mov R6, (1<<31) //0x80000000
        add R7, R6, R6

stop:
 	nop
	bal stop

.end
