musHyruleFieldUStart:
	tempo 141

musHyruleFieldUChannel1:
	.redefine HI_VOL $4
	.redefine LO_VOL $2

; Measure 161
	vol HI_VOL
	transpose 0
	vibrato $00
	env $0 $00
	duty $02
	octave 4
	beat g Q d Q+S1 r S2
	beat g S3 r S4
	beat g S1 a S2 b S3 ou c S4
; Measure 162
	beat d HF+E1+S3 r S4
	beat d E1 c S3 od b S4
; Measure 163
	octaveu
	beat c HF od g Q ou c E1+S3 r S4
; Measure 164
	beat c HF od a Q
	octaveu 
	beat c E1 od b S3 a T7 r T8
; Measure 165
	beat b HF d Q g E1+S3 r S4
; Measure 166
	beat g HF e Q g E1+S3 r S4
; Measure 167
	beat g HF+Q+E1 fs S3 e T7 r T8
; Measure 168
	transpose -12
	goto musHyruleFieldRChannel1Measure138
	
	indexJump
musHyruleFieldUChannel0:
	cmdff


musHyruleFieldUChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 161-162
	transpose 0
	goto musHyruleFieldSChannel4Measure145
; Measure 163-167
	transpose -12
	goto musHyruleFieldSChannel4Measure147
; Measure 168
	octave 4
	beat d W

	indexJump
	cmdff

musHyruleFieldUChannel6:
	cmdff
