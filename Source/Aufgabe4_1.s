/*
 * Aufgabe_4_1.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Verwendung von Stack
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
main:
        sub sp, sp, #4 
        
        mov r0, #0x44 
        mov r1, #0x55 
        
        mov r2, #0xffffffff 
        str r2,[sp] 
        
        mov r5, #3 

while: 
        bl berechne 
        
        ldr r1,[sp] 
        cmp r0,r1 
        strge r0,[sp] 
        
        subs r5, r5, #1 
        bne while

stop:
	nop
	bal stop

// c = |a + b|+|b - 1|
// uint8 a = 150
// int16 b = -193
// int32 c = -200
// return über Register
berechne:
        push {r0,r1,lr}

        sub sp,#8
        
        mov r0, #150
        strb r0,[sp,#0]

        ldr r0,=#-193
        strh r0,[sp,#2]

        ldr r0,=#-200
        str r0,[sp,#4]

        ldrsh r0,[sp,#2]
        ldr r1,[sp,#4]
        bl absSub

        str r1,[sp,#4]

        rsb r1, r1, #0
        ldrb r0,[sp,#0]
        bl absSub

        ldr r1,[sp,#4]

        add r1, r0, r1
        str r1,[sp,#4]

        add sp,#8
        
        pop {r0,r1,lr}
        bx lr 

// parameter übergabe durch r0, r1
// return in r0
absSub:
        subs r0, r0, r1
        rsbmi r0, r0, #0 
        bx lr

.end