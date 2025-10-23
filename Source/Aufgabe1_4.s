/*
 * Aufgabe_1_4.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Maskenoperationen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
        // Zahl 1
        mov R0, #0
        mov R1, #0
        // Zahl 2
        mov R2, #0
        mov R3, #0
        // Ergebnis
        mov R4, #0
        mov R5, #0
        // Überlauf
        mov R6, #0

        adds R4, R0, R2 // addire die lower bits und setze flags
        adcs R5, R1, R3 // addire upper bits und addire das carry und setze flags

        movvs R6, #1 // wenn überlauf, dann schreibe 1 in das überlauf register

stop:
	nop
	bal stop

.end
