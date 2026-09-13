musHyruleFieldBStart:
	tempo 150

musHyruleFieldBChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 9-10
	goto musHyruleFieldBChannel1Measure9
	goto musHyruleFieldBChannel1Measure9d
; Measure 11-12
	octave 4
	beat b S1 ou c S2
	beat d E2+Q+Q
	vol LO_VOL
	beat d Q+HF r HF
; Measure 13-14
	goto musHyruleFieldBChannel1Measure9
	goto musHyruleFieldBChannel1Measure9d
; Measure 15-16
	octave 5
	beat c S1 d S2
	octaved
	beat b E2+Q+Q
	vol LO_VOL
	beat b Q+HF r HF	

	indexJump
	cmdff	

musHyruleFieldBChannel1Measure9:
; Measure 9
	vol HI_VOL
	duty $01
	env $0 $04
	vibrato $00
	transpose 0
	octave 4
	beat g Q d Q g Q
	env $0 $00

	endSec

musHyruleFieldBChannel1Measure9d
	octave 5
	beat g Q
; Measure 10
	beat f HF 
	beat e R1+R2 d R3+R1 c R2+R3

	endSec

musHyruleFieldBChannel0:
	.redefine HI_VOL $5
	.redefine LO_VOL $3

; Measure 9-10
	goto musHyruleFieldBChannel0Measure9
	goto musHyruleFieldBChannel0Measure9d
; Measure 11
	octave 4
	beat d S1 e S2 f E2+Q
	octaveu
	beat d S1 e S2 f E2+Q
; Measure 12
	beat g S1 a S2 b E2+Q+Q r Q
; Measure 13-14
	goto musHyruleFieldBChannel0Measure9
	goto musHyruleFieldBChannel0Measure9d
; Measure 15
	octave 4
	beat e S1 f S2 d E2+Q+Q r Q
; Measure 16
	octaveu
	beat a S1 b S2 g E2+Q+Q r Q

	indexJump
	cmdff

musHyruleFieldBChannel0Measure9:
; Measure 9
	octave 3
	vol HI_VOL
	transpose 0
	duty $01
	env $0 $04
	vibrato $00
	beat b Q g Q b Q
	env $0 $00
	
	endSec

musHyruleFieldBChannel0Measure9d:
; Measure 9d
	octave 4
	beat b Q
; Measure 10
	beat a HF
	beat g R1+R2 f R3+R1 e R2 r R3

	endSec

musHyruleFieldBChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 9-16
beginLoop 4
	transpose 0
	goto musHyruleFieldAChannel4Measure1
	transpose -2
	goto musHyruleFieldAChannel4Measure1
breakOrLoop

	indexJump
musHyruleFieldBChannel6:
	cmdff


