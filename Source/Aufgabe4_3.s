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
	mov r0,#20 
	str r0,[sp,#-4]!
	mov r0,#5
	str r0,[sp,#-4]!
	sub sp,#12
	bl division 
	ldr r2,[sp,#0]
	ldr r3,[sp,#4]
	ldr r4,[sp,#8]	// 
	add sp,#20 

stop:
	nop
	bal stop

// return Rest, Quotient, Error 
division:
	push {r0-r3}
	ldr r0,[sp,#16]	// Divident
	ldr r1,[sp,#20]	// Divisor
	cmp r1,#0
	moveq r3,#1	// error register
	beq div_return
	mov r2,#0	// Quotient

div_loop:
	
	subs r0,r0,r1
	addpl r2,#1
	bpl div_loop

	sub r2,#1
	add r0,r0,r1

div_return:
	// str returns
	pop {r0-r3}
	bx lr
.end
