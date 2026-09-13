musHyruleFieldEStart:
	tempo 150

musHyruleFieldEChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

	transpose 0
beginLoop 2
; Measure 33,35
	vol $0
	beat g3 Q
	vol HI_VOL
	env $1 $00
	vibrato $e1
	duty $03
	octave 4
	beat b S1 r S2 b E2+E1
	beat g E2 d E1 od g E2 r Q
; Measure 34b,36b
	octave 5
	beat c S1 r S2 c E2+E1
	octaved
	beat g E2 e E1 od g E2 
breakOrLoop
; Measure 37
	beat r E1
	env $0 $02
	duty $02
	octave 3
	beat b E2 b E1 ou ds E2 ds E1
	beat fs E2 fs E1 b E2 r E1
; Measure 38a
	beat b E2+E1 a E2+E1 g E2+E1 a E2+E1
; Measure 39a
	octaved
	beat a E2 a E1 ou c E2 c E1
	beat e E2 e E1 g E2 r E1
; Measure 40a
	beat g E2+E1 fs E2+E1 e E2+E1 fs E2

	indexJump
	cmdff	


musHyruleFieldEChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $3

; Measure 33-36
beginLoop 2
; Measure 33,35
	transpose 0
	env $0 $04
	vol HI_VOL
	duty $02
	vibrato $a2
	octave 2
	beat g E1 ou d E2 g E1 ou d E2+E1
	octaved
	beat g E2 d E1 g E2
; Measure 34,36
	octaved
	beat g E1 ou e E2 ou c E1
	env $0 $00
	beat e E2+Q+E1 r E2
breakOrLoop
; Measure 37
	octave 3
	duty $03
	env $1 $00
	vol LO_VOL
	beat fs HF+Q b Q
; Measure 38
	beat a HF g HF
; Measure 39
	beat e HF+Q a Q
; Measure 40
	beat g HF fs HF

	indexJump
	cmdff


musHyruleFieldEChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

; Measure 33-36
	transpose 0
beginLoop 4
	goto musHyruleFieldAChannel4Measure1
breakOrLoop
; Measure 37
	octave 2
	beat fs S1 r S2+E2+E1
	beat fs S3 r S4+E1

	beat b S3 r S4
	beat b S1 r S2+E2
; Measure 38
	octaveu
	beat e S1 r S2+E2+E1
	beat e S3 r S4+E1
	
	beat d S3 r S4
	beat d S1 r S2+E2
; Measure 39
	beat c S1 r S2+E2+E1
	beat c S3 r S4+E1

	beat cs S3 r S4
	beat cs S1 r S2+E2
; Measure 40
	beat d S1 r S2+E2+E1
	beat d S3 r S4+E1

	beat d S3 r S4
	beat d S1 r S2+E2

	indexJump

musHyruleFieldEChannel6:
	cmdff
