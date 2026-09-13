musRealmOverworldStart:
	tempo 150;149
musRealmOverworldChannel1:
	octave 4
	.redefine BEAT 1

; Measure 1
	vol $0
	rest E2
; Measure 2
	duty $01
	vol $a
	beat gs Q+R1 fs R2 e R3 ds Q od b Q
; Measure 3
	beat ou b Q+R1 a R2 g R3 fs Q+E1 ou d E2
; Measure 4
	beat e E1 r E2
	duty $02
	vol $8
	octave 3
	beat g E1 r E2+E1 g E2 r Q
; Measure 5
	beat r Q g E1 r E2+E1 g E2 r E1

	duty $01
	vol $a
	octave 3
	beat b E2
musRealmOverworldChannel1Measure6:

.macro m_musRealmOverworldChannel1Measure6
; Measure 6,14
	octave 4
	beat g Q+E1 e E2 a Q+E1 g S3 a S4
; Measure 7,15
	beat b Q ou d Q od b R1+R2 a R3+R1 b R2+R3
; Measure 8,16
	vibrato $e1
	beat d W
	vibrato $00
; Measure 9,17
	rest Q
	duty $02
	vol $8
	octave 3
	beat g E1 r E2+E1 g E2 r E1 

	duty $01
	vol $a
	octave 3
	beat b E2
.endm
.macro m_musRealmOverworldChannel1Measure10
; Measure 10,18
	beat ou g Q+E1 e E2 a Q+E1 g S3 a S4
; Measure 11,19
	beat b Q+E1 ou d E2 od b R1+R2 a R3+R1 g R2+R3
.endm

.rept 2 INDEX REPTCTR
; Measure 6-9
	m_musRealmOverworldChannel1Measure6
; Measure 10-11
	m_musRealmOverworldChannel1Measure10
; Measure 12
	vibrato $e1
	beat ou d W
	vibrato $00
; Measure 13
	rest Q	
	duty $02
	vol $8
	octave 3
	beat d E1 r E2+E1 d E2 r E1

	vol $a
	octave 3
	beat b E2
; Measure 14-17
	m_musRealmOverworldChannel1Measure6
; Measure 18-19
	m_musRealmOverworldChannel1Measure10
; Measure 20
	octave 5
	duty $02
	vibrato $c2
	beat e HF+Q+E1
	vibrato $00
	beat d S3 c S4
; Measure 21
	vibrato $a2
	beat od b HF
	vibrato $00	
	beat a Q as Q
; Measure 22
	vibrato $c2
	beat b HF+Q+E1
	vibrato $00	
	beat a S3 g S4
; Measure 23
	beat e HF g Q b Q

; Measure 24
	vibrato $a1
	beat ou cs HF	
	vibrato $00		
	beat fs Q+E1 od b S3 a S4
; Measure 25
	beat b Q ou cs Q e Q gs Q
; Measure 26
	vibrato $c2
	beat a HF+Q+S1
	vibrato $00
	beat r S2 a S3 b S4
; Measure 27
	vibrato $a1
	beat gs HF
	vibrato $00
	duty $01
	beat cs Q gs Q

.redefine NOTE_END_WAIT 5
; Measure 28
	beat a HF a R1+R2 gs R3+R1 fs R2+R3
; Measure 29
	beat gs HF cs Q e Q
; Measure 30
	beat fs HF+R1+R2 od gs R3+R1 ou d R2+R3
; Measure 31
	beat cs HF c Q cs Q
; Measure 32
	beat a HF a R1+R2 gs R3+R1 fs R2+R3
; Measure 33
	beat gs HF cs Q e Q
; Measures 34-35
	vibrato $e1
	beat b W+HF
	vibrato $00
	duty $03
	beat b R1+R2 a R3+R1 g R2+R3

; Measure 36-37
	beat fs W ds W
; Measure 38
	vol $9
	beat cs HF+Q+E1
.redefine NOTE_END_WAIT 0
	beat r S3 cs S4
