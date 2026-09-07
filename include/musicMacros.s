; Musical notes, usable on square & wave channels
.enum $0
	c1: db
	cs1: db
	d1: db
	ds1: db
	e1: db
	f1: db
	fs1: db
	g1: db
	gs1: db
	a1: db
	as1: db
	b1: db
	c2: db
	cs2: db
	d2: db
	ds2: db
	e2: db
	f2: db
	fs2: db
	g2: db
	gs2: db
	a2: db
	as2: db
	b2: db
	c3: db
	cs3: db
	d3: db
	ds3: db
	e3: db
	f3: db
	fs3: db
	g3: db
	gs3: db
	a3: db
	as3: db
	b3: db
	c4: db
	cs4: db
	d4: db
	ds4: db
	e4: db
	f4: db
	fs4: db
	g4: db
	gs4: db
	a4: db
	as4: db
	b4: db
	c5: db
	cs5: db
	d5: db
	ds5: db
	e5: db
	f5: db
	fs5: db
	g5: db
	gs5: db
	a5: db
	as5: db
	b5: db
	c6: db
	cs6: db
	d6: db
	ds6: db
	e6: db
	f6: db
	fs6: db
	g6: db
	gs6: db
	a6: db
	as6: db
	b6: db
	c7: db
	cs7: db
	d7: db
	ds7: db
	e7: db
	f7: db
	fs7: db
	g7: db
	gs7: db
	a7: db
	as7: db
	b7: db
	c8: db
	cs8: db
	d8: db
	ds8: db
	e8: db
	f8: db
	fs8: db
	g8: db
	gs8: db
	a8: db
	as8: db
	b8: db
.ende

; Other values that can be use within note/beat macros
.redefine od (-1) ; octave down
.redefine ou (-2) ; octave up
.redefine r (-3)  ; rest

; Define relative notes names within a given octave
.macro octave
	.redefine OCTAVE \1
	.redefine OFFSET (-$c)

	.redefine c 12*\1+0 + OFFSET
	.redefine cs 12*\1+1 + OFFSET
	.redefine d 12*\1+2 + OFFSET
	.redefine ds 12*\1+3 + OFFSET
	.redefine e 12*\1+4 + OFFSET
	.redefine f 12*\1+5 + OFFSET
	.redefine fs 12*\1+6 + OFFSET
	.redefine g 12*\1+7 + OFFSET
	.redefine gs 12*\1+8 + OFFSET
	.redefine a 12*\1+9 + OFFSET
	.redefine as 12*\1+10 + OFFSET
	.redefine b 12*\1+11 + OFFSET
.endm

.macro octaved
	octave OCTAVE-1
.endm
.macro octaveu
	octave OCTAVE+1
.endm

.macro m_soundPointer
	.db :\1Start - :b39_initSound ; Bank number
	.dw \1 ; Pointer
.endm

; Byte 1: frequency
; Byte 2: length
;
; Frequencies for noise:
; 22,23,24,26,27,28,29,2a,2e,2f,30,32,52
.macro note
	.redefine offset 0
	.rept NARGS
	.if NARGS >= 1
		.if \1 == od
			octaved
			.redefine offset offset-12
			.shift
		.else
		.if \1 == ou
			octaveu
			.redefine offset offset+12
			.shift
		.endif
		.endif
	.endif

	.if NARGS >= 2
	.if \1 == r
		rest \2
		.shift
		.shift
	.else
	.if \1 >= 0
		.db \1+offset
		.db \2

		.shift
		.shift
	.endif
	.endif
	.endif
	.endr
.endm

; This is NOT used by the base game; it's an attempt to provide a more sane way to define music
; (multiple notes per line). Each pair of arguments is a note followed by a length. Can define
; "NOTE_END_WAIT" to set a certain amount of a note to be "rest" instead of being actually played.
.macro beat
	.redefine offset 0
	.rept NARGS
	.if NARGS >= 1
		.if \1 == od
			octaved
			.redefine offset offset-12
			.shift
		.else
		.if \1 == ou
			octaveu
			.redefine offset offset+12
			.shift
		.endif
		.endif
	.endif

	.if NARGS >= 2
	.if \1 == r
		rest \2*BEAT
		.shift
		.shift
	.else
	.if \1 >= 0
		.db \1+offset

		.ifndef NOTE_END_WAIT
			.define NOTE_END_WAIT 0
		.endif

		.if NOTE_END_WAIT != 0
			.db \2*BEAT - NOTE_END_WAIT
			rest NOTE_END_WAIT
		.else
			.db \2*BEAT
		.endif

		.shift
		.shift
	.endif
	.endif
	.endif
	.endr
