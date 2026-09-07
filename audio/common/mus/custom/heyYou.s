musHeyYouStart:
    tempo 140

musHeyYouChannel1:
.redefine HI_VOL $6
.redefine LO_VOL $4

; Measure 1 (2/4)
    vol $0
    beat gs3 HF

;4/4
@measure2Loop:
; Measure 2
    rest HF+Q+E1
    vol HI_VOL
    octave 4
    duty $01
    env $0 $05
    vibrato $81
    beat g S3 a S4
; Measure 3
.rept 2
    octave 4
    beat as S1 ou c S2 od as S3 ou c S4
.endr
    beat d E1 c E2 od as E1 a E2
; Measure 4
    beat g E1 r E2

    duty $00
    env $0 $03
    vibrato $00
    octave 5
    m_tremolo, f, d, 3, E1+S3, 1, 1
    m_tremolo, f, d, 2, S4, 1, 1
    m_tremolo, e, c, 3, E1, 1, 1
    rest, E2
    m_tremolo, c, a4, 3, E1+S3, 1, 1
    m_tremolo, c, a4, 2, S4, 1, 1
; Measure 5
    octaved
    m_tremolo, as, g, 3, E1, 1, 1
    rest, E2
    m_tremolo, a, f, 3, E1+S3, 1, 1
    m_tremolo, a, f, 2, S4, 1, 1
    m_tremolo, g, e, 3, E1, 1, 1
    rest E2+E1
    
/*
    beat f E1+S3 f S4 e Q
    beat c E1+S3 c S4
; Measure 5
    octaved
    beat as Q
    beat a E1+S3 a S4 g Q+E1
*/
    duty $01
    env $0 $05
    vibrato $81
    octave 4
    beat g S3 a S4
; Measure 6
.rept 2
    octave 4
    beat as S1 ou c S2 od as S3 ou c S4
.endr
    octaved
    beat as E1 ou a E2 g E1 f E2
; Measure 7
    beat e E1 r E2+Q
    
    duty $00
    env $0 $03
    vibrato $00
    octave 3
    beat g S1 a S2 as S3 ou c S4
    beat d S1 e S2 f S3 g S4

; Measure 8
    duty $01
    env $0 $05;$0 $00
    vibrato $81
    octave 4
    m_tremolo as g 3 E1, 1, 1
    rest E2
    m_tremolo a f 3 E1, 1, 1
    rest E2

    m_tremolo g e 3 E1, 1, 1
    m_tremolo g e 2 S3, 1, 1
    m_tremolo a f 2 S4, 1, 1
    rest E1
    m_tremolo as g 3 E2, 1, 1
; Measure 9
    octaveu
    m_tremolo c a4 3 E1, 1, 1
    rest E2
    m_tremolo d as4 3 E1, 1, 1
    rest E2

    m_tremolo e c 3 E1, 1, 1
    m_tremolo e c 2 S3, 1, 1
    m_tremolo d as4 2 S4, 1, 1
    rest E1
    m_tremolo c a4 3 E2, 1, 1
; Measure 10
    octaved
    m_tremolo as g 3 E1, 1, 1
    rest E2
    m_tremolo a f 3 E1, 1, 1
    rest E2

    m_tremolo g e 3 E1, 1, 1
    m_tremolo g e 2 S3, 1, 1
    m_tremolo a f 2 S4, 1, 1
    rest E1
    m_tremolo f d 3 E2, 1, 1
; Measure 11
    m_tremolo f d 3 E1+S3, 1, 1
    m_tremolo e c 2 S4, 1, 1
    rest Q+S1
/*
    env $0 $03;$0 $00
    duty $02
    octave 6
    m_tremolo c g5 2 S2+S3, 1, 1
    m_tremolo c g5 2 S4, 1, 1
    m_tremolo c g5 2 E1, 1, 1
    m_tremolo c g5 2 E2, 1, 1
*/
/*
    beat as E1 r E2 a E1 r E2
    beat g E1 g S3 a S4
    rest E1
    beat as E2
; Measure 9
    octaveu
    beat c E1 r E2 d E1 r E2
    beat e E1 e S3 d S4
    rest E1
    beat c E2
; Measure 10
    octaved
    beat as E1 r E2 a E1 r E2
    beat g E1 g S3 a S4
    rest E1
    beat f E2
; Measure 11
    env $0 $00
    beat f E1+S3 e S4
    rest Q+S1
*/
    env $0 $03
    duty $02
    octave 6
    beat c S2+S3 c S4
    beat c E1 c E2

; Measure 12
    duty $01
    env $0 $05
    ;vibrato $81
    octave 4
.rept 2
    beat g S1 a S2 g S3 a S4