.redefine NOTE_END_WAIT 5
; Measure 39-41
	beat ds W e W ds W
; Measure 42
	beat cs HF+Q+E1
.redefine NOTE_END_WAIT 0
	beat r S3 cs S4
.redefine NOTE_END_WAIT 5

.ifeq REPTCTR 0
; Measure 43
	beat ds 84
.redefine NOTE_END_WAIT 0
	duty $01
	vol $a
	octave 3;3
	beat b 12
.endif

.endr

; Measure 44
	octave 5
	beat ds HF r HF
; Measure 45
	duty $02
	vibrato $01
	vol $8
	beat ds HF+R1+R2 od gs R3+R1 as R2+R3
; Measure 46
	beat ou ds HF+Q c Q
; Measure 47
	beat ds HF+R1+R2 f R3+R1 g R2+R3
; Measure 48
	beat ds HF+Q+E1+S3 r S4
; Measure 49
	beat ds HF+R1+R2 od gs R3+R1 as R2+R3
; Measure 50
	beat ou ds HF c Q od as Q
; Measure 51
	beat f HF+Q
.redefine NOTE_END_WAIT 2
	beat ds Q
.redefine NOTE_END_WAIT 0
; Measure 52
	beat ds Q f Q c T1 d T2 c S2+E2+Q

; Measure 53
	duty $00
	vol $8
;	vibrato $01
	beat ou c HF+R1+R2 od f R3+R1 g R2+R3
; Measure 54
	beat ou c HF d Q c Q
; Measure 55
	beat od b HF+Q g Q
; Measure 56
	beat ou g HF fs Q g Q
; Measure 57
	beat d HF+R1+R2 c R3+R1 od as R2+R3
; Measure 58
	beat a HF g HF
; Measure 59
	beat ou f HF+R1+R2 ds R3+R1 d R2+R3
; Measure 60
	beat c HF od as Q a Q
; Measure 61
	beat g HF
	duty $02
	vibrato $00
	vol $6
	octave 4
	beat c R1+R2 g R3+R1 d R2+R3
; Measure 62
	beat od b HF+Q+E1 b S3 ou c S4
; Measure 63
	beat od a HF+Q g E1 a E2
; Measure 64
	beat b HF
	vibrato $e2
	octave 5
	beat d HF

; Measure 65-66
	beat g W+W
	vibrato $00
	vol $8
	duty $03
	octave 3
; Measures 67-68
	beat r Q
.rept 2
	beat e E1 r E2+E1 e E2 r Q+Q
.endr
; Measures 69b-70
.rept 2
	beat g E1 r E2+E1 g E2 r Q+Q
.endr
; Measure 71b
	beat e E1 r E2+E1 e E2 r Q+Q
; Measure 72b
	beat e E1 r E2+E1 e E2 r E1

	duty $01
	vol $a
	beat b E2

	goto musRealmOverworldChannel1Measure6
	cmdff

