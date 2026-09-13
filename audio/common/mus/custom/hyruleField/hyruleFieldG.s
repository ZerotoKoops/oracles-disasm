musHyruleFieldGStart:
	tempo 150

musHyruleFieldGChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 49-52
beginLoop 2
; Measure 49,51
	transpose 0
	vol HI_VOL
	vibrato $00
	env $0 $00
	duty $01
	octave 4
	beat c E1 r E2 od g Q
	octaveu
	beat c E1 r E2 g Q
; Measure 50,52
	transpose 11
	goto musHyruleFieldDChannel1Measure48
breakOrLoop
; Measure 53
	transpose 0
	vibrato $00
	vol HI_VOL
	octave 4
	beat fs E1 r E2 d Q
	beat fs E1 r E2 a Q
; Measure 54
	beat g E1 r E2 d Q
	beat g E1 r E2 b Q
; Measure 55
	octaveu
	beat c E1 r E2 od e Q
	beat g E1 r E2 ou e Q
; Measure 56
	env $0 $04
	beat g S1 g S2
	env $0 $00
	beat g E2+Q fs HF

	indexJump
	cmdff	


musHyruleFieldGChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $3

; Measre 49-54c
	goto musHyruleFieldGChannel0Measure49
; Measure 54d-55
	beat gs3 Q+W
; Measure 56
	env $0 $04
	duty $01
	vol HI_VOL
	octave 5
	beat c S1 c S2
	env $0 $00
	beat c E2+Q od a HF
	vol $0

	indexJump
	cmdff

musHyruleFieldGChannel0Measure49:
	vol $0
	beat gs3 Q
	transpose 0
beginLoop 2
; Measure 49b,51b
	beat gs3 Q+HF+Q
; Measure 50,52
	transpose $0
	vol HI_VOL
	env $0 $00
	duty $02
	vibrato $a1
	octave 5
	beat b S1 ou c S2 d S3 e S4
	beat fs S1 g S2 fs S3 g S4
	beat fs Q+Q
	vol $0
breakOrLoop
; Measure 53b
	beat gs3 Q+HF+HF+Q

	endSec

musHyruleFieldGChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 49-52
	transpose 5
beginLoop 2
; Measure 49,51
	goto musHyruleFieldAChannel4Measure1
; Measure 50,52
	goto musHyruleFieldGChannel4Measure50
breakOrLoop
; Measure 53
	transpose 4
	goto musHyruleFieldAChannel4Measure1
; Measure 54
	octave 3
	beat c E1 r E2+E1
	beat c S3 r S4+E1
	beat c S3 r S4
	beat od as E1 r E2
; Measure 55
	transpose 5
	goto musHyruleFieldAChannel4Measure1
; Measure 56
	transpose 7
	goto musHyruleFieldGChannel4Measure50

	indexJump
	cmdff

musHyruleFieldGChannel4Measure50:
; Measure 50
	octave 2
	duty HI_VOL
	beat g E1 r E2+E1
	beat g S3 r S4+E1
	beat g S3 r S4
	beat g S1 r S2
	beat g S3 r S4

	endSec

musHyruleFieldGChannel6:
	.redefine HI_VOL $5
	.redefine LO_VOL $3
	.redefine CRASH $2e
	.redefine HIT $2a

beginLoop 2
; Measure 49,51
	goto musHyruleFieldAChannel6Measure1
; Measure 50,52
	vol HI_VOL
	beat CRASH E1 CRASH E2+E1
	vol LO_VOL
	beat HIT S3 HIT S4
.rept 2
	vol HI_VOL
	beat CRASH E1+S3
	vol LO_VOL
	beat HIT S4
.endr
breakOrLoop
; Measure 53-56
beginLoop 4
	goto musHyruleFieldAChannel6Measure1
breakOrLoop

	indexJump
	cmdff
