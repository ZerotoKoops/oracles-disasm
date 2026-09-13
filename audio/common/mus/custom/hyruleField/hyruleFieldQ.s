musHyruleFieldQStart:
	tempo 150

musHyruleFieldQChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 129
	vol $0
	beat gs3 W+Q
; Measure 130b
	goto musHyruleFieldNChannel0Measure106
	vol $0
	beat gs3 HF
; Measure 131-136
.rept 2
	goto musHyruleFieldPChannel1Measure122
.endr

	indexJump
musHyruleFieldQChannel0:
musHyruleFieldQChannel4:
musHyruleFieldQChannel6:
	cmdff