musRealmOverworldChannel0:
/*
	setCoda $00
	octave 3
	.redefine BEAT 1

; Measure 1
	vol $0
	wait1 12
; Measure 2
	duty $03
	vol $a
	beat cs 48 ds 48
; Measure 3
	beat cs 5 e 43 d 5 fs 43
; Measure 4
	beat ou g 12
	vol $7
	octave 4;4
	duty $01
	env $0 $04
	beat g 6 b 6
	beat r 6 g 4 r 2 g 6 b 6
	beat e 12 g 6 b 6
	beat e 6 g 12 b 6
; Measure 5
	beat e 12 g 6 b 6
	beat r 6 g 4 r 2 g 6 b 6
	beat e 12 g 6 b 6
	beat e 6 g 12 b 6
musRealmOverworldChannel0Measure6:
	duty $01
	vol $7
	octave 4;4
	env $0 $04
; Measure 6
	beat e 10 r 2 e 6 b 6
	beat r 6 g 4 r 2 g 6 b 6
	beat e 12 g 6 b 6
	beat e 6 g 3 r 9 b 6
; Measure 7
	beat e 12 g 6 b 6
	beat r 6 g 4 r 2 g 6 b 6
	beat e 12 g 6 b 6
	beat e 6 g 12 e 6
; Measure 8
	beat od b 12 ou g 6 b 6
	beat r 6 g 4 r 2 g 6 b 6
	beat od b 12 ou g 6 b 6
	beat od b 6 ou g 12 b 6
; Measure 9
	beat d 12 g 6 b 6
	beat r 6 g 4 r 2 g 6 b 6
	beat d 12 g 6 b 6
	beat d 6 g 12 b 6
; Measure 10
	beat e 12 b 4 r 2 b 6
	beat r 6 g 4 r 2 g 6 b 6
	beat e 12 g 6 b 6
	beat e 6 g 3 r 9 b 6
; Measure 11
	beat e 12 g 6 e 6
	beat r 6 g 4 r 2 g 6 b 6
	beat e 12 g 6 b 6
	beat e 6 g 3 r 9 b 6
; Measures 12-13
.rept 2
	beat d 12 fs 6 b 6
	beat r 6 fs 4 r 2 fs 6 b 6
	beat d 12 fs 6
	beat b 6 d 6 fs 12 b 6
.endr
; Measure 14
	beat e 10 r 2 e 6 b 6
	beat r 6 g 4 r 2 g 6 b 6
	beat e 12 g 6 b 6
	beat e 6 g 3 r 9 b 6
; Measure 15
	beat e 12 g 6 b 6
	beat r 6 g 4 r 2 g 6 b 6
	beat e 12 g 6 b 6
	beat e 6 g 12 e 6
; Measure 16
	beat r 12
	env $0 $00
	vol $a
	octave 4
	beat e 12 g 3 a 3 g 6 r 24
	beat fs 12 a 3 b 3 a 6 r 24
; Measure 17
	beat g 6 a 6 b 3 ou c 3 od b 6 r 24
	beat g 6 a 6 fs 6 g 6 e 6 r 6
; Measure 18
	vol $7
	octave 4;4
	env $0 $04

	beat e 10 r 2 e 6 b 6
	beat r 6 g 4 r 2 g 6 b 6
	beat e 12 g 6 b 6
	beat e 6 g 3 r 9 b 6
; Measure 19
	beat e 12 g 6 e 6
	beat r 6 g 4 r 2 g 6 b 6
	beat e 12 g 6 b 6

	env $0 $00
	vol $a
	octave 4
	beat e 4 fs 4 a 4 b 4 ou c 4 d 4	

	vol $7
	octave 4;4
	env $0 $04
; Measure 20
	beat c 12 e 6 g 6
	beat r 6 e 4 r 2 e 6 g 6
	beat c 12 e 6 g 6
	beat c 6 e 12 g 6
; Measure 21
	beat d 12 g 6 ou d 6
	beat r 6 od g 4 r 2 g 6 b 6
	beat d 12 g 6 b 6
	beat d 6 g 12 b 6
; Measure 22
	beat ds 12 fs 6 b 6
	beat r 6 fs 4 r 2 fs 6 b 6
	beat ds 12 fs 6 b 6
	beat ds 6 fs 12 b 6
; Measure 23
	beat od b 12 ou g 6 b 6
	beat r 6 g 4 r 2 g 6 b 6
	beat e 10 r 2 e 6 b 6
	beat e 6 g 10 r 2 od b 6 ou

; Measures 24-25
	octave 4;4
.rept 2
	beat cs 12 fs 6 a 6
	beat r 6 fs 4 r 2 fs 6 a 6
	beat cs 12 fs 6 a 6
	beat cs 6 fs 12 a 6
.endr
; Measure 26
	beat r 24
	duty $02
	env $0 $00
	vol $a
	octave 5
	beat d 24 cs 24 od a 24
; Measure 27
	beat b 24 gs 24 fs 24 f 24

	duty $01
	vol $7
	octave 4;4
	env $0 $04
; Measure 28
	beat d 12 fs 6 a 6
	beat r 6 fs 4 r 2 fs 6 a 6
	beat d 12 fs 6 a 6
	beat d 6 fs 12 a 6
; Measure 29
	beat cs 12 e 6 gs 6
	beat r 6 e 4 r 2 e 6 gs 6
	beat cs 12 e 6 gs 6
	beat cs 6 e 12 gs 6
; Measure 30
	beat od b 12 ou e 6 gs 6
	beat r 6 e 4 r 2 e 6 gs 6
	beat od b 12 ou e 4 r 2 e 6
	beat od b 6 ou e 12 gs 6
; Measure 31
	beat cs 12 e 6 a 6
	beat r 6 e 4 r 2 e 6 a 6
	beat cs 12 e 6 a 6 
	beat cs 6 e 12 a 6
; Measure 32
	beat d 12 fs 6 a 6
	beat r 6 fs 4 r 2 fs 6 a 6
	beat d 12 fs 6 a 6
	beat d 6 fs 12 a 6
; Measure 33
	beat cs 12 e 6 gs 6
	beat r 6 e 4 r 2 e 6 gs 6
	beat cs 12 e 6 gs 6
	beat cs 6 e 12 gs 6
; Measure 34
	vibrato $e1
	duty $02
	env $0 $00
	vol $a
	octave 4
	beat g 72

	beat fs 24
; Measure 35
	beat e 48

	vibrato $00
	duty $01
	vol $7
	octave 4;4
	env $0 $04
	beat od cs 12 a 6 ou cs 6
	beat od cs 6 a 12 ou cs 6

; Measure 36
	octave 4;4
.rept 2
	beat e 10 r 2 e 6 b 12
	beat e 6 b 12
.endr
; Measure 37
.rept 2
	beat ds 10 r 2 ds 6 b 12
	beat ds 6 b 12
.endr
; Measure 38
.rept 2
	beat cs 10 r 2 cs 6 b 12
	beat cs 6 b 12
.endr

; Measure 39
.rept 2
	beat ds 10 r 2 ds 6 b 12
	beat ds 6 b 12
.endr
; Measure 40
.rept 2
	beat e 10 r 2 e 6 b 12
	beat e 6 b 12
.endr
; Measure 41
.rept 2
	beat ds 10 r 2 ds 6 b 12
	beat ds 6 b 12
.endr
; Measure 42
.rept 2
	beat cs 10 r 2 cs 6 b 12
	beat cs 6 b 12
.endr
; Measure 43
	beat ds 10 r 2 ds 6 b 12
	beat ds 6 b 12

	gotoCond $01 musRealmOverworldChannel0Measure44

	beat ds 10 r 2 ds 6 b 12
	beat ds 6 b 12

	setCoda $01
	goto musRealmOverworldChannel0Measure6

musRealmOverworldChannel0Measure44:

; Measure 44
	octave 2
	vol $6
	beat b 24 fs 24
; Measure 45
	octave 2
	beat r 24 gs 12 ou c 12
	beat r 24 ds 12 c 12
; Measure 46
	beat r 24 od gs 12 ou c 12
	beat gs 16 ds 16 c 16
; Measures 47-48
.rept 3
	beat r 24 od g 12 ou c 12
.endr
	beat as 16 g 16 ds 16
; Measures 49-50
.rept 3
	beat r 24 od gs 12 ou f 12
.endr
	beat gs 16 f 16 cs 16
; Measure 51
	beat r 24 ds 12 as 12
	beat r 24 g 12 as 12
; Measure 52
	beat ou c 12 od as 12 f 12 ds 12
	beat c 12 ou c 12 od as 12 f 12

; Measure 53
	octave 3
.rept 2
	beat r 24 c 12 f 12
.endr
; Measure 54
	beat r 24 f 12 c 12
	beat a 16 c 16 f 16
; Measure 55
	beat r 24 od g 12 ou d 12
.rept 2 
	beat r 24 d 12 od g 12 ou
; Measure 56
.endr
	beat b 16 d 16 g 16
; Measures 57-58
.rept 3
	beat r 24 d 12 g 12
.endr
	beat ou d 16 od as 16 g 16
; Measures 57-58
.rept 3
	beat r 24 c 12 a 12
.endr
	beat ou c 12 od a 12 f 12 c 12
; Measure 61
	octave 5
	vol $8
	beat c 12 od g 12 d 12
	beat r 36 c 12 d 12
; Measure 62
	beat b 12 g 12 d 12
	beat r 24 g 12 d 12 g 12
; Measure 63
	beat a 12 g 12 d 12 r 28 g 16 d 16
; Measure 64
	beat b 12 g 12 d 12 od g 12
	vol $9
	octave 4
	beat d 6 od g 6 a 6 b 6
	beat ou c 6 d 6 e 6 fs 6

; Measure 65
	beat b 48
	vol $8
	octave 4;4
	beat e 12 g 6 b 6
	beat e 6 g 12 b 6
; Measure 66
	beat e 12 g 6 b 6
	beat r 6 g 4 r 2 g 6 b 6
	beat e 12 g 6 b 6
	beat e 6 g 12 b 6
; Measures 67
	beat e 12 a 6 ou cs 6
	beat r 6 od a 4 r 2 a 6 ou cs 6
	beat od e 12 a 6 ou cs 6
	beat od e 6 a 12 ou cs 6 od
; Measure 68
	beat e 12 a 6 ou d 6
	beat r 6 od a 4 r 2 a 6 ou cs 6
	beat od e 12 a 6 ou cs 6
	beat od e 6 a 12 ou cs 6 od
; Measures 69-70
.rept 2
	beat e 12 g 6 b 6
	beat r 6 g 4 r 2 g 6 b 6
	beat e 12 g 6 b 6
	beat e 6 g 12 b 6
.endr
; Measure 71
	beat e 12 a 6 ou cs 6
	beat r 6 od a 4 r 2 a 6 ou cs 6
	beat od e 12 a 6 ou cs 6
	beat od e 6 a 12 ou cs 6 od
; Measure 72
	beat e 12 a 6 ou d 6
	beat r 6 od a 4 r 2 a 6 ou cs 6
	beat od e 12 a 6 ou cs 6
	beat od e 6 a 12 ou cs 6 od

	setCoda $00
	goto musRealmOverworldChannel0Measure6
*/
	cmdff

