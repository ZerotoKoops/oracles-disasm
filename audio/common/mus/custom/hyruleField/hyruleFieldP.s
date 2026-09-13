musHyruleFieldPStart:
	tempo 150

musHyruleFieldPChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 121
	vol $0
	beat gs3 W
; Measure 122-124
	goto musHyruleFieldPChannel1Measure122
; Measure 125
	goto musHyruleFieldFChannel1Measure41
; Measure 126
	;transpose 0
	goto musHyruleFieldPChannel1Measure126
	transpose 3
	goto musHyruleFieldPChannel1Measure126
; Measure 127
	transpose 6
	goto musHyruleFieldPChannel1Measure126
	transpose 0
	goto musHyruleFieldPChannel1Measure126
; Measure 128
	octave 5
	beat d HF r HF
	
	indexJump
	cmdff	

musHyruleFieldPChannel1Measure126:
; Measure 126
	octave 5
	beat d R1 r R2 ds R3 d Q

	endSec

musHyruleFieldPChannel1Measure122:
; Measure 122
	transpose 0
	vol HI_VOL
	duty $01
	vibrato $00
beginLoop 2
	env $0 $04
	octave 5
	beat cs R1 cs R2 cs R3
	env $0 $00
	beat cs Q
	transpose -6
breakOrLoop
; Measure 123-124
	transpose 0
	env $0 $04
	octave 5
	beat fs R1 fs R2 fs R3
	env $0 $00
	beat fs Q+HF+E1 r E2+Q+HF

	endSec


musHyruleFieldPChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $3

; Measure 121-128
	vol $0
beginLoop 4
; Measure 121
	beat gs3 Q
	octave 5
	goto musHyruleFieldPChannel0Measure121
	beat gs3 Q
	vol HI_VOL
	beat d W1 e W2 g W3 a W4 b Y3+E2 r Q
; Measure 122b
	beat ds W1 f W2 g W3 a W4 b Y3+E2 r Q
	goto musHyruleFieldPChannel0Measure121
breakOrLoop	

	indexJump
	cmdff

musHyruleFieldPChannel0Measure121:
; Measure 121
	env $0 $00
	transpose 0
	duty $00
	vibrato $01
	vol HI_VOL
	octave 5
	beat d W1 e W2 fs W3 gs W4 as Y3+E2
	vol $0

	endSec


musHyruleFieldPChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 121-128
beginLoop 4
; Measure 121
	transpose 0
	goto musHyruleFieldNChannel4Measure105
; Measure 122
	goto musHyruleFieldNChannel4Measure122
breakOrLoop

	indexJump
musHyruleFieldPChannel6:
	cmdff
