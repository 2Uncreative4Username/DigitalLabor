/*
 * Aufgabe_1_3.S
 *
 * SoSe 2024
 *
 *  Created on: 30.10.2025
 *      Author: <$Name>
 *
 *	Aufgabe : Flags und bedingte Ausführung
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
.equ THRESHHOLD, 100
main:
        mov R0, #THRESHHOLD -1
        mov R1, #THRESHHOLD
        mov R2, #THRESHHOLD
        mov R3, #0
        mov R4, #~0
        
        cmp R0, #THRESHHOLD // setze flags
        bls else_0 // wenn R0 <= THRESHHOLD, dann springe

        mov R0, #255 // wenn R0 > THRESHHOLD ->255
        b end_if_0

else_0:
        mov R0, #0 // wenn R0 <= THRESHHOLD, ->0

end_if_0:
        
        cmp R1, #THRESHHOLD // setze flags
        bls else_1 // wenn R0 <= THRESHHOLD, dann springe

        mov R1, #255 // wenn R0 > THRESHHOLD ->255
        b end_if_1

else_1:
        mov R1, #0 // wenn R0 <= THRESHHOLD, ->0

end_if_1:
        cmp R2, #THRESHHOLD // setze flags
        bls else_2 // wenn R0 <= THRESHHOLD, dann springe

        mov R2, #255 // wenn R0 > THRESHHOLD ->255
        b end_if_2

else_2:
        mov R2, #0 // wenn R0 <= THRESHHOLD, ->0

end_if_2:
        cmp R3, #THRESHHOLD // setze flags
        bls else_3 // wenn R0 <= THRESHHOLD, dann springe

        mov R3, #255 // wenn R0 > THRESHHOLD ->255
        b end_if_3

else_3:
        mov R3, #0 // wenn R0 <= THRESHHOLD, ->0

end_if_3:
        cmp R4, #THRESHHOLD // setze flags
        bls else_4 // wenn R0 <= THRESHHOLD, dann springe

        mov R4, #255 // wenn R0 > THRESHHOLD ->255
        b end_if_4

else_4:
        mov R4, #0 // wenn R0 <= THRESHHOLD, ->0

end_if_4:
        
        mov R5, #THRESHHOLD -1
        mov R6, #THRESHHOLD
        mov R7, #THRESHHOLD + 1
        mov R8, #0
        mov R9, #~0

        // mit bedingter ausführung:
        cmp R5, #THRESHHOLD
        movhi R5, #255  // move wenn R1 > THRESHHOLD
        movls R5, #0  // move wenn R1 <= THRESHHOLD
        
        cmp R6, #THRESHHOLD
        movhi R6, #255
        movls R6, #0

        cmp R7, #THRESHHOLD
        movhi R7, #255
        movls R7, #0

        cmp R8, #THRESHHOLD
        movhi R8, #255
        movls R8, #0

        cmp R9, #THRESHHOLD
        movhi R9, #255
        movls R9, #0

end:
        

stop:
	nop
	bal stop


.end