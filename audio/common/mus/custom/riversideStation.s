musRiversideStationStart:
    tempo 68

musRiversideStationChannel1:
.redefine HI_VOL $6
.redefine LO_VOL $4


@measure1Loop:
; Measure 1
    vol $0
    beat gs3 HF

    ;env $1 $00
    env $0 $00
    duty $02
    ;vibrato $00
    octave 5
.macro m_musRiversideStationChannel1_measure1
    vibrato $00
    vol HI_VOL
    m_tremolo \1, \2, 0, \3+E1, 5, 2
    vibrato $01
    vol LO_VOL
    m_tremolo \1, \2, 0, E2, 5, 2
.endm
    m_musRiversideStationChannel1_measure1 d5 as4 Q

; Measure 2
    m_musRiversideStationChannel1_measure1 c5 gs4 Q
    octaved
    m_musRiversideStationChannel1_measure1 gs f Q
; Measure 3
    rest Q
    m_musRiversideStationChannel1_measure1 cs4 as3 0
    m_musRiversideStationChannel1_measure1 fs cs 0
    octaveu
    m_musRiversideStationChannel1_measure1 f cs 0
; Measure 4
    m_musRiversideStationChannel1_measure1 e5 b4 Q
    octaved
    m_musRiversideStationChannel1_measure1 b gs 0
    m_musRiversideStationChannel1_measure1 a f 0
; Measure 5
    m_musRiversideStationChannel1_measure1 g ds Q
    octaveu
    m_musRiversideStationChannel1_measure1 d5 as4 Q
; Measure 6
    m_musRiversideStationChannel1_measure1 c5 as4 Q
    rest Q
    octaved
    m_musRiversideStationChannel1_measure1 as f 0
; Measure 7
    octaveu
    m_musRiversideStationChannel1_measure1 c5 gs4 Q
    m_musRiversideStationChannel1_measure1 d5 as4 Q
; Measure 8
    rest Q
    m_musRiversideStationChannel1_measure1 f d 0
    m_musRiversideStationChannel1_measure1 d5 as4 0
    octaved
    m_musRiversideStationChannel1_measure1 as f 0

    
.macro m_musRiversideStationChannel1_quintuplet
	beat \1 Q1 \2 Q2 \1 Q3 \2 Q4 \1 Q5 
.endm

; 3/4
; Measure 9
    octave 4
    env $0 $06
    duty $02
    vibrato $a1
    vol HI_VOL

	m_musRiversideStationChannel1_quintuplet gs f
    octaveu
    m_musRiversideStationChannel1_quintuplet c5 gs4
    beat ds E1+S3 r S4
; Measure 10
    octaved
	m_musRiversideStationChannel1_quintuplet fs ds
    m_musRiversideStationChannel1_quintuplet as fs
    octaveu
    beat cs E1+S3 r S4
; Measure 11
    octaved
	m_musRiversideStationChannel1_quintuplet f d
    m_musRiversideStationChannel1_quintuplet a f
    octaveu
    beat c E1+S3 r S4
; Measure 12
    octaved
    m_musRiversideStationChannel1_quintuplet ds c
    m_musRiversideStationChannel1_quintuplet g ds
    m_musRiversideStationChannel1_quintuplet as g
; Measure 13
    vol LO_VOL-1
    m_musRiversideStationChannel1_quintuplet f d
    m_musRiversideStationChannel1_quintuplet a f
    vol LO_VOL
    m_musRiversideStationChannel1_quintuplet c5 a4  
; Measure 14
    vol LO_VOL+1
    m_musRiversideStationChannel1_quintuplet a f
    octaveu
    vol HI_VOL
    m_musRiversideStationChannel1_quintuplet d5 as4
    vol HI_VOL+1
    m_musRiversideStationChannel1_quintuplet f d

    goto @measure1Loop
    cmdff


.macro m_musRiversideStationChannel0_measure1
    vol HI_VOL+1
    beat \1 E1 \2 E2 \1 E1
    vol HI_VOL
    beat \2 E2 \1 E1
    vol LO_VOL+1
    beat \2 E2 
    vol LO_VOL
    beat \1 E1 
    vol LO_VOL-1
    beat \2 E2
.endm

musRiversideStationChannel0:
.redefine HI_VOL $6
.redefine LO_VOL $4


@measure1Loop: 
; Measure 1
    octave 5
    duty $03
    env $0 $05
    vibrato $e1

    m_musRiversideStationChannel0_measure1 g ds
; Measure 2
    m_musRiversideStationChannel0_measure1 f cs
; Measure 3
    m_musRiversideStationChannel0_measure1 as fs
; Measure 4
    m_musRiversideStationChannel0_measure1 gs e
; Measure 5
    m_musRiversideStationChannel0_measure1 g ds
; Measure 6
    m_musRiversideStationChannel0_measure1 f cs
; Measure 7
    m_musRiversideStationChannel0_measure1 gs ds
; Measure 8
    m_musRiversideStationChannel0_measure1 d5 as4


; Measure 9
.macro m_musRiversideStationChannel0_measure9
    vibrato $00
    vol HI_VOL
    m_tremolo \1, \2, 0, Q+S1, 5, 2
    vibrato $01
    vol LO_VOL
.if \3 > 0
    m_tremolo \1, \2, 0, \3+S2+S3, 5, 2
.else
    m_tremolo \1, \2, 1, \3+S2+S3, 5, 2    
.endif
    rest S4
.endm

