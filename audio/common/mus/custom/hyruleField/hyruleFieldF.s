musHyruleFieldFStart:
	tempo 150

musHyruleFieldFChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 41
	goto musHyruleFieldFChannel1Measure41
; Measure 42-43
	goto musHyruleFieldFChannel1Measure42
; Measure 44
	octave 5
	beat c HF od a Q
	octaveu
	beat c E1 od b S3 a T7 r T8
; Measure 45
	beat b HF d Q g E1+S3 r S4
; Measure 46
	beat g HF e Q g E1+S3 r S4
; Measure 47
	beat g HF+Q+E1 fs S3 e T7 r T8
; Measure 48
	transpose 11
	goto musHyruleFieldDChannel1Measure48

	indexJump
	cmdff	

musHyruleFieldFChannel1Measure41:
; Measure 41
	transpose 0
	env $0 $00
	vol HI_VOL
	;duty $02
	vibrato $e1
	octave 4
	beat g E1+S3 r S4 d Q+S1 r S2
	beat g S1+T3 r T4
	beat g S1 a S2 b S3 ou c S4

	endSec

musHyruleFieldFChannel1Measure42:
; Measure 42
	beat d HF+E1 r E2
	beat d E1 c S3 od b S4
; Measure 43
	octaveu
	beat c HF od g Q ou c E1+S3 r S4
	
	endSec


musHyruleFieldFChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $3

; Measure 41
	transpose 4
	goto musHyruleFieldDChannel0Measure25
; Measure 42
	transpose 2
	goto musHyruleFieldDChannel0Measure25
; Measure 43-46
	transpose 0
beginLoop 4
	goto musHyruleFieldDChannel0Measure25
breakOrLoop
; Measure 47
	vol HI_VOL
	octave 3
	beat g HF a HF
; Measure 48
	transpose -1
	goto musHyruleFieldDChannel0Measure25
	vol $0

	indexJump
	cmdff


musHyruleFieldFChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 41
	transpose 0
	goto musHyruleFieldAChannel4Measure1
; Measure 42
	transpose -2
	goto musHyruleFieldAChannel4Measure1	
; Measure 43
	transpose -3
	goto musHyruleFieldAChannel4Measure1	
; Measure 44
	transpose -4
	goto musHyruleFieldAChannel4Measure1	
; Measure 45
	transpose -5
	goto musHyruleFieldAChannel4Measure1
; Measure 46
	transpose -10
	goto musHyruleFieldAChannel4Measure1	
; Measure 47
	transpose -5
	goto musHyruleFieldAChannel4Measure1	
; Measure 48
	goto musHyruleFieldAChannel4Measure1

	indexJump
musHyruleFieldFChannel6:
	cmdff