.endm

; 60/61: set wait counters.

.macro rest
	.db $60 \1
.endm

.macro rest2 ; Unused?
	.db $61 \1
.endm

; d0-df: set volume
.macro vol
	.if \1 > $f
		.fail
	.endif
	.db $d0 | \1
.endm

; e0-e7: set envelopes
.macro env
	.if \1 > $7
		.fail
	.endif
	.db $e0 | \1
	.db \2
.endm

; e8-ef: same as e0-e7

; f0: unknown
; Sometimes sets wc039
.macro cmdf0
	.db $f0 \1
.endm

; f1-f3: does nothing
.macro cmdf1
	.db $f1
.endm
.macro cmdf2
	.db $f2
.endm
.macro cmdf3
	.db $f3
.endm

; f4-f5: duplicates of ff?
.macro cmdf4
	.db $f4
.endm
.macro cmdf5
	.db $f5
.endm

; f6: sets wChannelDutyCycles
.macro duty
	.db $f6 \1
.endm

; f7: duplicate of ff?

; f8: sets wc03f (for channels 0-5)
.macro cmdf8
	.db $f8 \1
.endm

; f9: sets wChannelVibratos.
; Upper nibble is time to wait until vibrato starts.
; Lower nibble is intensity of vibrato.
.macro vibrato
	.db $f9 \1
.endm

; fa-fc: duplicates of ff?

; fd: sets wc033
; Shifts pitch
.macro cmdfd
	.db $fd \1
.endm

; fe: jump to the given address
.macro goto
	.db $fe
	.dw \1
.endm

; ff: might mute the channel?
.macro cmdff
	.db $ff
.endm


; Parameters:
;   \1: Index
;   \2: Name
.macro m_waveform
	.DEFINE \2, \1 EXPORT
	@waveform{%.2x{\1}}:
.endm


