/*
 * Aufgabe_1_3.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : Flags und bedingte Ausführung
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
.equ Threshhold, 100
main:
        mov R0, #Threshhold
        mov R1, #Threshhold
        
        cmp R0, #Threshhold // setze flags
        bls else // wenn R0 <= Threshhold, dann springe

        mov R0, #255 // wenn R0 > Threshhold ->255
        b end_if

else:
        mov R0, #0 // wenn R0 <= Threshhold, ->0

end_if:
        

        // mit bedingter ausführung:
        cmp R1, #Threshhold
        movhi R1, #255
        movls R1, #0


end:
        

stop:
	nop
	bal stop


.end