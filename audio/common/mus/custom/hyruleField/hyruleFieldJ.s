musHyruleFieldJStart:
	tempo 150

musHyruleFieldJChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 73
	duty $02
	vibrato $a1
	vol HI_VOL-1
	transpose 0
	goto musHyruleFieldJChannel1Measure73
; Measure 74
	vol HI_VOL
	transpose 3
	goto musHyruleFieldJChannel1Measure73
; Measure 75
	vol HI_VOL+1
	transpose 6
	goto musHyruleFieldJChannel1Measure73
; Measure 76
	vol HI_VOL+2
	transpose 9
	goto musHyruleFieldJChannel1Measure73
; Measure 77
	env $0 $00
	transpose 16
	goto musHyruleFieldDChannel1Measure77
; Measure 78
	vol $0
	beat gs3 W
; Measure 79
	vol HI_VOL+1
	vibrato $a1
	octave 3
	beat as HF+Q+R1 a R2 gs R3
; Measure 80
	goto musHyruleFieldDChannel1Measure48

	indexJump
	cmdff	

musHyruleFieldJChannel1Measure73:
; Measure 73
	octave 3
	env $0 $04
beginLoop 2
	beat b R1+R2 b R3+R1 b R2 ou cs R3
breakOrLoop

	endSec

musHyruleFieldJChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $3

; Measure 73
	vol HI_VOL-1
	duty $03
	transpose -4
	goto musHyruleFieldJChannel1Measure73
; Measure 74
	vol HI_VOL
	transpose -1
	goto musHyruleFieldJChannel1Measure73
; Measure 75
	vol HI_VOL+1
	transpose 2
	goto musHyruleFieldJChannel1Measure73
; Measure 76
	vol HI_VOL+2
	transpose 5
	goto musHyruleFieldJChannel1Measure73
; Measure 77 (M17C1)
	goto musHyruleFieldBChannel1Measure9
	octave 5
	beat d Q
; Measure 78 (M18C1)
	env $0 $04
	beat c Q od a Q ou c Q
	env $0 $00
	beat f Q
; Measure 79
	vol HI_VOL+1
	octave 4
	beat b HF+Q+R1 a R2 gs R3
; Measure 80
	transpose 12
	goto musHyruleFieldDChannel1Measure48

	indexJump
	cmdff


musHyruleFieldJChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 73
	transpose 0
	goto musHyruleFieldAChannel4Measure1
; Measure 74
	transpose 3
	goto musHyruleFieldAChannel4Measure1
; Measure 75
	transpose 6
	goto musHyruleFieldAChannel4Measure1
; Measure 76
	transpose 9
	goto musHyruleFieldAChannel4Measure1
; Measure 77-80
beginLoop 2
; Measure 77,79
	transpose 0
	goto musHyruleFieldAChannel4Measure1
; Measure 78,80
	transpose -2
	goto musHyruleFieldAChannel4Measure1
breakOrLoop

	indexJump
musHyruleFieldJChannel6:
	cmdff
