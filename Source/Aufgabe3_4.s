/*
 * Aufgabe_3_4.S
 *
 * SoSe 2024
 *
 *  Created on: <$Date>
 *      Author: <$Name>
 *
 *	Aufgabe : nterprogrammaufruf mit Übergebe von mehreren Parametern - Division
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global main /* Specify global symbol */

// polynom: x21+x15+x3+1
// seed: 558473

main:
    /* Seed laden */
    ldr     r0, =558473      /* Anfangswert */

    mov     r5, #11          /* Schleifenzähler */

loop_generate:
    /* LFSR-Schritt ausführen → liefert neuen state in r0 */
    bl      lfsr32_step

    /* Wert FILO auf den Stack ablegen → PUSH */
    push    {r0}

    /* Zähler dekrementieren */
    subs    r5, r5, #1
    bne     loop_generate

stop:
	nop
	bal stop


.thumb
.thumb_func
.global lfsr32_step

/* Polynom: x^21 + x^15 + x^3 + 1 */
/* taps: bit21, bit15, bit3, bit0 */

lfsr32_step:
    push {r1-r4}
    mov     r1, r0          /* state-Kopie */
    mov     r4, #1          /* Maske für bit0 */

    /* ---- bit21 ---- */
    lsr     r2, r1, #21
    and     r2, r4          /* r2 = (state >> 21) & 1 */

    /* ---- bit15 ---- */
    lsr     r3, r1, #15
    and     r3, r4
    eor     r2, r2, r3

    /* ---- bit3 ---- */
    lsr     r3, r1, #3
    and     r3, r4
    eor     r2, r2, r3

    /* ---- bit0 ---- */
    mov     r3, r1          /* r3 = state */
    and     r3, r4          /* r3 = state & 1 */
    eor     r2, r2, r3      /* r2 = Feedbackbit */

    /* ---- shift ---- */
    lsr     r0, r0, #1      /* state >> 1 */

    /* ---- feedback in bit31 ---- */
    lsl     r2, r2, #31     /* legal in Thumb-1 */

    /* ---- einfügen ---- */
    orr     r0, r2
    pop {r1-r4}
    bx      lr
.end

