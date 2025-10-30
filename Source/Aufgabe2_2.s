/*
 * Aufgabe_2_2.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Multiplikation
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:

        // Faktoren
        movs R0, #5
        beq stop
        movs R1, #4
        beq stop // Ergebnis ist 0 wenn einer der Faktoren 0 ist

        // Ergebnis
        mov R2, #0
        // Überlauf
        mov R3, #0

while:
        adds R2, R1 // R2 += R1 <> R0 mal
        addvs R3, #1 // wenn überlauf R3++
        subs r0, #1
        bne while

stop:
	nop
	bal stop

.end
