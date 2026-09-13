musHyruleFieldTStart:
	tempo 141

musHyruleFieldTChannel1:
	.redefine HI_VOL $4
	.redefine LO_VOL $2

beginLoop 2
; Measure 153,155
	vol HI_VOL
	transpose 0
	vibrato $00
	env $0 $07
	duty $02
	octave 5
	beat g Q e Q g Q a Q
; Measure 154,156
	goto musHyruleFieldRChannel1Measure138
breakOrLoop
; Measure 157
	env $0 $07
	beat a Q fs Q a Q b Q 
; Measure 158
	transpose -7
	goto musHyruleFieldTChannel1Measure160c
	octave 6
	beat d R1+R2 e R3+R1 fs R2+Y5 r Y6
; Measure 159
	beat fs Q g E1+S3 r S4
	transpose -2
	goto musHyruleFieldTChannel1Measure160c
; Measure 160
	transpose 0
	octaved
	beat b Q ou c Q
	goto musHyruleFieldTChannel1Measure160c
	
	indexJump
musHyruleFieldTChannel0:
	cmdff

musHyruleFieldTChannel1Measure160c:
; Measure 160c
	octave 6
	env $0 $00
	beat d Q+E1
	vol LO_VOL
	beat d E2
	env $0 $07
	vol HI_VOL

	endSec


musHyruleFieldTChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

	duty LO_VOL
	transpose 0
beginLoop 2
; Measure 153,155
	octave 2
	beat c Q ou c Q e Q g Q
; Measure 154,156
	beat d Q a Q ou d Q fs Q
breakOrLoop
; Measure 157
	octave 1
	beat b Q ou b Q ou d Q fs Q
; Measure 158
	octaved
	beat b Q ou g Q b Q ou e Q
; Measure 159
	octave 2
	beat d Q ou c Q e Q a Q
; Measure 160
	beat d Q a Q ou d Q fs Q

	indexJump
	cmdff

musHyruleFieldTChannel6:
	cmdff
