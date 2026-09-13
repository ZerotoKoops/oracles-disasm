musHyruleFieldSStart:
	tempo 141

musHyruleFieldSChannel1:
	.redefine HI_VOL $4
	.redefine LO_VOL $2

; Measure 145
	vol HI_VOL
	transpose 0
	vibrato $a1
	env $0 $00
	duty $02
	octave 5
	beat g HF d HF
; Measure 146
	beat g HF ou d HF
; Measure 147
	beat c HF+Q od b E1 a E2
; Measure 148
	beat g HF ds HF
; Measure 149
	beat d HF+E1+S3 r S4 d Q
; Measure 150
	beat e HF fs Q g Q
; Measure 151
	beat fs S1 g S2+E2+HF
	beat a E1 g E2
; Measure 152
	goto musHyruleFieldRChannel1Measure138

	indexJump
	cmdff	

musHyruleFieldSChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $3

; Measure 145
	transpose -5
	goto musHyruleFieldRChannel0Measure137
; Measure 146
	transpose -7
	goto musHyruleFieldRChannel0Measure137
; Measure 147
	transpose 0
	goto musHyruleFieldRChannel0Measure137
; Measure 148
beginLoop 2
	octave 4
	beat c R1 d R2 ds R3 g Q
breakOrLoop
; Measure 149
beginLoop 2
	octaved
	beat b R1 ou c R2 d R3 g Q
breakOrLoop
; Measure 150
beginLoop 2
	beat d R1 e R2 g R3 a Q
breakOrLoop
; Measure 151
	goto musHyruleFieldRChannel0Measure143
; Measure 152
	octave 3
	vol HI_VOL-1
	beat a R1 ou c R2 d R3
	vol HI_VOL
	beat fs R1 a R2 ou c R3
	vol HI_VOL+1
	beat d R1 fs R2 a R3
	octaveu
	vol HI_VOL+2
	beat c R1 d R2+R3

	indexJump
	cmdff


musHyruleFieldSChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 145-146
	transpose 0
	goto musHyruleFieldSChannel4Measure145
; Measure 147-151
	goto musHyruleFieldSChannel4Measure147
; Measure 152
.redefine NOTE_END_WAIT 0
	octave 3
	beat d W

	indexJump
musHyruleFieldSChannel6:
	cmdff

musHyruleFieldSChannel4Measure145:
; Measure 145
	duty LO_VOL
.redefine NOTE_END_WAIT S4
	octave 2
	beat g HF+Q g Q
; Measure 146
.redefine NOTE_END_WAIT 0
	beat f W

	endSec

musHyruleFieldSChannel4Measure147:
; Measure 147
.redefine NOTE_END_WAIT S4
	octaveu
	beat e HF+Q e Q
; Measure 148
.redefine NOTE_END_WAIT 0
	beat ds W
; Measure 149
.redefine NOTE_END_WAIT S4
	beat d HF+Q d Q
; Measure 150
	octaved
	beat a HF+Q a Q
; Measure 151
	octaveu
	beat d W
.redefine NOTE_END_WAIT 0
	endSec

