musHyruleFieldMStart:
	tempo 150

musHyruleFieldMChannel1:
	.redefine HI_VOL $7
	.redefine LO_VOL $4

; Measure 97
	goto musHyruleFieldFChannel1Measure41
; Measure 98-99
	goto musHyruleFieldFChannel1Measure42
; Measure 100-101
	duty $01
	vol HI_VOL
	goto musHyruleFieldMChannel1Measure100
	octave 4
	beat gs Q
; Measure 102-103
	goto musHyruleFieldMChannel1Measure102
; Measure 104
	vol $0
	beat gs3 W

	indexJump
	cmdff

musHyruleFieldMChannel1Measure100:
; Measure 100
	env $0 $02
	vibrato $00
	octave 4
beginLoop 3
	beat gs R1 gs Y3 gs Y4 gs R3
	beat as R1 as R2 as R3
breakOrLoop
; Measure 101c
	octave 5
	beat c R1 od as R2 ou c R3
	env $0 $6

	endSec

musHyruleFieldMChannel1Measure102:
; Measure 102
	;env $0 $06
	octave 5
	beat fs R1 e R2 fs R3
	beat d Q
	octaved
	beat as R1 gs R2 as R3
	beat fs Q
; Measure 103
	beat e R1 d R2 c R3
	octaved
	beat gs Q+HF

	endSec


musHyruleFieldMChannel0:
	.redefine HI_VOL $5
	.redefine LO_VOL $4

; Measure 97-99
	vol $0
	beat gs3 W+W gs3 W
; Measure 100
	vol HI_VOL
	duty $03
	transpose -7
	goto musHyruleFieldMChannel1Measure100
	octave 4
	beat g Q
; Measure 102-103
	transpose -4
	goto musHyruleFieldMChannel1Measure102
; Measure 104
	duty $02
	env $0 $07
	vol HI_VOL+3
	octave 3
	beat g R1 f R2 ds R3
	octaved
	beat b Q+HF

	indexJump
	cmdff

musHyruleFieldMChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 97
	transpose 0
	goto musHyruleFieldAChannel4Measure1
; Measure 98
	transpose -2
	goto musHyruleFieldAChannel4Measure1
; Measure 99
	transpose 9
	goto musHyruleFieldAChannel4Measure1
; Measure 100
	transpose 8
	goto musHyruleFieldAChannel4Measure1
; Measure 101-104
beginLoop 2
; Measure 101,103
	transpose 0
	goto musHyruleFieldAChannel4Measure1
; Measure 102,104
	transpose -2
	goto musHyruleFieldAChannel4Measure1
breakOrLoop

	indexJump
musHyruleFieldMChannel6:
	cmdff
