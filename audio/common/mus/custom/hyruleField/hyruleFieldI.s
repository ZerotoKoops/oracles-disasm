musHyruleFieldIStart:
	tempo 150

musHyruleFieldIChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 65-72
beginLoop 2
; Measure 65
	vol HI_VOL
	transpose 0
	duty $01
	goto musHyruleFieldIChannel1Measure65
; Measure 66a
	octave 4
	beat e R2 od g R3+Q+Q+E1 r E2
; Measure 67
	goto musHyruleFieldIChannel1Measure65
; Measure 68a
	octave 4
	beat a R2 b R3+Q+Q+E1 r E2
breakOrLoop
	
	indexJump
	cmdff	

musHyruleFieldIChannel1Measure65:
; Measure 65
	env $0 $04
	vibrato $a1
	octave 4
	beat f Q r R1 f R2 f R3
	beat f E1 f E2 f R1
	env $0 $00
	beat e R2 c R3
; Measure 66
	beat d R1
	endSec

musHyruleFieldIChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $3

; Measure 65-68
	vol $0
	beat gs3 W+W gs3 W+W
; Measure 69
	duty $03
	vol LO_VOL
	transpose 12
	goto musHyruleFieldIChannel1Measure65
; Measure 70a
	octave 4
	beat e R2 od g R3+Q+Q+E1 r E2
; Measure 71
	goto musHyruleFieldIChannel1Measure65
; Measure 72a
	octave 4
	beat a R2 b R3+Q+Q+E1 r E2

	indexJump
	cmdff


musHyruleFieldIChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 65-72
	transpose 0
beginLoop 8
	goto musHyruleFieldAChannel4Measure1
breakOrLoop

	indexJump
musHyruleFieldIChannel6:
	cmdff
