musHyruleFieldStart:
musHyruleFieldAStart:
	tempo 150

musHyruleFieldChannel1:
musHyruleFieldAChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 1
	transpose 0
	goto musHyruleFieldAChannel1Measure1
; Measure 2
	goto musHyruleFieldAChannel1Measure2
; Measure 3
	goto musHyruleFieldAChannel1Measure1	
; Measure 4
	transpose 2
	goto musHyruleFieldAChannel1Measure2
; Measure 5
	transpose 0
	goto musHyruleFieldAChannel1Measure1
; Measure 6
	goto musHyruleFieldAChannel1Measure2
; Measure 7
	transpose 5
	goto musHyruleFieldAChannel1Measure1
; Measure 8
	transpose 7
	goto musHyruleFieldAChannel1Measure2
	
	indexJump
	cmdff	

musHyruleFieldAChannel1Measure1:
; Measure 1
	octave 3
	env $0 $04
	duty $01
	vibrato $00
	vol HI_VOL
	beat b Q+E1 b E2+E1
	beat b E2 b E1 b E2

	endSec

musHyruleFieldAChannel1Measure2:
; Measure 2
	octave 4
	env $0 $00
	vol HI_VOL
	beat c HF+E1
	vol LO_VOL
	beat c E2+Q

	endSec

musHyruleFieldChannel0:
musHyruleFieldAChannel0:
	.redefine HI_VOL $5
	.redefine LO_VOL $3

; Measure 1
	env $0 $04
	duty $00
	vibrato $00
	transpose 0
	vol HI_VOL
	octave 3
	beat d Q+E1 d E2+E1
	beat d E2 d E1 d E2
; Measure 2
	env $0 $00
	beat e Q+E1

	goto musHyruleFieldAChannel0Measure2b
; Measure 2d-3
	goto musHyruleFieldAChannel0Measure2d
; Measure 4
	octave 3
	beat f Q+E1

	octave 6
	duty $02
	vibrato $a1
	beat f E2+E1 e S3 d S4
	beat c S1 d S2
; Measure 4d-5
	goto musHyruleFieldAChannel0Measure2d
; Measure 6
	octave 3
	beat e Q+E1

	goto musHyruleFieldAChannel0Measure2b
; Measure 6d
	octave 5
	beat b E2+Q+E1
	vol LO_VOL
	beat b E2+HF
; Measure 8
	vol HI_VOL
	beat a HF
	vol LO_VOL
	beat a Q r Q

	indexJump
	cmdff

musHyruleFieldAChannel0Measure2b:
; Measure 2b
	duty $02
	vibrato $a1
	octave 6
	beat e E2+E1 d S3 c S4
	octaved
	beat b S1 ou c S2

	endSec

musHyruleFieldAChannel0Measure2d:
	octave 5
	beat b E2+Q+E1 r E2+E1
; Measure 3c
	env $0 $04
	duty $00
	vibrato $00
	octave 3
	beat d E2 d E1 d E2
; Measure 4
	env $0 $00

	endSec

musHyruleFieldChannel4:
musHyruleFieldAChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $0f

; Measure 1-6
	transpose 0
beginLoop 6
	goto musHyruleFieldAChannel4Measure1
breakOrLoop
	transpose -2
	goto musHyruleFieldAChannel4Measure1
	transpose -4
	goto musHyruleFieldAChannel4Measure1

	indexJump
	cmdff

musHyruleFieldAChannel4Measure1:
; Measure 1
	duty HI_VOL
	octave 2
	beat g E1 r E2+E1
	beat g S3 r S4+E1
	beat g S3 r S4
	beat g E1 r E2

	endSec

musHyruleFieldChannel6:
musHyruleFieldAChannel6:
	.redefine HI_VOL $6
	.redefine LO_VOL $3
	.redefine HIT $2a

; Measure 1-8
beginLoop 8
	goto musHyruleFieldAChannel6Measure1
breakOrLoop

	indexJump
	cmdff

musHyruleFieldAChannel6Measure1:
; Measure 1
	vol LO_VOL
.rept 2
	beat HIT E1 HIT Y4 HIT Y5 HIT Y6
.endr
	beat HIT E1+S3 HIT S4 
	beat HIT S1 HIT S2 HIT S3 HIT S4

	endSec