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
.equ TESTAMOUNT, 5
variable_a:
.word 0x00000003
.word 0x00000045
.word 0x00000027
.word 0x00000076
.word 0x00000099

variable_b:
.word 0x00000012
.word 0x00000038
.word 0x00000056
.word 0x00000059
.word 0x00000099

variable_c:
.word 0x00000015
.word 0x00000083
.word 0x00000083
.word 0x00000135
.word 0x00000198

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
        str r0, [sp,#-4]!
        ldr r1, [r12], #4
        bl addBcd

        cmp r0,r1
	moveq r4, #1
        moveq r4, r4, lsl r2 
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
        push {r1-r8}
        
        mov r0, #0        // return/result = 0
        ldr r1,[sp,#32]   // summand 1
        ldr r2,[sp,#36]   // summand 2
        mov r3, #0        // digit counter
        mov r4, #0xf      // digit mask
        mov r5, #0        // carry
        mov r8, #0        // rotate register

addBcd_loop:
	mov r6, r1, ror r8	// right shift
	mov r7, r2, ror r8 

	and r6, r6, r4		// isolate didgits
	and r7, r7, r4

	add r6, r6, r7		// add didgits
	add r6, r6, r5		// add carry
	mov r5, #0 

	cmp r6, #9		// handle carry
	subhi r6, r6, #10 
	movhi r5, #1 

	mov r6, r6, lsl r8 	// write result
	orr r0, r0, r6

        add r3,#1          // digit counter ++
        add r8,#4
        cmp r3,#DIGITS     // loop condition
        bne addBcd_loop

        pop {r1-r8}
        bx lr
.end
