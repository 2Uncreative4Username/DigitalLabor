/*
 * Aufgabe_3_3.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Unterprogrammaufruf  mit Parameterübergabe über dem Stack
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */

.equ DURATION, 3
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
        mov r0, #0
        ldr r1,=variable_a
        mov r3, #DATAAMOUNT

while:
        ldr r2, [r1], #4
        cmp r2, #THRESHHOLD
        movhi r2, #8
        
        orrhi r0, r0, r2

        mov r6, #DURATION
        str r6,[sp,#-4]!
        bl delay

        subs r3, #1
        movne r0, r0, lsl #4
        bne while

stop:
	nop
	bal stop

//takes r4 as parameter
delay:
        stmfd sp!,{r0}
        ldr r0,[sp,#4]
loop:
        subs r0, #1
        bne loop
        
        ldmfd sp!,{r0}
        bx lr

.end
