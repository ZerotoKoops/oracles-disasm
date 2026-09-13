musHyruleFieldCStart:
	tempo 150

musHyruleFieldCChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

; Measure 17
	goto musHyruleFieldBChannel1Measure9
	octave 5
	beat d Q
; Measure 18
	env $0 $04
	beat c Q od a Q ou c Q
	env $0 $00
	beat f Q
; Measure 19-20
	beat d HF+Q+E1
	vol LO_VOL
	beat d E2+HF r HF
; Measure 21
	goto musHyruleFieldBChannel1Measure9
	octave 5
	beat d Q
; Measure 22
	env $0 $04
	beat c Q
; Measure 11-12
	env $0 $00
	beat e HF r R1
	beat d R2 c R3
; Measure 23-24
	octaved
	beat b S1 ou c S2 od b E2+Q+Q
	vol LO_VOL
	beat b Q+HF r HF

	indexJump
	cmdff	

musHyruleFieldCChannel0:
	.redefine HI_VOL $5
	.redefine LO_VOL $3

; Measure 17-18a
	goto musHyruleFieldBChannel0Measure9
	octave 4
	beat g Q
; Measure 18
	env $0 $04
	beat f Q c Q f Q
	env $0 $00
	beat a Q
; Measure 19
	beat b HF
	octaveu
	beat c S1 od b S2 g E2+Q
; Measure 20
	beat f S1 e S2 d E2+Q+Q r Q
; Measure 21
	goto musHyruleFieldBChannel0Measure9
	octave 4
	beat g Q
; Measure 22
	env $0 $04
	beat f Q 
; Measure 22b
	env $0 $00
	beat a HF r R1
	beat g R2 f R3
; Measure 23
	beat e S1 f S2 d E2+Q+Q r Q
; Measure 24
	octaveu
	beat c S1 od b S2 g E2+Q+Q r Q

	indexJump
musHyruleFieldCChannel4:
musHyruleFieldCChannel6:
	cmdff