.macro tempo
	.redefine BEAT 1
	.redefine NOTE_END_WAIT 0
	.redefine Q (150*24 - (150*24) # \1) / \1
	
	.if 2*((150*24) # \1) >= \1
		.redefine Q Q+1
	.endif
	
	.redefine F1 (Q - (Q # 16))/16
	.redefine F2 (Q * 2 - ((Q * 2) # 16))/16 - F1
	.redefine F3 (Q * 3 - ((Q * 3) # 16))/16 - (F1+F2)
	.redefine F4 (Q * 4 - ((Q * 4) # 16))/16 - (F1+F2+F3)
	.redefine F5 (Q * 5 - ((Q * 5) # 16))/16 - (F1+F2+F3+F4)
	.redefine F6 (Q * 6 - ((Q * 6) # 16))/16 - (F1+F2+F3+F4+F5)
	.redefine F7 (Q * 7 - ((Q * 7) # 16))/16 - (F1+F2+F3+F4+F5+F6)
	.redefine F8 (Q * 8 - ((Q * 8) # 16))/16 - (F1+F2+F3+F4+F5+F6+F7)
	.redefine F9 (Q * 9 - ((Q * 9) # 16))/16 - (F1+F2+F3+F4+F5+F6+F7+F8)
	.redefine F10 (Q * 10 - ((Q * 10) # 16))/16 - (F1+F2+F3+F4+F5+F6+F7+F8+F9)
	.redefine F11 (Q * 11 - ((Q * 11) # 16))/16 - (F1+F2+F3+F4+F5+F6+F7+F8+F9+F10)
	.redefine F12 (Q * 12 - ((Q * 12) # 16))/16 - (F1+F2+F3+F4+F5+F6+F7+F8+F9+F10+F11)
	.redefine F13 (Q * 13 - ((Q * 13) # 16))/16 - (F1+F2+F3+F4+F5+F6+F7+F8+F9+F10+F11+F12)
	.redefine F14 (Q * 14 - ((Q * 14) # 16))/16 - (F1+F2+F3+F4+F5+F6+F7+F8+F9+F10+F11+F12+F13)
	.redefine F15 (Q * 15 - ((Q * 15) # 16))/16 - (F1+F2+F3+F4+F5+F6+F7+F8+F9+F10+F11+F12+F13+F14)
	.redefine F16 (Q * 16 - ((Q * 16) # 16))/16 - (F1+F2+F3+F4+F5+F6+F7+F8+F9+F10+F11+F12+F13+F14+F15)

; at least one of these is zero?
	.if F1*F2*F3*F4*F5*F6*F7*F8*F9*F10*F11*F12*F13*F14*F15*F16 == 0
		; TODO: add a warning here
	.endif

	.redefine T1 F1+F2
	.redefine T2 F3+F4
	.redefine T3 F5+F6
	.redefine T4 F7+F8
	.redefine T5 F9+F10
	.redefine T6 F11+F12
	.redefine T7 F13+F14
	.redefine T8 F15+F16
	
	.redefine S1 T1+T2
	.redefine S2 T3+T4
	.redefine S3 T5+T6
	.redefine S4 T7+T8
	.redefine E1 S1+S2
	.redefine E2 S3+S4
	.redefine HF Q*2
	.redefine W Q*4
	
	.redefine W1 (Q - (Q # 12))/12
	.redefine W2 (Q * 2 - ((Q * 2) # 12))/12 - W1
	.redefine W3 (Q * 3 - ((Q * 3) # 12))/12 - (W1+W2)
	.redefine W4 (Q * 4 - ((Q * 4) # 12))/12 - (W1+W2+W3)
	.redefine W5 (Q * 5 - ((Q * 5) # 12))/12 - (W1+W2+W3+W4)
	.redefine W6 (Q * 6 - ((Q * 6) # 12))/12 - (W1+W2+W3+W4+W5)
	.redefine W7 (Q * 7 - ((Q * 7) # 12))/12 - (W1+W2+W3+W4+W5+W6)
	.redefine W8 (Q * 8 - ((Q * 8) # 12))/12 - (W1+W2+W3+W4+W5+W6+W7)
	.redefine W9 (Q * 9 - ((Q * 9) # 12))/12 - (W1+W2+W3+W4+W5+W6+W7+W8)
	.redefine W10 (Q * 10 - ((Q * 10) # 12))/12 - (W1+W2+W3+W4+W5+W6+W7+W8+W9)
	.redefine W11 (Q * 11 - ((Q * 11) # 12))/12 - (W1+W2+W3+W4+W5+W6+W7+W8+W9+W10)
	.redefine W12 (Q * 12 - ((Q * 12) # 12))/12 - (W1+W2+W3+W4+W5+W6+W7+W8+W9+W10+W11)
	
	.redefine Y1 W1+W2
	.redefine Y2 W3+W4
	.redefine Y3 W5+W6
	.redefine Y4 W7+W8
	.redefine Y5 W9+W10
	.redefine Y6 W11+W12
	.redefine R1 Y1+Y2
	.redefine R2 Y3+Y4
	.redefine R3 Y5+Y6

	.redefine X1 (Q - (Q # 10))/10
	.redefine X2 (Q * 2 - ((Q * 2) # 10))/10 - X1
	.redefine X3 (Q * 3 - ((Q * 3) # 10))/10 - (X1+X2)
	.redefine X4 (Q * 4 - ((Q * 4) # 10))/10 - (X1+X2+X3)
	.redefine X5 (Q * 5 - ((Q * 5) # 10))/10 - (X1+X2+X3+X4)
	.redefine X6 (Q * 6 - ((Q * 6) # 10))/10 - (X1+X2+X3+X4+X5)
	.redefine X7 (Q * 7 - ((Q * 7) # 10))/10 - (X1+X2+X3+X4+X5+X6)
	.redefine X8 (Q * 8 - ((Q * 8) # 10))/10 - (X1+X2+X3+X4+X5+X6+X7)
	.redefine X9 (Q * 9 - ((Q * 9) # 10))/10 - (X1+X2+X3+X4+X5+X6+X7+X8)
	.redefine X10 (Q * 10 - ((Q * 10) # 10))/10 - (X1+X2+X3+X4+X5+X6+X7+X8+X9)

	.redefine Q1 X1+X2
	.redefine Q2 X3+X4
	.redefine Q3 X5+X6
	.redefine Q4 X7+X8
	.redefine Q5 X9+X10
.endm

;;
; \1: First pitch
; \2: Second pitch
; \3: repeats of tremolo before holding - 0 if to fill full length
; \4: total note length
; \5: length of first tremolo note
; \6: length of second tremolo note
.macro m_tremolo
.if \3 > 0
    .if \4 <= \3*(\5+\6)
        .fail
    .endif

    .rept \3
        beat \1 \5 \2 \6
    .endr
        beat \1 (\4-(\3*(\5+\6)))
.else
    .redefine WORKING_2 \5+\6
    .redefine WORKING_1 \4 # WORKING_2
    .redefine WORKING_3 (\4 - WORKING_1) / WORKING_2

    .rept WORKING_3
        beat \1 \5 \2 \6
    .endr
        beat \1 (\4-WORKING_3*WORKING_2)

    .undefine WORKING_1
    .undefine WORKING_2
    .undefine WORKING_3
.endif
.endm