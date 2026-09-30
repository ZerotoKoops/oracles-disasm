musMajestyAndGloryStart:
    tempo 90
musMajestyAndGloryChannel1:
.redefine HI_VOL $6
.redefine LO_VOL $4

; Measure 1
; 4/4
/*
    vol $0
    beat gs3 HF
*/
@measure1cLoop:
    transpose 0
    vol HI_VOL
    octave 4
    duty $02
    vibrato $e2
    env $1 $00
    beat c Q d Q
; Measure 2
    goto @measure2
    vol HI_VOL
; Measure 3.3
    beat f Q g Q
; Measure 4
    goto @measure4
    vol HI_VOL-1
; Measure 5.4
    beat f Q
; Measure 6
    vol HI_VOL
    beat e Q+E1 e E2 e Q e Q
; Measure 7
    vol HI_VOL+1
    beat f Q e Q e Q
    vol HI_VOL
    beat d Q
; Measure 8
    goto @measure8
    vol HI_VOL
; Measure 9.3
    beat c Q c Q
; Measure 10
    transpose a4-e4
    goto @measure2
    vol HI_VOL
; Measure 11.3
    transpose 0
    beat b Q ou c E1
    env $0 $00
    beat d E2
; Measure 12
    env $1 $00
    transpose g4-f4
    goto @measure4
    vol HI_VOL-1
; Measure 13.4
    transpose 0
    octave 4
    beat e Q
; Measure 14
    vol HI_VOL
    beat f Q+E1 f E2 f Q g Q
; Measure 15
    vol HI_VOL+1
    beat a Q f Q g Q
    vol HI_VOL
    beat a Q
; Measure 16
    transpose b4-c4
    goto @measure8
    vol HI_VOL
; Measure 17.3
    transpose 0
    beat a Q b Q
; Measure 18
    octaveu
    transpose c5-e4
    goto @measure2
    vol HI_VOL

.rept 2 INDEX REPTCTR
; Measure 19.3,21.3
    transpose 0
    octaved
    beat b Q ou c Q
; Measure 20,22
    ;beat d HF
    beat d Q+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat d E2

    env $1 $00
    vibrato $e2
    vol HI_VOL
.ifeq REPTCTR 0
    ;beat c HF+HF
    beat c HF+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat c E2+E1
    vol LO_VOL-1
    beat c E2
    vol HI_VOL
.else ; REPTCTR == 1
    ;beat c HF
    beat c Q+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat c E2
    vol LO_VOL-1
    beat c E1 r E2
    vol HI_VOL+1
.endif
    env $1 $00
    vibrato $e2
.endr
; Measure 23.3
    octave 5
    beat e Q d Q c Q
; Measure 24
    ;beat d HF+HF+Q
    beat d HF+Q
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat d Q+S1
    vol LO_VOL-1
    beat d S2+E2+E1
    vol LO_VOL-2
    beat d S3 r S4

    env $1 $00
    vibrato $e2
; Measure 25.2
    octave 4
    vol HI_VOL-1
    beat c Q d Q
; Measure 26
    transpose g4-e4
    goto @measure2
    vol HI_VOL
; Measure 27.3
    transpose 0
    beat f Q e Q
; Measure 28
    transpose f4-e4
    goto @measure2
    vol HI_VOL
; Measure 29.3
    transpose 0
    beat e Q d Q
; Measure 30
    transpose g4-e4
    goto @measure2

    goto @measure1cLoop
    cmdff

@measure2:
; Measure 2
    octave 4
    ;beat e HF
    beat e Q+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat e E2

    env $1 $00
    vibrato $e2
    vol HI_VOL
    ;beat e HF+HF
    beat e HF+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat e E2+E1
    vol LO_VOL-1
    beat e E2

    env $1 $00
    vibrato $e2
    vol $0;HI_VOL
    endSec

@measure4:
; Measure 4
    octave 4
    ;beat f HF
    beat f Q+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat f E2

    env $1 $00
    vibrato $e2
    vol HI_VOL
@measure24:
    ;beat f HF+HF+Q
    beat f HF+Q
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat f Q+S1
    vol LO_VOL-1
    beat f S2+E2

    env $1 $00
    vibrato $e2
    vol $0;HI_VOL-1
    endSec

@measure8:
; Measure 8
    octave 4
    ;beat c W+HF
    beat c HF+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat c E2+Q+E1
    vol LO_VOL-1
    beat c E2+E1 r E2  
    
    env $1 $00
    vibrato $e2
    vol $0;HI_VOL
    endSec


musMajestyAndGloryChannel0:
.redefine HI_VOL $5
.redefine LO_VOL $3

; Measure 1
; 4/4
/*
    vol $0
    beat gs3 HF
*/
@measure1cLoop:
    vol $0
    beat gs3 HF

    vol HI_VOL
    octave 3
    duty $03
    vibrato $e2
    env $1 $00
    ;beat c Q d Q
