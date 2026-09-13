musHyruleFieldDStart:
	tempo 150

musHyruleFieldDChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 25
	goto musHyruleFieldDChannel1Measure25
; Measure 26
	octave 5
	beat c Q
	env $0 $00
	octaved
	beat e HF+E1 r E2
; Measure 27
	goto musHyruleFieldDChannel1Measure25
; Measure 28
	octave 5
	beat e Q
	env $0 $00
	octaved
	beat a HF+E1 r E2
; Measure 29
	env $0 $04
	octaveu
	beat d Q
	env $0 $00
	octaved
	beat g HF
	beat d S1 g S2 a S3 ou d S4
; Measure 30
	env $0 $04
	beat c Q
	env $0 $00
	octaved
	beat f HF+E1 r E2
; Measure 31
	env $0 $04
	beat b Q
	env $0 $00
	beat f HF
	octaved
	beat b S1 ou cs S2 f S3 gs S4
; Measure 32
	beat g HF fs HF
	vol $0
	
	indexJump
	cmdff	

musHyruleFieldDChannel1Measure25:
; Measure 25
	duty $03
	transpose 0
	env $0 $04
	vol HI_VOL
	vibrato $a1
	octave 4
	beat b Q
	env $0 $00
	beat d Q+E1+S3 r S4
	beat d S1 b S2 ou c S3 d S4
	env $0 $04

	endSec

musHyruleFieldDChannel0:
	.redefine HI_VOL $5
	.redefine LO_VOL $3

; Measure 25-28
beginLoop 2
	transpose 0
	goto musHyruleFieldDChannel0Measure25
	transpose -2
	goto musHyruleFieldDChannel0Measure25
breakOrLoop
; Measure 29
	transpose -4
	goto musHyruleFieldDChannel0Measure25
; Measure 30
	transpose -5
	goto musHyruleFieldDChannel0Measure25
; Measure 31
	transpose -6
	goto musHyruleFieldDChannel0Measure25
; Measure 32
	transpose -7
	goto musHyruleFieldDChannel0Measure25

	indexJump
	cmdff

musHyruleFieldDChannel0Measure25:
; Measure 25
	env $1 $00
	duty $02
musHyruleFieldDChannel1Measure48:
	vol HI_VOL
musHyruleFieldDChannel1Measure77:
	vibrato $e2
	octave 3
	beat g HF+E1
	vol LO_VOL
	vibrato $02
	env $0 $00
	beat g E2+E1
	vol LO_VOL-2
	beat g E2

	endSec


musHyruleFieldDChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 25-28
beginLoop 2
	transpose 0
	goto musHyruleFieldAChannel4Measure1
	transpose -2
	goto musHyruleFieldAChannel4Measure1
breakOrLoop
; Measure 29
	transpose -4
	goto musHyruleFieldAChannel4Measure1
; Measure 30
	transpose -5
	goto musHyruleFieldAChannel4Measure1
; Measure 31
	transpose -6
	goto musHyruleFieldAChannel4Measure1
; Measure 32
	transpose -5
	goto musHyruleFieldAChannel4Measure1

	indexJump

musHyruleFieldDChannel6:
	cmdff
