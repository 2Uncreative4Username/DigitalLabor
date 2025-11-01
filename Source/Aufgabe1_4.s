/*
 * Aufgabe_1_4.S
 *
 * SoSe 2024
 *
 *  Created on: 30.10.2025
 *      Author: <$Name>
 *
 *	Aufgabe : Maskenoperationen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
        // Zahl 1
        ldr R0, =0  // lower bits
        ldr R1, =0  // higher bits
        // Zahl 2
        ldr R2, =0
        ldr R3, =0
        

        adds R4, R0, R2 // addire die lower bits und setze flags
        adcs R5, R1, R3 // addire upper bits und addire das carry und setze flags
        // Überlauf
        movcc R6, #0  // wenn kein überlauf, dann schreibe 0 in das überlauf register
        movcs R6, #1 // wenn überlauf, dann schreibe 1 in das überlauf register

stop:
	nop
	bal stop

.end
