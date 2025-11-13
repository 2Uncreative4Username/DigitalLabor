/*
 * Aufgabe_2_3.S
 *
 * SoSe 2024
 *
 *  Created on: 13.12.2025
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
.word 0x00000051
.word 0x00000002
.word 0x00000003
.word 0x00000004
.word 0x00000005
.word 0x00000006
.word 0x00000007
.word 0x00000008

main:
        mov r0, #0  // Ausgaberegister Initialisieren

        ldr r1,=variable_a // r1 = &a r1 ist pointer

        mov r4, #DATAAMOUNT
// loop to iterate over addresses
while:
        ldr r2, [r1] // r2 = *r1
        cmp r2, #THRESHHOLD // r2 anpassen
        movhi r2, #8
        movls r2, #0
        str r2, [r1] // r2 speichern
        orr r0, r0, r2 // r2 in r0 übertragen
        add r1, #4 // r1++
        

        subs r4, #1 // condition to break loop
        movne r0, r0, lsl #4 // links shift nur, wenn die schleife nochmal durchlaufen wird
        bne while

stop:
	nop
	bal stop

.end