.redefine HI_VOL $5
.redefine LO_VOL $3
    env $0 $00
    ;vibrato $00
    duty $00
    ;vol HI_VOL
    octave 4
    m_musRiversideStationChannel0_measure9 ds c Q
; Measure 10
    m_musRiversideStationChannel0_measure9 cs4 as3 Q
; Measure 11
    m_musRiversideStationChannel0_measure9 c4 a3 0
    octaved
    vol HI_VOL
    duty $02
    env $0 $06
    vibrato $e1
    beat a E1 g E2
; Measure 12
    beat f E1
    vol LO_VOL
    beat f E2

    env $0 $00
    ;vibrato $00
    duty $00
    m_musRiversideStationChannel0_measure9 as g 0
; Measure 13
    duty $03
    env $0 $05
    vibrato $e1    
    vol LO_VOL-1
    octave 5
    beat a E1 f E2 a E1 f E2 a E1
    vol LO_VOL
    beat f E2 a E1 f E2
; Measure 14.2
    vol LO_VOL+1
    beat as E1 f E2
    vol HI_VOL
    beat as E1
    vol HI_VOL+1
    beat f E2

    goto @measure1Loop
    cmdff



.macro m_musRiversideStationChannel4_measure1
/*
    beat \1 E1 \2 E2 \3 E1 r E2+E1
    beat \1 E2 \2 E1 \3 E2
*/
    duty HI_VOL
    beat \1 S1 
    duty LO_VOL
    beat \1 S2

    duty HI_VOL
    beat \2 S3
    duty LO_VOL
    beat \2 S4

    duty HI_VOL
    beat \3 S1
    duty LO_VOL
    beat \3 S2

    rest E2+E1

    duty HI_VOL
    beat \1 S3
    duty LO_VOL
    beat \1 S4

    duty HI_VOL
    beat \2 S1
    duty LO_VOL
    beat \2 S2

    duty HI_VOL
    beat \3 S3
    duty LO_VOL
    beat \3 S4
.endm

musRiversideStationChannel4:
.redefine HI_VOL $1e ; WF_SAWTOOTH_LOUD
.redefine LO_VOL $23 ; WF_SAWTOOTH_SOFT


@measure1Loop:
; Measure 1
    octave 2
    m_musRiversideStationChannel4_measure1 ds2 as2 ds3
; Measure 2
    m_musRiversideStationChannel4_measure1 cs2 gs2 cs3
; Measure 3
    m_musRiversideStationChannel4_measure1 fs2 cs3 fs3
; Measure 4
    m_musRiversideStationChannel4_measure1 e2 b2 e3
; Measure 5
    m_musRiversideStationChannel4_measure1 ds2 as2 ds3
; Measure 6
    m_musRiversideStationChannel4_measure1 cs2 gs2 cs3
; Measure 7
    m_musRiversideStationChannel4_measure1 gs2 ds3 gs3
; Measure 8
    m_musRiversideStationChannel4_measure1 as2 f3 as3


.redefine HI_VOL $03 ; WF_TRIANGLE_LOUD
.redefine MD_VOL $00 ; WF_TRIANGLE_MEDIUM
.redefine LO_VOL $08 ; WF_TRIANGLE_SOFT
; Measure 9
    vibrato $e1
    octave 3
    duty HI_VOL
    beat f Q+E1
    duty MD_VOL
    beat f E2+E1
    duty LO_VOL
    beat f S3 r S4
; Measure 10
    duty HI_VOL
    beat ds Q+E1
    duty MD_VOL
    beat ds E2+E1
    duty LO_VOL
    beat ds S3 r S4
; Measure 11
    duty HI_VOL
    beat d Q+E1
    duty MD_VOL
    beat d E2+E1
    duty LO_VOL
    beat d S3 r S4
; Measure 12
    duty HI_VOL
    beat c Q+E1
    duty MD_VOL
    beat c E2+E1
    duty LO_VOL
    beat c S3 r S4

.redefine HI_VOL $1e ; WF_SAWTOOTH_LOUD
.redefine LO_VOL $23 ; WF_SAWTOOTH_SOFT


; Measure 13
    octave 3
    duty LO_VOL
.rept 2
    beat f S1 r S2+E2
.endr
    beat f T1 r T2 f T3 r T4
    octaved
    beat as S3 r S4

/*
    octave 3
.rept 2
    duty HI_VOL
    beat f S1 
    duty LO_VOL
    beat f S2

    rest E2
.endr
    duty HI_VOL
    beat f T1
    duty LO_VOL
    beat f T2

    duty HI_VOL
    beat f T3
    duty LO_VOL
    beat f T4

    octaved
    duty HI_VOL
    beat as S3
    duty LO_VOL
    beat as S4
*/
; Measure 14
    octaveu
    beat f S1 r S2 ;od as S3 r S4

/*
    octaveu
    duty HI_VOL
    beat f S1 
    duty LO_VOL
    beat f S2
*/    
    octaved
    duty HI_VOL
    beat as S3
    duty LO_VOL
    beat as S4

    duty HI_VOL
    beat as S1
    duty LO_VOL
    beat as S2 
    
    duty HI_VOL
    beat as S3
    duty LO_VOL
    beat as S4  
    
    octaveu
    duty HI_VOL
    beat as S1
    duty LO_VOL
    beat as S2 
    
    octaved
    duty HI_VOL
    beat as S3
    duty LO_VOL
    beat as S4  

    goto @measure1Loop
    cmdff

.define musRiversideStationChannel6 MUSIC_CHANNEL_FALLBACK EXPORT