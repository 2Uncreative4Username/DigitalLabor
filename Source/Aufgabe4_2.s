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
        mov r3, #0            // eval register
        
main_loop:
        ldr r0, [r10], #4
        str r0, [sp,#-4]!
        ldr r0, [r11], #4
        str r0, [sp,#-8]!
        ldr r1, [r12], #4
        bl addBcd

        cmp r0,r1
	moveq r4, #1, ror r2 
	movne r4, #0 
	orr r3, r3, r4

        subs r2,#1
        bne main_loop


stop:
	nop
	bal stop

// parameters through stack
// return in r0
addBcd:
        push {r1-r7}
        
        mov r0, #0        // return/result = 0
        ldr r1,[sp,#28]   // summand 1
        ldr r2,[sp,#32]   // summand 2
        mov r3, #0        // digit counter
        mov r4, #0xf      // digit mask
        mov r5, #0        // carry

addBcd_loop:
        and r6, r1, r4    // isolate digits
	and r7, r2, r4
	add r6, r6, r7    // add digits
	cmp r5, #0        // considder carry
	addne r6, r6, r5  // if c != 0 { tmp += c; c = 0;}
	movne r5, #0 

	// check for overflow 
	cmp r6, #9
	subhi r5, r6, #9
	subhi r6, r6, #9

	mov r6, r6, ror r3

	orr r0, r0, r6

        mov r4, r4, lsl #4 // Digit mask left shiften
        add r3,#1          // digit counter ++
        cmp r3,#DIGITS     // loop condition
        bne addBcd_loop

        pop {r1-r7}
        bx lr
.end