musRealmOverworldChannel4:
/*
	setCoda $00
	octave 2
	.redefine BEAT 1

; Measure 1 (pickup)
	duty $0e
	beat e 4 f 4 g 4
; Measure 2
	beat a 48 b 48
; Measure 3
	beat g 48 a 48
; Measures 4-5
.rept 2
	beat e 24
	duty $0f
	beat ou b 12
	duty $0e
	beat e 24
	duty $0f
	beat b 12 r 24 od
	duty $0e
.endr
musRealmOverworldChannel4Measure6:
; Measures 6-7
.rept 2
	beat e 24
	duty $0f
	beat ou b 12
	duty $0e
	beat e 24
	duty $0f
	beat b 12 r 24 od
	duty $0e
.endr
; Measures 8-9
.rept 2
	beat g 24
	duty $0f
	beat ou b 12
	duty $0e
	beat d 24
	duty $0f
	beat b 12 r 24 od
	duty $0e
.endr
; Measures 10-11
.rept 2
	beat e 24
	duty $0f
	beat ou b 12
	duty $0e
	beat e 24
	duty $0f
	beat b 12 r 24 od
	duty $0e
.endr
; Measures 12-13
.rept 2
	beat b 24
	duty $0f
	beat ou b 12
	duty $0e
	beat od fs 24
	duty $0f
	beat ou b 12 r 24 od
	duty $0e
.endr
; Measures 14-15
.rept 2
	beat e 24
	duty $0f
	beat ou b 12
	duty $0e
	beat e 24
	duty $0f
	beat b 12 r 24 od
	duty $0e
.endr
; Measures 16-17
.rept 2
	beat g 24
	duty $0f
	beat ou b 12
	duty $0e
	beat d 24
	duty $0f
	beat b 12 r 24 od
	duty $0e
.endr
; Measures 18-19
.rept 2
	beat e 24
	duty $0f
	beat ou b 12
	duty $0e
	beat e 24
	duty $0f
	beat b 12 r 24 od
	duty $0e
.endr
; Measure 20
	beat c 24
	duty $0f
	beat ou ou c 12
	duty $0e
	beat od c 24
	duty $0f
	beat ou c 12 r 24
	duty $0e
; Measure 21
	beat od od g 24
	duty $0f
	beat ou ou d 12
	duty $0e
	beat od d 24
	duty $0f
	beat ou d 12 r 24
	duty $0e
; Measure 22
	beat od od b 24
	duty $0f
	beat ou b 12
	duty $0e
	beat fs 24
	duty $0f
	beat b 12 r 24 od
	duty $0e
; Measure 23
	beat e 24
	duty $0f
	beat ou g 12
	duty $0e
	beat e 24
	duty $0f 
	beat g 12
	duty $0e
	beat od b 24

; Measure 24
	beat d 24
	duty $0f
	beat ou fs 12
	duty $0e
	beat d 24 
	duty $0f
	beat fs 12 r 24
	duty $0e
; Measure 25
	beat od a 24
	duty $0f
	beat ou a 12
	duty $0e
	beat e 24
	duty $0f 
	beat a 12
	duty $0e
	beat od a 24
; Measure 26
	beat ou cs 24
	duty $0f
	beat ou cs 12
	duty $0e
	beat od cs 24
	duty $0f 
	beat ou cs 12 r 24
	duty $0e
; Measure 27
	beat od od cs 24
	duty $0f
	beat ou cs 4 f 4 gs 4
	duty $0e
	beat od cs 12
	beat gs 12 cs 12 ou cs 24

; Measure 28
	beat od d 24
	duty $0f
	beat ou fs 12 
	duty $0e
	beat d 24
	duty $0f
	beat fs 12 r 24
	duty $0e
; Measure 29
	beat od a 18 b 6 r 12 ou cs 24
	duty $0f
	beat a 12
	duty $0e 
	beat cs 24
; Measure 30
	beat od e 24
	duty $0f
	beat ou b 12
	duty $0e 
	beat od b 24
	duty $0f
	beat ou b 12 r 24
	duty $0e
; Measure 31
	beat od fs 18 gs 6 r 12 a 24 
	duty $0f
	beat ou a 12
	duty $0e
	beat od a 24
; Measure 32
	beat d 24
	duty $0f
	beat ou fs 12
	duty $0e
	beat d 24
	duty $0f 
	beat fs 12 r 24
	duty $0e
; Measure 33
	beat od a 18 b 6 r 12 ou cs 24
	duty $0f
	beat a 12
	duty $0e
	beat cs 24
; Measure 34
	beat od g 24
	beat $0f
	beat ou g 12
	duty $0e
	beat d 24
	duty $0f
	beat g 12 r 24
	duty $0e
; Measure 35
	beat od a 18 b 6 r 12 ou cs 24
	duty $0f
	beat od e 12
	duty $0e
	beat ou e 24 od

.rept 3
; Measures 36,38,40
	beat b 24
	duty $0f
	beat ou b 12
	duty $0e
	beat fs 24
	duty $0f 
	beat b 12 r 24
	duty $0e
; Measures 37,39,41
	beat od b 24
	duty $0f
	beat ou b 12
	duty $0e 
	beat fs 24
	duty $0f
	beat b 12
	duty $0e
	beat od fs 24
.endr
; Measure 42
	beat b 24
	duty $0f
	beat ou b 12
	duty $0e
	beat fs 24
	duty $0f 
	beat b 12 r 24
	duty $0e

	gotoCond $01 musRealmOverworldChannel4Measure44

musRealmOverworldChannel4Measure43:	
; Measure 43
	beat od b 24
	duty $0f
	beat ou b 12
	duty $0e
	beat fs 24
	duty $0f
	beat od fs 12
	duty $0e
	beat b 24
	
	setCoda $01
	goto musRealmOverworldChannel4Measure6

musRealmOverworldChannel4Measure44:
	octave 2
; Measure 44
	beat b 24
	duty $0f
	beat ou b 12
	duty $0e
	beat od b 10 r 2
	duty $15
	beat b 24 a 24
; Measure 45
	octave 2
	beat f 36 ou c 36 f 60
; Measure 46
	beat c 24 f 12 od f 24
; Measure 47
	beat ou c 36 od g 36 ou g 60
; Measure 48
	beat od g 24 ou g 12 c 24
; Measure 49
	beat cs 36 od gs 36 ou gs 60
; Measure 50
	beat ds 24 cs 12 od gs 24
; Measure 51
	beat ou ds 36 od as 36 ou as 24
; Measure 52
	beat f 36 c 12 od f 12 ou c 12 od f 24

; Measure 53
	octave 3
	beat d 12 a 24 od a 36 ou a 60
; Measure 54
	beat od a 24 ou d 12 od d 24
; Measure 55
	beat e 12 b 22 r 2 b 36 e 60
; Measure 56
	beat b 24 ou e 12 od e 24
; Measure 57
	beat ou ds 12 as 24 od as 36 ou as 60
; Measure 58
	beat od as 24 ou ds 12 od as 24
; Measure 59
	beat f 12 ou c 22 r 2 c 36 od f 60
; Measure 60
	beat ou c 24 f 12 od f 24
; Measure 61
	beat g 12 ou d 24 od g 36 ou g 24
; Measure 62
	beat a 36 d 24 g 12 od g 22 r 2
; Measure 63
	beat g 12 ou d 24 od g 36 ou g 24
; Measure 64
	beat od g 36 ou d 24 od d 12
	duty $0e
	beat g 24

; Measures 65-72
	octave 2
.rept 2
	.rept 2
		beat e 24
		duty $0f
		beat ou b 12
		duty $0e
		beat e 24
		duty $0f
		beat b 12 r 24 od
		duty $0e
	.endr	
	.rept 2
		beat e 24
		duty $0f
		beat ou a 12
		duty $0e
		beat e 24
		duty $0f
		beat a 12 r 24 od
		duty $0e
	.endr	
.endr

	setCoda $00
	goto musRealmOverworldChannel4Measure6
*/
	cmdff

