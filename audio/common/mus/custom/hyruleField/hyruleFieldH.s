musHyruleFieldHStart:
	tempo 150

musHyruleFieldHChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 57-60
beginLoop 2
; Measure 57,59
	env $0 $00
	transpose 0
	vibrato $a2
	vol HI_VOL
	duty $02
	;transpose 0
	octave 4
.redefine NOTE_END_WAIT T8
	beat g Q e HF
.redefine NOTE_END_WAIT 0
	beat g E1 fs S3 e S4
; Measure 58,60
	transpose 11
	goto musHyruleFieldDChannel1Measure48
breakOrLoop
; Measure 61
	transpose 0
	vibrato $00
	vol HI_VOL
	octave 4
.redefine NOTE_END_WAIT T8
	beat a Q fs HF
.redefine NOTE_END_WAIT 0
	beat a E1 g S3 fs S4
; Measure 62
	transpose 12
	goto musHyruleFieldDChannel1Measure48
; Measure 63
	transpose 0
	vibrato $00
	vol HI_VOL
	octave 4
.redefine NOTE_END_WAIT T8
	beat b Q g HF
.redefine NOTE_END_WAIT 0
	beat b E1 a S3 g S4
; Measure 64
	transpose 14
	goto musHyruleFieldDChannel1Measure48
	
	indexJump
	cmdff	


musHyruleFieldHChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $3

; Measure 57-62c
	goto musHyruleFieldGChannel0Measure49
; Measure 63d
	;env $0 $00
	;duty $02
	;vibrato $a1
	vol HI_VOL
	octave 6
	beat g R1 fs Y3
	beat g S3 a S4
; Measure 64
	beat g HF+Q b E1 a S3 g S4
; Measure 65
	transpose 38
	goto musHyruleFieldDChannel1Measure48

	indexJump
	cmdff


musHyruleFieldHChannel4:
	/*
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 57-60
	
	transpose 5
beginLoop 4
	goto musHyruleFieldAChannel4Measure1
breakOrLoop
; Measure 61
	transpose 4
	goto musHyruleFieldAChannel4Measure1
; Measure 62
	goto musHyruleFieldGChannel4Measure54
; Measure 63
	transpose 5
	goto musHyruleFieldAChannel4Measure1
; Measure 64
	transpose 7
	goto musHyruleFieldAChannel4Measure1

	indexJump
	*/
musHyruleFieldHChannel6:
	cmdff