.endr
    beat g E1 ou d E2 r Q
; Measure 13
    octave 5
.rept 2
    beat e S1 f S2 e S3 f S4
.endr
    beat e E1 c E2 r Q
; Measure 14 (M12)
    octave 4
.rept 2
    beat g S1 a S2 g S3 a S4
.endr
    beat g E1 ou d E2 r Q
; Measure 15
    octave 5
.rept 2
    beat e S1 f S2 e S3 f S4
.endr
    beat e E1 ou c E2 r Q
; Measure 16
    octave 5
    beat b E1 r E2 a E1 r S3
    beat g S4+S1 g S2+S3 g S4
    beat f E1 d E2
; Measure 17
    beat e E1
    octave 4
    beat g S3 a S4
    beat g S1 a S2 g S3 a S4
    beat g E1 r E2+Q

; Measure 18
    octave 5
    m_tremolo b d 3 E1, 1, 1
    rest E2
    m_tremolo a c 3 E1, 1, 1
    rest S3
    m_tremolo g b4 2 S4, 1, 1
    rest S1
    m_tremolo g b4 2 S2 , 1, 1
    rest S3
    m_tremolo g b4 2 S4, 1, 1
    m_tremolo f a4 3 E1, 1, 1
    m_tremolo d f4 2 E2, 1, 1
; Measure 19
    octave 5
    env $0 $06
    m_tremolo b d 3 E1, 1, 1
    rest S3
    m_tremolo a c 3 S4+S1, 1, 1
    rest S2
    m_tremolo g b4 3 E2, 1, 1
    rest S1
    m_tremolo f a4 3 S2+E2, 1, 1
    m_tremolo e g4 3 E1, 1, 1
    m_tremolo d f4 2 E2, 1, 1  

/*
; Measure 18 (M16)
    octave 5
    beat b E1 r E2 a E1 r S3
    beat g S4+S1 g S2+S3 g S4
    beat f E1 d E2
; Measure 19
    octave 5
    env $0 $06
    beat b E1 r S3 a S4+S1 r S2
    beat g E2 r S1 f S2+E2
    beat e E1 d E2
*/
    
    goto @measure2Loop
    cmdff    

musHeyYouChannel0:
.redefine HI_VOL $4
.redefine LO_VOL $3
.redefine ECHO_DELAY 5

;2/4
; Measure 1
    vol $0
    beat gs3 HF

;4/4
@measure2Loop:
; Measure 2
    rest HF+Q+E1+ECHO_DELAY
    vol HI_VOL
    octave 4
    duty $01
    env $0 $05
    vibrato $00
    beat g S3 a S4
; Measure 3
.rept 2
    octave 4
    beat as S1 ou c S2 od as S3 ou c S4
.endr
    beat d E1 c E2 od as E1 a E2
; Measure 4
    beat g E1 r E2

    vol $0
    beat gs3 Q+HF
; Measure 5
    beat gs3 HF+Q+E1
    vol HI_VOL

/*
    duty $00
    env $0 $03
    vibrato $00
    octave 5
    beat d E1+S3 d S4 c Q
    octaved
    beat a E1+S3 a S4    
; Measure 5
    octaved
    beat g Q
    beat f E1+S3 f S4 e Q+E1+ECHO_DELAY
*/

    ;duty $02
    ;env $0 $05
    ;vibrato $00
    octave 4
    beat g S3 a S4
; Measure 6
.rept 2
    octave 4
    beat as S1 ou c S2 od as S3 ou c S4
.endr
    octaved
    beat as E1 ou a E2 g E1 f E2
; Measure 7
    beat e E1 r E2+Q
    
    duty $00
    env $0 $03
    vibrato $00
    octave 3
    beat g S1 a S2 as S3 ou c S4
    beat d S1 e S2 f S3 g S4-ECHO_DELAY
; Measure 8
    vol LO_VOL
    octave 3
    m_tremolo b g 3 E1+E2, 1, 1
    m_tremolo a f 3 E1+S3, 1, 1
    m_tremolo g c 3 S4+E1, 1, 1
    rest E2+Q
; Measure 9
    m_tremolo c4 a 3 E1+E2, 1, 1
    m_tremolo b g 3 E1+S3, 1, 1
    m_tremolo a f 3 S4+E1, 1, 1
    rest E2+Q    
; Measure 10
    octave 3
    m_tremolo b g 3 E1+E2, 1, 1
    m_tremolo a f 3 E1+S3, 1, 1
    m_tremolo g c 3 S4+E1, 1, 1
    rest E2+E1
    m_tremolo g e 3 E2, 1, 1
