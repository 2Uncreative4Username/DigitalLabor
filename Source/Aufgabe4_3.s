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
	sub sp,#20 
	mov r0,#20 
	str r0,[sp]
	mov r1,#5
	str r1,[sp,#4]
	bl division 
	ldr r2,[sp,#8] 		// load Quotient
	ldr r3,[sp,#12] 	// load Rest
	ldr r4,[sp,#16] 	// load Error
	add sp,#20 

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
	addpl r2,#1
	bpl div_loop

	//submi r2,#1
	addmi r0,r0,r1

div_return:
	// str returns
	str r2,[sp,#24]
	str r0,[sp,#28]
	str r3,[sp,#32]
	pop {r0-r3}
	bx lr
.end
