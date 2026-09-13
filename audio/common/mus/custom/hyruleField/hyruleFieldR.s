musHyruleFieldRStart:
	tempo 141

musHyruleFieldRChannel1:
	.redefine HI_VOL $5
	.redefine LO_VOL $3

	vol HI_VOL
	vibrato $a1
	env $0 $00
beginLoop 2
; Measure 137,139
	transpose 0
	duty $02
	octave 5
	beat c E1 r E2 od g Q
	octaveu
	beat c E1 r E2 g Q
; Measure 138,140
	goto musHyruleFieldRChannel1Measure138
breakOrLoop
; Measure 141
	vol HI_VOL
	beat fs E1 r E2 d Q
	beat fs E1 r E2 a Q
; Measure 142
	beat g Q+E1+S3 r S4
	beat g R1+R2 d R3+R1 g R2 r R3
; Measure 143
	octaveu
	beat c HF od b R1+R2 g R3+R1 e R2+R3
; Measure 144
	transpose 3
	goto musHyruleFieldRChannel1Measure138

	indexJump
	cmdff	

musHyruleFieldRChannel1Measure138:
; Measure 138
	env $0 $00
	beat fs HF+E1+S3
	vol LO_VOL
	vibrato $01
	beat fs S4+Q
	vibrato $a1
	vol HI_VOL

	endSec

musHyruleFieldRChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $3

.rept 2
; Measure 137,139
	goto musHyruleFieldRChannel0Measure137
; Measure 138,140
	goto musHyruleFieldRChannel0Measure138
.endr
; Measure 141
beginLoop 2
	octave 3
	beat b R1 ou d R2 e R3 a Q
breakOrLoop
; Measure 142
beginLoop 2
	beat e R1 g R2 a R3 b Q
breakOrLoop
; Measure 143
	goto musHyruleFieldRChannel0Measure143
; Measure 144
	beat d R1 g R2 a R3 ou c Q
	octaved
	beat d R1 fs R2 a R3 ou c Q

	indexJump
	cmdff

musHyruleFieldRChannel0Measure137:
; Measure 137
	transpose 0
	env $0 $03
	duty $03
	vol HI_VOL
	vibrato $a1
beginLoop 2
	octave 4
	beat c R1 d R2 e R3 g Q
breakOrLoop

	endSec

musHyruleFieldRChannel0Measure138:
; Measure 138
beginLoop 2
	octave 4
	beat c R1 d R2 e R3 a Q
breakOrLoop
	
	endSec

musHyruleFieldRChannel0Measure143:
; Measure 143
beginLoop 2
	beat c R1 e R2 g R3 a Q
breakOrLoop

	endSec

musHyruleFieldRChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

	duty LO_VOL
	transpose 0
	octave 3
.redefine NOTE_END_WAIT S4
beginLoop 2
; Measure 137,139
	beat c HF+Q c Q
; Measure 138,140
	beat c W
breakOrLoop
; Measure 141
	octaved
	beat b HF+Q b Q
; Measure 142
.redefine NOTE_END_WAIT 0
	octaveu
	beat e HF+Q d Q
; Measure 143
	beat c W
; Measure 144
	beat d W

	indexJump
	cmdff

musHyruleFieldRChannel6:
	.redefine HI_VOL $5
	.redefine LO_VOL $3

	vol $0
beginLoop 4
	beat r W+W
breakOrLoop

	indexJump
	cmdff
