/*
 * Aufgabe_3_1.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Unterprogrammaufruf
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */

.equ DURATION, 5
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
        mov r4, #DATAAMOUNT

while:
        ldr r2, [r1], #4
        cmp r2, #THRESHHOLD
        movhi r2, #8
        
        orrhi r0, r0, r2

        bl wait

        subs r4, #1
        movne r0, r0, lsl #4
        bne while

        b stop

wait:
        stmfd sp!,{r0,r1,r2,r4,lr}
        add sp,#-4
        
        mov r0, #DURATION
waitLoop:
        adds r0,#-1
        bne waitLoop
        
        add sp,#4
        ldmfd sp!,{r0,r1,r2,r4,pc}
        

stop:
	nop
	bal stop

.end