; Measure 2
    transpose g3-e4
    goto musMajestyAndGloryChannel1@measure2
    vol HI_VOL
; Measure 3.3
    transpose 0
    beat a Q b Q
; Measure 4
    transpose a3-f4
    goto musMajestyAndGloryChannel1@measure4
    vol HI_VOL-1
; Measure 5.4
    transpose 0
    beat a Q
; Measure 6
    vol HI_VOL
    beat g Q+E1 g E2 g Q g Q
; Measure 7
    vol HI_VOL+1
    beat gs Q gs Q gs Q
    vol HI_VOL
    beat gs Q
; Measure 8
    ;beat e W f HF
    beat e HF+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat e E2+Q

    vol LO_VOL+1
    vibrato $e2
    beat f Q+S1
    vibrato $02
    vol LO_VOL
    beat f S2 r E2
   
; Measure 9.3
    octave 3
    beat e Q e Q
; Measure 10
    ;beat f HF
    beat f Q+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat f E2

    env $1 $00
    vibrato $e2
    vol HI_VOL
    ;beat ou c HF od b HF
    octaveu
    beat c Q+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat c E2
    vol LO_VOL+1
    octaved 
    beat b Q+E1
    vol LO_VOL-1
    beat b E2

    env $1 $00
    vibrato $e2
    vol HI_VOL
; Measure 11.3
    octaveu
    beat d Q c E1
    env $0 $00
    octaved
    beat b E2
; Measure 12
    ;beat e HF
    env $1 $00
    beat e Q+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat e E2

    env $1 $00
    octaveu
    beat e Q 
    env $0 $00
    beat d Q cs Q+E1
    vol LO_VOL
    vibrato $02
    beat cs E2+E1
    vol LO_VOL-1
    beat cs E2
; Measure 13.4
    env $1 $00
    vibrato $e2
    vol HI_VOL-1
    octave 4
    beat cs Q
; Measure 14
    octaved
    vol HI_VOL
    beat a Q+E1 a E2 a Q a Q
; Measure 15
    vol HI_VOL+1
    beat a Q a Q a Q
    vol HI_VOL
    beat a Q
; Measure 16
    transpose d4-c4
    goto musMajestyAndGloryChannel1@measure8
    vol HI_VOL
; Measure 17.3
    transpose 0
    ;beat a Q gs Q
    octave 4
    beat f Q e Q
; Measure 18
    octave 4
    transpose e4-e4
    goto musMajestyAndGloryChannel1@measure2
    vol HI_VOL

; Measure 19.3
    transpose 0
    octave 4
    beat e Q e Q
; Measure 20
    ;transpose c4-c4
    goto musMajestyAndGloryChannel1@measure8
    vol HI_VOL
; Measure 21.3
    beat e Q e Q
; Measure 22
    ;beat e HF
    beat e Q+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat e E2

    env $1 $00
    vibrato $e2
    vol HI_VOL
    ;beat e HF
    beat e Q+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat e E2
    vol LO_VOL-1
    beat e E1 r E2

    vol HI_VOL+1
    env $1 $00
    vibrato $e2
; Measure 23.2
    octave 4
    beat c Q c Q c Q
; Measure 24
    ;beat c W od b Q
    beat c HF+Q
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat c Q
    octaved
    vol LO_VOL+1
    beat b E1+S3
    vol LO_VOL
    beat b S4+E1
    vol LO_VOL-1
    beat b S3 r S4
; Measure 25.2
    rest HF

    env $1 $00
    vibrato $e2
    vol HI_VOL-1
    octave 3
    ;beat c Q d Q
; Measure 26
    transpose e3-e4
    goto musMajestyAndGloryChannel1@measure2
    vol HI_VOL
; Measure 27.3
    transpose 0
    beat a Q a Q
; Measure 28
    transpose a3-e4
    goto musMajestyAndGloryChannel1@measure2
    vol HI_VOL
; Measure 29.3
    transpose 0
    octave 3
    beat g Q f Q
; Measure 30
    vol LO_VOL
    octave 4
    ;beat d HF
    beat d Q+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat d E2

    env $1 $00
    vibrato $e2
    vol HI_VOL
    ;beat e HF+HF
    beat e HF+E1
    env $0 $00
    vibrato $02
    vol LO_VOL
    beat e E2+E1
    vol LO_VOL-1
    beat e E2

    goto @measure1cLoop
    cmdff

.macro m_musMajestAndGloryChannel4Beat
    beat \1 \2
/*
    duty HI_VOL
    beat \1 (\2-S4)
    duty LO_VOL
    beat \1 S4
*/
.endm


musMajestyAndGloryChannel4:
.redefine HI_VOL $03 ; WF_TRIANGLE_LOUD
.redefine MD_VOL $00 ; WF_TRIANGLE_MEDIUM
.redefine LO_VOL $08 ; WF_TRIANGLE_SOFT

; Measure 1
    ;rest HF
