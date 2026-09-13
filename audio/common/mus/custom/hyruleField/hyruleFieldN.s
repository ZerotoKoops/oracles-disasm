musHyruleFieldNStart:
	tempo 150

musHyruleFieldNChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 105
	transpose 0
	duty $01
	env $0 $00
	vibrato $00
	vol HI_VOL
	octave 4
	beat g E1 r E2 d HF r Q
; Measure 106
	beat fs E1 r E2 d HF r Q
; Measure 107
	octaveu
	beat d E1 r E2 od gs HF r Q
; Measure 108
	beat d E1 r E2 od a HF r Q

; Measure 109
	goto musHyruleFieldNChannel1Measure109
	transpose 6
	goto musHyruleFieldNChannel1Measure109
; Measure 110
	transpose 0
	goto musHyruleFieldNChannel1Measure109
	transpose 2
	goto musHyruleFieldNChannel1Measure109
; Measure 111-112
	transpose 0
beginLoop 3
	goto musHyruleFieldNChannel1Measure109
breakOrLoop
; Measure 112c
	octave 4
	beat as R1 gs R2 as R3
	octaveu
	beat cs R1 od b R2 ou cs R3

	indexJump
	cmdff
	
musHyruleFieldNChannel1Measure109:
; Measure 109c
	env $0 $04
	octave 4
	beat gs R1 gs R2 gs R3
	env $0 $00
	beat gs R1 fs R2 gs R3

	endSec


musHyruleFieldNChannel0:
	.redefine HI_VOL $6
	.redefine LO_VOL $4

; Measure 105
	transpose 0
	vol $0
	beat gs3 HF
	vol HI_VOL
	duty $03
	env $0 $00
	vibrato $00
	octave 4
	beat c E1 r E2 od gs HF
; Measure 106
	goto musHyruleFieldNChannel0Measure106
; Measure 106c
	vol HI_VOL
	duty $03
	env $0 $00
	octave 4
	beat b E1 r E2 fs Q+Q r Q
; Measure 107c-108
	octaveu
	beat e E1 r E2 od b Q+Q r Q+HF
; Measure 109
	transpose -6
	goto musHyruleFieldNChannel1Measure109
	transpose 2
	goto musHyruleFieldNChannel1Measure109
; Measure 110
	transpose -6
	goto musHyruleFieldNChannel1Measure109
	transpose -4
	goto musHyruleFieldNChannel1Measure109
; Measure 111
	transpose -6
beginLoop 3
	goto musHyruleFieldNChannel1Measure109
breakOrLoop
; Measure 112
	beat as R1 gs R2 as R3
	octaveu
	beat cs R1 od b R2 ou cs R3

	indexJump
	cmdff

musHyruleFieldNChannel0Measure106:
; Measure 106
	duty $02
	env $0 $07
	vol HI_VOL+2
	octave 3
	beat c S1 od gs S2 e S3 d S4

	endSec

musHyruleFieldNChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 105-112
	transpose 0
beginLoop 8
	goto musHyruleFieldNChannel4Measure105
breakOrLoop

	indexJump
	cmdff

musHyruleFieldNChannel4Measure105:
; Measure 105
	octave 2
	duty HI_VOL
	beat g T1 r T2
	beat g T3 r T4
	beat g S3 r S4
	beat g E1 r E2

	beat g S1 r S2
	beat g S3 r S4
	beat g E1 r E2

	endSec

musHyruleFieldNChannel4Measure122:
; Measure 122
	octave 2
	transpose 0
	duty HI_VOL
	beat gs T1 r T2
	beat gs T3 r T4
	beat gs S3 r S4
	beat gs E1 r E2

	beat g S1 r S2
	beat g S3 r S4
	beat g E1 r E2

	endSec

musHyruleFieldNChannel6:
	.redefine HI_VOL $5
	.redefine LO_VOL $3
	.redefine CRASH $24
	.redefine HIT $2a

; Measure 105-112
beginLoop 8
	vol LO_VOL
	beat HIT E1 HIT E2
.rept 2
	beat HIT E1 HIT Y4 HIT Y5 HIT Y6
.endr
	beat HIT E1 r E2
breakOrLoop

	indexJump
	cmdff
