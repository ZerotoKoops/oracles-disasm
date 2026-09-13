musHyruleFieldOStart:
	tempo 150

musHyruleFieldOChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 113
	vol HI_VOL
	transpose 0
	duty $01
	env $0 $00
	vibrato $00
	octave 4
	beat b S1 r S2 b S3 ou cs S4
	beat d HF+E1 r E2
; Measure 114
	octaved
	beat gs S1 r S2 gs S3 as S4
	beat b HF+E1 r E2+HF
; Measure 115c
	beat d S1 r S2 d S3 e S4
	beat f HF+E1 r E2
; Measure 116c
	octave 3
	env $0 $03
beginLoop 2
	beat g R1 g R2 cs R3
	octaved
	beat g R1 g R2 ou cs R3
breakOrLoop
; Measure 117c
	octave 3
beginLoop 2
	beat g R1 d R2 od g R3
breakOrLoop
; Measure 118-120
	goto musHyruleFieldOChannel1Measure118

	indexJump
	cmdff	

musHyruleFieldOChannel1Measure118:
; Measure 118
	env $0 $03
	octave 3
	beat gs R1 gs R2 cs R3
	octaved
	beat gs R1 gs R2 ou cs R3
	octave 3
	beat gs R1 gs R2 cs R3
	octaved
	beat gs R1 ou cs R2 gs R3
; Measure 119
	octave 3
	beat gs R1 gs R2 d R3
	octaved
	beat gs R1 gs R2 ou gs R3
	octave 3
	beat d R1 od gs R2 ou gs R3
	beat d R1 od gs R2 ou d R3
; Measure 120
	vol HI_VOL+2
	octave 3
	beat a R1 a R2 ds R3
	octaved
	beat a R1 a R2 ou a R3
	octave 3
	beat ds R1 od gs R2 ou as R3+Q

	endSec

musHyruleFieldOChannel0:
	.redefine HI_VOL $6
	.redefine LO_VOL $4

; Measure 113
	vol $0
	beat gs3 HF
	vol HI_VOL
	transpose 0
	duty $03
	env $0 $00
	vibrato $00
	octave 3
	beat a S1 r S2 a S3 b S4
	octaveu
	beat c HF+E1 r E2
; Measure 114-117
	octaveu	
	beat ds S1 r S2 ds S3 f S4
	beat fs HF+E1 r E2+HF+W+W
	;vol $0
	;beat gs3 W
; Measure 118-120
	transpose -4
	;vol HI_VOL
	goto musHyruleFieldOChannel1Measure118

	indexJump
	cmdff


musHyruleFieldOChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 113-117
	transpose 0
beginLoop 5
	goto musHyruleFieldNChannel4Measure105
breakOrLoop
; Measure 118-119
	transpose 1
beginLoop 2
	goto musHyruleFieldNChannel4Measure105
breakOrLoop
	transpose 2
	goto musHyruleFieldNChannel4Measure105

	indexJump
musHyruleFieldOChannel6:
	cmdff
