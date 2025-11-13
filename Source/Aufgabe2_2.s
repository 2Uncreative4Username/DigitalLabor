/*
 * Aufgabe_2_2.S
 *
 * SoSe 2024
 *
 *  Created on: 13.12.2025
 *      Author: <$Name>
 *
 *	Aufgabe : Multiplikation
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
        // Ergebnis
        mov r2, #0
        // Überlauf
        mov r3, #0

        // Faktoren
        ldrs r0, =5
        beq stop
        ldrs r1, =4
        beq stop // Ergebnis ist 0 wenn einer der Faktoren 0 ist


while:
        adds r2, r1 // R2 += R1 <> R0 mal
        addvs r3, #1 // wenn überlauf R3++
        subs r0, #1 // faktor1 --
        bne while // wenn not zero do again

stop:
	nop
	bal stop

.end