musRealmOverworldChannel6:
/*
	setCoda $00
	.redefine BEAT 1
; Measure 1-4
	beat r 192
	vol $3
	beat $2a 4 $2a 4 $2a 4

musRealmOverworldChannel6Measure5:
; Measure 5-43
.rept 3
	vol $5
	beat $2a 6 
	vol $3
	.rept 3
		beat $2a 6
	.endr
.endr
	vol $5
	beat $2a 6 
	vol $3
	beat $2a 6
.rept 3
	beat $2a 4
.endr
	gotoCond 76 musRealmOverworldChannel6Measure44
	setCoda $01
	goto musRealmOverworldChannel6Measure5

musRealmOverworldChannel6Measure44:
; Measure 44
.rept 2
	vol $5
	beat $2a 6 
	vol $3
	.rept 3
		beat $2a 6
	.endr
.endr
	vol $5
	beat $2a 3 
	vol $3
.rept 15
	beat $2a 3
.endr
musRealmOverworldChannel6Measure45:
; Measure 45-64
	vol $3
	beat r 24 $2a 24
	vol $5
	beat $2a 24
	vol $3
	beat $2a 24
; Measure 46
	beat r 24 $2a 12 $2a 12
	vol $5
	beat $2a 24
	vol $3
	beat $2a 24	

	gotoCond 85 musRealmOverworldChannel6Measure65
	setCoda $01
	goto musRealmOverworldChannel6Measure45

musRealmOverworldChannel6Measure65:
; Measure 65-72
	setCoda $00
	setCoda $fa	;-6
	goto musRealmOverworldChannel6Measure5
*/
	cmdff