/*
 * Aufgabe_4_2.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Addition von zwei 8 stelligen BCD Zahlen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */

.equ DIGITS, 8
.equ TESTAMOUNT, 1
variable_a:
.word 0x00000051

variable_b:
.word 0x00000051

variable_c:
.word 0x00000051

// r10, r11, r12 for variables
main:
        ldr r10, =variable_a
        ldr r11, =variable_b
        ldr r12, =variable_c
        mov r2, #TESTAMOUNT   // loop-counter
        mov r3, #0
        
main_loop:
        ldr r0, [r10], #4
        str r0, [sp,#-4]!
        ldr r0, [r11], #4
        str r0, [sp,#-8]!
        ldr r1, [r12], #4
        bl addBcd
        cmp r0,r1
        // wenn pass(eq) dann r3 = (1<<r2) | r3
        subs r2,#1
        bne main_loop


stop:
	nop
	bal stop

// parameters through stack
// return in r0
addBcd:
        push {r1-r5}
        
        mov r0, #0        // return/result = 0
        ldr r1,[sp,#20]   // summand 1    refactor to lacal variables
        ldr r2,[sp,#24]   // summand 2
        mov r3, #0        // digit counter
        mov r4, #0xf      // digit mask
        mov r5, #0        // carry

addBcd_loop:
        
        mov r4, r4, lsl #4
        add r3,#1
        cmp r3,#DIGITS
        bne addBcd_loop

        pop {r1-r5}
        bx lr
.end