; Measure 11
    m_tremolo c4 a 3 E1+E2, 1, 1
    m_tremolo b g 3 E1+S3, 1, 1
    m_tremolo a f 3 S4+S1, 1, 1

    env $0 $03
    duty $02
    octave 5
    beat g S2+S3 g S4
    beat g E1 g E2
    rest S1
; Measure 12.1
    octave 4
    duty $00
    env $0 $04
    vibrato $00
    vol HI_VOL+1
    beat d S2+E2
.rept 3
    beat d Q
.endr
; Measure 13
.rept 4
    beat e Q
.endr
; Measure 14
.rept 4
    beat d Q
.endr
; Measure 15
.rept 4
    beat e Q
.endr
; Measure 16-17
    vol HI_VOL
.rept 8
    beat d Q
.endr   
; Measure 18
    beat g Q r Q+HF
; Measure 19
    vol LO_VOL
    beat g Q
    env $0 $03
.rept 3
    beat g S1 a S2 g S3 a S4
.endr

    goto @measure2Loop
    cmdff

musHeyYouChannel4:
.redefine HI_VOL $0e
.redefine LO_VOL $0f

; Measure 1 (2/4)
    rest HF
    vibrato $81

@measure2Loop:
.rept 10
; Measure 2-11
    duty HI_VOL
.rept 2
    octave 2
    beat c S1+T3
    duty LO_VOL
    beat c T4

    duty HI_VOL
    beat g S3 r S4+E1
    beat g S3 r S4
.endr
.endr
; Measure 12
    octave 2
    ;duty HI_VOL
    beat c S1 r S2
    octaveu
    beat g S3 r S4
    octaved
    beat g S1 r S2
    octaveu
    beat g S3 c S4 r S1 c S2

    octaved
    beat g S3+T7
    duty LO_VOL
    beat g T8 r Q
.rept 3
; Measure 13-15
    octave 2
    duty HI_VOL
    beat c S1 r S2
    octaveu
    beat g S3 r S4
    octaved
    beat g S1 r S2
    octaveu
    beat g S3 c S4 r S1 c S2

    octaved
    beat c S3+T7
    duty LO_VOL
    beat c T8 r Q
.endr
; Measure 16-17
    duty HI_VOL
.rept 3
    octave 2
    beat g S1 r S2 ou d S3 r S4

    octaved
    beat d S1+T3
    duty LO_VOL
    beat d T4

    duty HI_VOL
    octaveu
    beat d S3 r S4
.endr
; Measure 17c
    octave 2
    beat g T1 
    duty LO_VOL
    beat g T2

    duty HI_VOL
    beat a T3
    duty LO_VOL
    beat a T4

    duty HI_VOL
    beat b T5
    duty LO_VOL
    beat b T6

    octaveu
    duty HI_VOL
    beat c T7
    duty LO_VOL
    beat c T8

    duty HI_VOL
    beat d T1
    duty LO_VOL
    beat d T2

    duty HI_VOL
    beat e T3  
    duty LO_VOL
    beat e T4

    duty HI_VOL
    beat f T5
    duty LO_VOL
    beat f T6

    duty HI_VOL
    beat g T7
    duty LO_VOL
    beat g T8
; Measure 18
    octave 2
    duty HI_VOL
    beat g S1 r S2+E2 f S1 r S2+S3
    beat e S4 r S1 e S2 r S3 e S4
    beat d S1 r S2 od b S3 r S4
; Measure 19
    octave 3
    beat d S1+T3
    duty LO_VOL
    beat d T4 r S3

    duty HI_VOL
    beat c S4+T1
    duty LO_VOL
    beat c T2 r S2

    octaved
    duty HI_VOL
    beat b S3+T7
    duty LO_VOL
    beat b T8 r S1

    duty HI_VOL
    beat a S2+S3+T7
    duty LO_VOL
    beat a T8

    duty HI_VOL
    beat g S1+T3
    duty LO_VOL
    beat g T4

    duty HI_VOL
    beat f S3+T7
    duty LO_VOL
    beat f T8

    goto @measure2Loop
    cmdff

musHeyYouChannel6:
.redefine SN $27;$24
.redefine CR $2e;$27
.redefine BS $29
.redefine LO $25
.redefine HI $23

.redefine HI_VOL $6
.redefine LO_VOL $5

; Measure 1 (2/4)
    vol HI_VOL
    beat CR E1+S3
    vol LO_VOL
    beat BS S4 
    beat BS E1 BS E2

@measure2Loop:
; 4/4
.rept 16
; Measure 2-17
.rept 2
    beat BS E1 LO S3 BS S4
    beat BS E1 HI E2
.endr
.endr

.rept 2
; Measure 18
.rept 4
    beat BS Q
.endr
.endr
    goto @measure2Loop

    cmdff