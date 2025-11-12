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
.equ DATAAMOUNT, 8
variable_a:
.word 0x00000001
.word 0x00000002
.word 0x00000003
.word 0x00000004
.word 0x00000005
.word 0x00000006
.word 0x00000007
.word 0x00000081

main:
        mov r0, #0  // Ausgaberegister Initialisieren

        ldr r1,=variable_a // r1 = &a r1 ist pointer

        mov r4, #DATAAMOUNT
// loop to iterate over addresses
while:
        ldr r2, [r1]//, #4 // r2 = *r1; r1++;
        cmp r2, #THRESHHOLD
        movhi r2, #80
        movls r2, #0
        str r2, [r1]
        orr r0, r0, r2
        mov r0, r0, lsl #4
        add r1, #4 //r1++
        

        subs r4, #1 // condition to break loop
        bne while


        /*
        ldr r1,=variable_a

        ldr r2, [r1], #4
        ldr r3, [r1], #4
        ldr r4, [r1], #4
        */
stop:
	nop
	bal stop

.end
