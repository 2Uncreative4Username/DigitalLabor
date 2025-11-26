/*
 * Aufgabe_2_1.S
 *
 * SoSe 2024
 *
 *  Created on: 13.12.2025
 *      Author: Fabian Swinne
 *
 *	Aufgabe : 64 Bit Addition
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */
/*
wie gegeben
.equ BREAD_bm, (1<<0)
.equ BUTTER_bm, (1<<1)
.equ CHEESE_bm, (1<<2)

.equ TEQUILA_bm, (1<<8)
.equ MILK_bm, (1<<9)
.equ RUM_bm, (1<<10)
.equ VINE_bm, (1<<11)
.equ VODKA_bm, (1<<12)

.equ ALMOND_bm, (1<<8)
.equ PEANUT_bm, (1<<9)
.equ CHESTNUTS_bm, (1<<10)

.equ APPLE_bm, (1<<12)
.equ MANGO_bm, (1<<13)
.equ LEMON_bm, (1<<14)
*/
//gefixt
.equ BREAD_bm, (1<<0)
.equ BUTTER_bm, (1<<1)
.equ CHEESE_bm, (1<<2)
.equ BASICS_bm, (BREAD_bm|BUTTER_bm|CHEESE_bm)

.equ TEQUILA_bm, (1<<3)
.equ MILK_bm, (1<<4)
.equ RUM_bm, (1<<5)
.equ VINE_bm, (1<<6)
.equ VODKA_bm, (1<<7)
.equ DRINKS_bm, (TEQUILA_bm|MILK_bm|RUM_bm|VINE_bm|VODKA_bm)

.equ ALMOND_bm, (1<<8)
.equ PEANUT_bm, (1<<9)
.equ CHESTNUTS_bm, (1<<10)
.equ NUTS_bm, (ALMOND_bm|PEANUT_bm|CHESTNUTS_bm)

.equ APPLE_bm, (1<<12)
.equ MANGO_bm, (1<<13)
.equ LEMON_bm, (1<<14)
.equ FRUITS_bm, (APPLE_bm|MANGO_bm|LEMON_bm)

.equ BREAKFAST_bm, (BASICS_bm | MILK_bm | PEANUT_bm | LEMON_bm)

main:
        ldr R0, =BREAKFAST_bm
        ldr R1, =(BREAKFAST_bm|NUTS_bm)
        ldr R2, =(BREAKFAST_bm & ~MILK_bm)|VINE_bm
        ldr R3, =FRUITS_bm|MILK_bm|(MILK_bm<<16)
        ldr R4, =(BREAKFAST_bm & ~BUTTER_bm & ~MILK_bm)|VINE_bm
stop:
	nop
	bal stop

.end
