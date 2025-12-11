/*
 * Aufgabe_2_3.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Maximalwert eines Datenblocks ermitteln
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
	sub sp,#20              // alocate memory on the stack
	mov r0,#20 
	str r0,[sp]             // save first parameter on the stack
	mov r1,#5
	str r1,[sp,#4]          // save 2 parameter on the stack
	bl division 
	ldr r2,[sp,#8] 		// load Quotient
	ldr r3,[sp,#12] 	// load Rest
	ldr r4,[sp,#16] 	// load Error
	add sp,#20              // free memory on the stack

stop:
	nop
	bal stop

division:
	push {r0-r3}
	ldr r0,[sp,#16]	// Divident
	ldr r1,[sp,#20]	// Divisor
	cmp r1,#0
	moveq r3,#1	// error register
	movne r3,#0
	mov r2,#0	// Quotient
	beq div_return

div_loop:
	
	subs r0,r0,r1
	add r2,#1
	bpl div_loop

	adds r0,r0,r1
	subne r2,#1

div_return:
	str r2,[sp,#24]		// store Quotient on the stack
	str r0,[sp,#28]		// store Rest on the stack
	str r3,[sp,#32]		// store error on the stack
	pop {r0-r3}
	bx lr
.end