@measure1cLoop:
    octave 3
    duty MD_VOL
    m_musMajestAndGloryChannel4Beat c Q
    m_musMajestAndGloryChannel4Beat d Q
; Measure 2
    m_musMajestAndGloryChannel4Beat c HF
    m_musMajestAndGloryChannel4Beat c HF+HF
; Measure 3.3
    m_musMajestAndGloryChannel4Beat c Q
    m_musMajestAndGloryChannel4Beat c Q
; Measure 4
    m_musMajestAndGloryChannel4Beat c HF
    m_musMajestAndGloryChannel4Beat c HF+HF+Q
; Measure 5.4
    m_musMajestAndGloryChannel4Beat c Q
; Measure 6
    m_musMajestAndGloryChannel4Beat c Q+E1
    m_musMajestAndGloryChannel4Beat c E2
    m_musMajestAndGloryChannel4Beat c Q
    m_musMajestAndGloryChannel4Beat c Q
; Measure 7
    octaved
    m_musMajestAndGloryChannel4Beat b Q
    m_musMajestAndGloryChannel4Beat b Q
    octaveu
    m_musMajestAndGloryChannel4Beat e Q
    m_musMajestAndGloryChannel4Beat e Q
; Measure 8
    octaved
    m_musMajestAndGloryChannel4Beat a W
    m_musMajestAndGloryChannel4Beat g HF
; Measure 9.3
    octaveu
    m_musMajestAndGloryChannel4Beat c Q
    m_musMajestAndGloryChannel4Beat c Q
; Measure 10
    octaved
    m_musMajestAndGloryChannel4Beat f HF
    octaveu
    m_musMajestAndGloryChannel4Beat f HF+HF
; Measure 11.3
    m_musMajestAndGloryChannel4Beat f Q
    m_musMajestAndGloryChannel4Beat f Q
; Measure 12
    m_musMajestAndGloryChannel4Beat e HF
    m_musMajestAndGloryChannel4Beat e HF+HF+Q
; Measure 13.4
    octaved
    m_musMajestAndGloryChannel4Beat a Q
; Measure 14
    octaveu
    m_musMajestAndGloryChannel4Beat d Q+E1
    m_musMajestAndGloryChannel4Beat d E2
    m_musMajestAndGloryChannel4Beat d Q
    m_musMajestAndGloryChannel4Beat e Q
; Measure 15
    m_musMajestAndGloryChannel4Beat f Q
    m_musMajestAndGloryChannel4Beat d Q
    m_musMajestAndGloryChannel4Beat e Q
    m_musMajestAndGloryChannel4Beat f Q
; Measure 16-17
    m_musMajestAndGloryChannel4Beat g W+HF
; Measure 17.3
    m_musMajestAndGloryChannel4Beat d Q
    m_musMajestAndGloryChannel4Beat e Q
; Measure 18
    octaved
    m_musMajestAndGloryChannel4Beat a HF
    octaveu
    m_musMajestAndGloryChannel4Beat a HF+HF
; Measure 19.3
    m_musMajestAndGloryChannel4Beat a Q
    m_musMajestAndGloryChannel4Beat a Q
; Measure 20
    m_musMajestAndGloryChannel4Beat g HF
    m_musMajestAndGloryChannel4Beat g HF+HF
; Measure 21.3
    m_musMajestAndGloryChannel4Beat g Q
    m_musMajestAndGloryChannel4Beat g Q
; Measure 22
    m_musMajestAndGloryChannel4Beat fs HF
    m_musMajestAndGloryChannel4Beat fs HF
; Measure 23
    duty LO_VOL
    beat fs E1 r E2
    duty MD_VOL
    m_musMajestAndGloryChannel4Beat fs Q
    m_musMajestAndGloryChannel4Beat fs Q
    m_musMajestAndGloryChannel4Beat fs Q
; Measure 24
    m_musMajestAndGloryChannel4Beat g W+Q
    duty LO_VOL
    beat g E1 r E2
    duty MD_VOL
; Measure 25.3
    m_musMajestAndGloryChannel4Beat c Q
    m_musMajestAndGloryChannel4Beat d Q
; Measure 26
    m_musMajestAndGloryChannel4Beat c HF
    m_musMajestAndGloryChannel4Beat c HF+HF
; Measure 27.3
    m_musMajestAndGloryChannel4Beat c Q
    m_musMajestAndGloryChannel4Beat c Q
; Measure 28
    m_musMajestAndGloryChannel4Beat c HF
    m_musMajestAndGloryChannel4Beat c HF+HF
; Measure 29.3
    m_musMajestAndGloryChannel4Beat c Q
    m_musMajestAndGloryChannel4Beat c Q
; Measure 30
    m_musMajestAndGloryChannel4Beat c HF
    m_musMajestAndGloryChannel4Beat c HF+HF

    goto @measure1cLoop
    cmdff





.define musMajestyAndGloryChannel6 MUSIC_CHANNEL_FALLBACK EXPORT