musCrownCityStart:
    tempo 240;256
musCrownCityChannel1:
.redefine HI_VOL $6
.redefine LO_VOL $4

; Swing!
.redefine E1 R1+R2
.redefine E2 R3

.macro m_musCrownCityTrumpets
    env $0 $05
    vibrato $00
    duty $01
.endm
.redefine SYNTH_DELAY T8
.macro m_musCrownCitySynth
    env $1 $00
    vibrato $62
    duty $00
.endm
.macro m_musCrownCityPiano
    env $0 $04
    vibrato $00
    duty $02
.endm
.macro m_musCrownCitySaxes
    env $0 $07
    vibrato $01
    duty $03
.endm

; 2/2
; Measure 1
    m_musCrownCityTrumpets
    octave 4
    vol HI_VOL
    beat as E1 ou c E2 ds E1 f E2
    beat g E1 ds E2 r E1 f E2
; Measure 2
    rest E1
    beat cs E2 ds E1
    vibrato $e1
    env $0 $00
    octaveu
    beat cs E2+Q+E1
    vol LO_VOL
    vibrato $01
    beat cs E2+Q
    
; Measure 3b
    m_musCrownCitySynth
    env $1 $00
    vol HI_VOL
    beat cs HF

    octaved
    beat gs R1 fs R2 cs R3
; Measure 4
    octaved
    beat as R1 gs R2 fs R3
    beat ds R1 cs R2 od as R3
    beat gs Q g Y1 fs Y2 f Y3 e Y4 ds Y5 d Y6
; Measure 5
    m_musCrownCityTrumpets
    octave 5
    vol HI_VOL
    beat cs E1 ds E2 fs E1 gs E2
    beat as E1 fs E2 r E1 gs E2
; Measure 6-7
    rest E1
    beat e E2 fs E1
    vibrato $e1
    env $0 $00
    octaveu
    beat e E2+HF+E1
    vol LO_VOL
    vibrato $01
    beat e E2+HF
    vol LO_VOL-2
    beat e Q
; Measure 8
    vol HI_VOL+1
    env $0 $04
    vibrato $00
    beat e E1 e E2 r E1 e E2 r E1
    env $0 $06
    beat e E2+Q-SYNTH_DELAY

@measure9Loop:
; Measure 9
    m_musCrownCitySynth
    vol HI_VOL
    octave 4
    beat as E1 ou c E2 ds E1 f E2
    beat g E1 gs E2+E1 gs Y5 a Y6
; Measure 10
    env $0 $00
    beat as E1+E2
    env $1 $00
    beat gs E1 g E2+E1
    beat gs E2+E1 g E2+E1+E2
; Measure 11b
    env $1 $06 ;env $0 $06 ;
    beat c Q
    env $1 $05 ;env $0 $05 ;
    beat ds E1+E2 f E1+E2
; Measure 12
    env $1 $00 ;env $0 $00 ;
    beat fs Q+E1 od b E2+Q
    vibrato $64
    beat as Q+Q r Q+SYNTH_DELAY
; Measure 13c
    m_musCrownCityTrumpets
    octave 4
    beat as E1 as E2 ou c Q
; Measure 14
    env $0 $00
.rept 2
    beat ds Q f E1 r E2
.endr
; Measure 15
    beat g E1 r E2 g E1 r E2+E1
    beat c E2 ds Q
; Measure 16
    env $0 $05
    beat as E1 gs E2+E1
    beat ds E2+E1 f E2+E1-SYNTH_DELAY

    m_musCrownCitySynth
    env $1 $05 ;env $0 $05 ;
    octave 5
    beat cs E2
; Measure 17
    octaved
    beat as E1 ou c E2 ds E1 f E2
    beat g E1 gs E2+E1
    env $1 $00 ;env $0 $00 ;
    beat as E2+Q
; Measure 18a
    env $1 $05 ;env $0 $05 ;
    beat gs E1 g E2+E1
    beat gs E2+E1 fs E2
; Measure 19
    env $0 $00
    beat g Q r Q
    env $1 $05 ;env $0 $05 ;
    beat ds Q ou c Q
; Measure 20-21
    octaved
    beat as Q+E1
    octaveu
    env $1 $00 ;env $0 $00 ;
    vibrato $63
    beat f E2+Q

    beat ds Q+Q
    env $0 $00
    vibrato $04
    vol LO_VOL
    beat ds Q+SYNTH_DELAY
; Measure 21c
    m_musCrownCityTrumpets
    vol HI_VOL
    octave 4
    beat as E1 as E2 ou c Q
; Measure 22
    env $0 $00
.rept 2
    beat ds Q f E1 r E2
.endr  
; Measure 23
    beat g E1 r E2 g E1 r E2+E1-SYNTH_DELAY
    
    m_musCrownCitySynth
    octave 5
    beat c E2 ds E1 c E2
; Measure 24
    beat fs E1 ds E2 r R1+Y3 e Y4
    env $0 $00
    beat f E2 r E1
    env $1 $00
    beat ds E2+Q+SYNTH_DELAY

; Measure 25
.redefine HI_VOL $7
.redefine LO_VOL $5
    m_musCrownCitySaxes
    octave 5
    beat c HF c HF
; Measure 26
    octaved
    beat b Q ou c Q d E1 r E2 ds Q+Q
; Measure 27b
    beat c E1 r E2

    m_musCrownCityPiano
    octave 3
    vol LO_VOL
    beat g E1 g E2+E1

    m_musCrownCityTrumpets
    octave 4
    vol HI_VOL-1
    beat fs E2
; Measure 28
    beat f E1 ds E2 f E1 c E2
    beat ds E1 f E2 r Q

; Measure 29
   ; m_musCrownCityTrumpets
    vol HI_VOL
    vibrato $e1
    env $0 $06
    octave 5
    beat c Q+E1 r E2 c Q+R1+Y3 r Y4 c E2
; Measure 30
    octaved
    beat as Q fs E1 r E2
    beat f E1 r E2 ds Q+Q
; Measure 31b
    beat c Q

    m_musCrownCityPiano
    octave 3
    vol LO_VOL
    beat g E1 g E2+E1

    m_musCrownCityTrumpets
    vol HI_VOL-1
    octave 4
    beat c E2
; Measure 32
    beat ds E1 fs E2 f E1 ds E2
    beat f E1 c E2 r Q-SYNTH_DELAY
; Measure 33
    m_musCrownCitySynth
    vol HI_VOL
.rept 2
    beat f Y1
    env $0 $00
    beat g Y2+R2+E2+Q
    env $1 $00
.endr
; Measure 34
    beat fs Q g Q a Q ou d Q+Q
; Measure 35
    beat c Q+E1+Y5 od a Y6
    beat b Q+Q
; Measure 36-38
    beat g Q a E1 r E2
    vibrato $a2
    beat as Q+Q
    vibrato $02
    env $0 $00
    vol HI_VOL+1
    beat as Q+Q+E1
    vol LO_VOL+1
    beat as E2+HF
    vol LO_VOL
    beat as Q
; Measure 38d
    octaveu
    vol LO_VOL+1
    vibrato $62
    env $1 $00
    beat f Q+Q
    vol HI_VOL
    vibrato $02
    env $0 $00
    beat f Q+Q+E1
    vol HI_VOL+1
    beat f E2+SYNTH_DELAY

; Measure 41
.redefine HI_VOL $6
.redefine LO_VOL $4
    m_musCrownCityTrumpets
    octave 4
    beat as E1 ou c E2 ds E1 f E2
    rest E1
    vol HI_VOL+1
    beat fs E2+E1 r E2-SYNTH_DELAY

; Measure 42
    m_musCrownCitySynth
    vol HI_VOL
    octave 4
    beat as E1 ou c E2 ds E1 f E2
    beat g E1 r E2 gs E1 g E2
; Measure 43
    rest E1
    beat f E2+E1 ds E2 r E1
    beat c E2 ds E1 f E2
; Measure 44
    beat g Q gs E1 g E2
    rest E1
    beat f E2+E1 ds E2+SYNTH_DELAY
; Measure 45
    m_musCrownCityTrumpets
    vol HI_VOL+1
    octave 4
    beat as E1 ou c E2 r E1 ds E2
    rest E1
    beat c E2+E1-SYNTH_DELAY
    
    m_musCrownCitySynth
    vol HI_VOL
    octave 5
    beat cs E2
; Measure 46
    octaved
    beat as E1 ou c E2 ds E1 f E2
    beat g E1 r E2 gs E1 g E2
; Measure 47
    rest E1
    beat f E2+E1 ds E2 r E1+Y5

    beat as Y6
    env $0 $00
    octaveu
    beat c Q+Q
; Measure 48b
    env $1 $00  
    octaved
    beat as E1 r E2 as Q ou c E1 od fs E2
; Measure 49
    beat f E1 ds E2 f E1 c E2
    beat ds E1+SYNTH_DELAY
    env $0 $00
    beat f E2 e Y1 d Y2 c Y3 od b Y4 a Y5 g Y6

; Measure 50
    m_musCrownCityTrumpets
    ;vol HI_VOL
    octave 4
    beat as E1 ou c E2 ds E1 f E2    
    beat g E1 r E2 gs E1 g E2
; Measure 51
    rest R1+Y3
    env $0 $00
    beat e Y4
    env $0 $05
    beat f E2+E1
    beat ds E2 r E1
    beat c E2 ds E1 f E2
; Measure 52
    beat g Q gs E1 g E2 r R1+Y3
    env $0 $00
    beat e Y4
    env $0 $05
    beat f E2+E1
    beat ds E2
; Measure 53
    rest Q-SYNTH_DELAY
    m_musCrownCitySynth
    octave 4
    beat c Y1 d Y2 f Y3 g Y4 a Y5 b Y6 
    octaveu
    beat c HF+Q
; Measure 54b
    beat ds E1 r E2
    beat fs E1 ds E2 f E1 c E2
; Measure 55
    beat ds Q g E1 r E2+E1
    beat ds E2 f E1 fs E2+E1
; Measure 56a
    beat f E2 fs E1 gs E2+E1
    beat g E2 gs E1 ou cs E2+Q
; Measure 57-58
    octaved
    beat b E1 as E2 r E1 as E2+R1+Y3
    beat gs Y4
    env $0 $00 
    vibrato $a2
    beat as E2+HF+Q
    vibrato $02
    vol LO_VOL
    beat as Q

; Measure 59
    rest Q+SYNTH_DELAY
    m_musCrownCityPiano
    env $0 $07
    octave 5
    vol HI_VOL
    beat f E1 g E2
    beat f Q ds Q
; Measure 60
    beat cs Q+E1 c E2+Q 
    octaved
    beat as Q+Q r Q
; Measure 61c
    beat as Q ou c E1 ds E2
; Measure 62-63
    beat fs E1 f E2
    beat ds R1 c R2 od as R3
    octaveu
    beat ds Q f E1

    env $0 $00
    vibrato $e1
    beat ds E2+HF+E1
    vibrato $01
    vol LO_VOL
    beat ds E2+Q-SYNTH_DELAY

; Measure 64-65
    m_musCrownCitySynth
    vol HI_VOL
    octave 5
    beat gs R1 as R2 gs R3
    beat fs R1 ds R2 cs R3
    octaved
    beat fs Q as R1

    beat gs R2+R3+Q+E1
    vibrato $02
    env $0 $00
    vol LO_VOL
    beat gs E2+Q

    vol HI_VOL
    env $1 $00
    vibrato $62
    beat f E1 cs E2

    goto @measure9Loop
    cmdff

musCrownCityChannel0:
.redefine HI_VOL $6
.redefine LO_VOL $4

; Measure 1
    m_musCrownCityTrumpets
    env $0 $06
    vol HI_VOL
    octave 3
    beat as HF gs Q+E1 as E2+Q+E1
; Measure 2b-4
    beat fs E2+Q

    octave 5
    beat gs E1
    vibrato $e1
    env $0 $00
    beat as E2+HF+E1
    vol LO_VOL
    vibrato $01
    beat as E2+Q+Q
    vol LO_VOL-2
    beat as Q+HF
; Measure 5
    vibrato $00
    env $0 $06
    vol HI_VOL
    octave 4
    beat cs HF cs Q+E1 od b E2+Q+E1
; Measure 6b
    vibrato $e1
    env $0 $00
    beat a E2+HF+E1
    vol LO_VOL
    vibrato $01
    beat a E2+HF
    vol LO_VOL-2
    beat a Q
; Measure 8
    vol HI_VOL+1
    env $0 $04
    vibrato $00
    beat as E1 as E2 r E1 as E2 r E1
    env $0 $06
    beat as E2+Q

.macro m_musCrownCityChannel0Measure9
    beat \1 Q+E1 \2 E2
    beat r E1 \2 E2 r E1 \3 E2
.endm
.macro m_musCrownCityChannel0Measure10
    beat \1 Q+E1 \2 E2
    beat r E1 \3 E2 \2 E1 \4 E2
.endm

@measure9Loop:
.redefine HI_VOL $5
.redefine LO_VOL $3
; Measure 9
    m_musCrownCityPiano
    vol HI_VOL
    octave 3
    m_musCrownCityChannel0Measure9 ds gs gs c 
; Measure 10
    m_musCrownCityChannel0Measure10 ds gs f c
; Measure 11
    m_musCrownCityChannel0Measure9 g gs as2
; Measure 12
    m_musCrownCityChannel0Measure10 d gs b2 as2
; Measure 13   
    beat f Q+E1 r E2

; Measure 13c
    m_musCrownCityTrumpets
    octave 4
    beat ds E1 ds E2 f Q
; Measure 14
    env $0 $00
    beat gs E1 as E2 ou c E1 r E2
    octaved 
    beat as Q ou c E1 r E2
; Measure 15
.rept 2
    beat c E1 r E2
.endr
    
    rest E1
    m_musCrownCityPiano
    octave 3
    beat gs E2 r E1 od as E2
; Measure 16
    m_musCrownCityTrumpets
    octave 5
    beat ds E1 r E2+E1
    octaved
    beat gs E2 r E1 as E2+Q
; Measure 17
    m_musCrownCityPiano
    octave 3
    m_musCrownCityChannel0Measure9 ds gs c
; Measure 18
    m_musCrownCityChannel0Measure10 ds gs f c
; Measure 19
    m_musCrownCityChannel0Measure9 g gs as2
; Measure 20
    m_musCrownCityChannel0Measure10 d gs b2 as2
; Measure 21
    beat f Q+E1 r E2
; Measure 21c
    m_musCrownCityTrumpets
    octave 4
    beat ds E1 ds E2 f Q
; Measure 22
    env $0 $00
    beat as E1 r E2 ou cs E1 r E2
    octaved 
    beat as Q ou c E1 r E2
; Measure 23
.rept 2
    beat c E1 r E2
.endr

    rest E1
    m_musCrownCityPiano
    octave 3
    beat gs E2 r E1 od as E2
; Measure 24
    octaveu
    beat ds Q+E1 g E2 r E1 c E2
    vol HI_VOL+1
    m_musCrownCitySaxes
    beat g Q

.redefine HI_VOL $6
.redefine LO_VOL $4
; Measure 25
    m_musCrownCitySaxes
    vol HI_VOL
    octave 3
    beat gs HF gs HF
; Measure 26
    beat g Q a Q b E1 r E2 ou c Q+Q
; Measure 27b
    octaved
    beat g E1 r E2

    m_musCrownCityPiano
    octave 2
    vol LO_VOL
    beat as E1 ou c E2+Q
; Measure 28
    m_musCrownCityTrumpets
    octave 2
    vol HI_VOL-1
    beat g E1 r E2 gs E1 r E2 g Q r E1

    ;m_musCrownCityTrumpets
    vol HI_VOL
    vibrato $e1
    env $0 $06
    octave 3
    beat as E2
; Measure 29
    beat as Q+E1 r E2 as Q+E1 r E2
; Measure 30
    beat gs Q g E1 r E2
    beat f E1 r E2 ds Q+Q
; Measure 31b
    octaved 
    beat gs Q

    m_musCrownCityPiano
    octave 2
    vol LO_VOL
    beat as E1 ou c E2+Q
; Measure 32
    m_musCrownCityTrumpets
    vol HI_VOL-1
    octave 2
    beat gs E1 r E2 gs E1 r E2 gs Q r E1

    ;m_musCrownCityTrumpets
    vol HI_VOL
    env $0 $06
    octave 3
    beat f E2
; Measure 33
    octaveu
    beat c Q r Q 
    vol HI_VOL+1
    beat c Q r Q+Q
; Measure 34b
    vol HI_VOL
    beat cs Q r Q
    env $0 $00
    beat d Q+HF r Q
; Measure 35d
    env $0 $05
    octaved
    beat b Q r Q
; Measure 36b
    beat g Q a E1 r E2
    vol HI_VOL+1
    beat g Q
; Measure 37
    m_musCrownCityPiano
    octave 4
    vol LO_VOL-2
    beat c Q
    vol LO_VOL-1
    beat c Q c Q
    vol LO_VOL
    beat c Q
; Measure 38
    beat c Q
    vol HI_VOL-1
    beat c Q c Q
    vol HI_VOL
    beat c Q
; Measure 39
    beat d Q
    vol HI_VOL+1
    beat d Q d Q
    vol HI_VOL+1
    beat d Q

; Measure 41
.redefine HI_VOL $7
.redefine LO_VOL $5
    m_musCrownCitySynth
    octave 5
    vibrato $02
    vol HI_VOL+1
    beat f Q+E1 r E2+E1

.redefine HI_VOL $5
.redefine LO_VOL $3
    m_musCrownCityPiano
    vol HI_VOL
    octave 4
    beat d E2+Q
; Measure 42
    octaved
    beat g Q as E1 d E2

.redefine HI_VOL $7
.redefine LO_VOL $5
    m_musCrownCityTrumpets
    env $0 $00
    octave 6
    vol HI_VOL
    beat ds E1+Y5 d Y6

.redefine HI_VOL $5
.redefine LO_VOL $3
    m_musCrownCityPiano
    vol HI_VOL
    octave 3
    beat gs Q
; Measure 43
    beat c E1 c E2 gs E1 r E2
    beat g E1 r E2 b E1 g E2
; Measure 44
    rest E1
    beat as E2 r E1 g E2
    beat c E1 r E2 as E1 r E2

; Measure 45
    m_musCrownCityTrumpets
    vol HI_VOL+1
    octave 4
    beat f E1 g E2 r E1 as E2
    rest E1
    beat g E2+E1

    m_musCrownCityPiano
    octave 3
    vol HI_VOL
    beat g E2
; Measure 46
    beat g Q as E1 d E2

.redefine HI_VOL $7
.redefine LO_VOL $5
    m_musCrownCityTrumpets
    env $0 $00
    octave 6
    vol HI_VOL
    beat ds E1+Y5 d Y6 r Q
    
; Measure 47
.redefine HI_VOL $5
.redefine LO_VOL $3
    m_musCrownCityPiano
    vol HI_VOL
    octave 3    
    beat as E1 as E2 g E1 r E2
    beat f E1 r E2 as E1 f E2
; Measure 48
    rest E1
    beat gs E2 r E1 ds E2
    beat c E1 r E2 gs E1 ds E2
; Measure 49
    beat g E1 g E2
    beat d Q ds Q e Q
; Measure 50
    beat f Q as E1 ds E2
    rest E1
    beat d E2 r E1 f E2
; Measure 51
    rest E1
    beat gs E2 r E1 f E2
    beat c E1 r E2 ds E1 g E2
; Measure 52
    beat ds Q+E1 ds E2
    rest E1
    beat gs E2 r E1+E2
; Measure 53
    beat c HF
    beat gs E1 fs E2+E1 r E2
; Measure 54
.rept 2
    beat ds Q+E1 r E2
.endr
; Measure 55
    m_musCrownCityTrumpets
    octave 4
    beat as Q ds E1 r E2

    octave 3
    env $0 $00
    beat d Q+E1 fs E2+Q+E1
; Measure 56b
    beat gs E2+Q+E1 as E2+Q+E1
; Measure 57b-59
    beat b E2+Q+E1

    vibrato $e1
    beat f E2+HF+Q
    vibrato $01
    vol LO_VOL
    beat f Q+Q+E1
    vol LO_VOL-1
    beat f E2+Q r Q
    
; Measure 60
    m_musCrownCityPiano
    env $0 $07
    octave 4
    vol HI_VOL
    beat gs Q+E1 gs E2+Q
    beat g Q+Q r HF+E1
; Measure 61d
    beat as E2 r HF
; Measure 62c-63
    beat gs Q as E1

    env $0 $00
    vibrato $e1
    beat gs E2+HF+E1
    vibrato $01
    vol LO_VOL
    beat gs E2+Q

; Measure 64
    octave 3
    vol HI_VOL
    vibrato $00
    beat g HF gs Q od b Q
; Measure 65
    octaveu
    beat f Q g E1 r E2+E1
    beat ds E2+Q

    goto @measure9Loop
    cmdff


.macro m_musCrownCityChannel4Quarter
.if \1 == 0
    duty HI_VOL
    beat \2 E1
    duty LO_VOL
    beat \2 E2
.else ;\1 == 1
    duty HI_VOL
    beat \2 E2
    duty LO_VOL
    beat \2 E1
.endif
.endm
.macro m_musCrownCityChannel4QuarterStacc
.if \1 == 0
    duty HI_VOL
    beat \2 E1
    duty LO_VOL
    beat \2 Y5 r Y6
.else ;\1 == 1
    duty HI_VOL
    beat \2 E2
    duty LO_VOL
    beat \2 R1 r R2
.endif
.endm
.macro m_musCrownCityChannel4QuarterDotted
.if \1 == 0
    duty HI_VOL
    beat \2 Q
    duty LO_VOL
    beat \2 E1
.else ;\1 == 1
    duty HI_VOL
    beat \2 E2+E1
    duty LO_VOL
    beat \2 E2
.endif
.endm
.macro m_musCrownCityChannel4QuarterDottedStacc
.if \1 == 0
    duty HI_VOL
    beat \2 Q
    duty LO_VOL
    beat \2 R1 r R2
.else ;\1 == 1
    duty HI_VOL
    beat \2 E2+E1
    duty LO_VOL
    beat \2 Y5 r Y6
.endif
.endm
.macro m_musCrownCityChannel4Measure27b
.if \1 == 0
    m_musCrownCityChannel4Quarter 0 \2
.else ;\1 == 1
    m_musCrownCityChannel4QuarterStacc 0 \2
.endif
    rest E1
    duty HI_VOL
    beat \3 E2 \4 Q
.if \5 == 1
    duty LO_VOL
    beat \4 Q
.endif
.endm
.macro m_musCrownCityChannel4Measure29
    m_musCrownCityChannel4Quarter 0 \1
    m_musCrownCityChannel4QuarterStacc 0 \2
    duty HI_VOL
    beat \1 E1 \2 E2
    m_musCrownCityChannel4Quarter 0 \1
.endm
.macro m_musCrownCityChannel4Measure42
    m_musCrownCityChannel4QuarterDotted 0 \1
    duty HI_VOL
    beat \2 E2 r E1 \3 E2
    m_musCrownCityChannel4Quarter 0 \4
.endm
.macro m_musCrownCityChannel4Measure43
    m_musCrownCityChannel4Quarter 0 \1
    m_musCrownCityChannel4QuarterStacc 0 \2    
    m_musCrownCityChannel4Quarter 0 \3
    m_musCrownCityChannel4QuarterStacc 0 \4
.endm    

musCrownCityChannel4:
.redefine HI_VOL $0e
.redefine LO_VOL $0f

; Measure 1
    octave 3
    m_musCrownCityChannel4Quarter 0 f3
    m_musCrownCityChannel4Quarter 0 f4
    duty HI_VOL
    beat ds E1
    m_musCrownCityChannel4QuarterStacc 1 ds4
    m_musCrownCityChannel4Quarter 1 cs3
; Measure 2a-4
    m_musCrownCityChannel4QuarterStacc 1 cs4
    octave 2
    duty HI_VOL
    beat b E2+HF+Q
    duty LO_VOL
    beat b Q+HF+Q r Q+HF
; Measure 5
    m_musCrownCityChannel4Quarter 0 gs2
    m_musCrownCityChannel4Quarter 0 gs3
    octave 2
    duty HI_VOL
    beat gs E1
    m_musCrownCityChannel4QuarterStacc 1 gs3
    m_musCrownCityChannel4Quarter 1 e2
; Measure 6a-7
    m_musCrownCityChannel4QuarterStacc 1 e3    
    octave 2
    duty HI_VOL
    beat d E2+HF
    
    duty LO_VOL
; up
    beat ds T1 e T2 f T3 fs T4 g T5 gs T6 a T7 as T8
    beat b T1 ou c T2 cs T3 d T4 ds T5 e T6 f T7 fs T8
; down
    beat e T1 ds T2 d T3 cs T4 c T5 od b T6 as T7 a T8
    beat gs T1 g T2 fs T3 f T4 e T5 ds T6 d S4
; Measure 8
    octave 3
    duty HI_VOL
    beat c E1
    m_musCrownCityChannel4Quarter 1 c3
    duty HI_VOL
    beat c E2 r E1
    m_musCrownCityChannel4QuarterDotted 1 fs2

@measure9Loop:
; Measure 9
    m_musCrownCityChannel4QuarterDotted 0 f2
    octave 3
    duty HI_VOL
    beat f E2 r HF+E1
; Measure 10a
    beat f E2
    m_musCrownCityChannel4Quarter 0 g2
    m_musCrownCityChannel4Quarter 0 gs2
    m_musCrownCityChannel4Quarter 0 a2
; Measure 11
    m_musCrownCityChannel4QuarterDotted 0 as2
    octave 3
    duty HI_VOL
    beat as E2 r E1 as E2
    m_musCrownCityChannel4Quarter 0 gs2
; Measure 12
    m_musCrownCityChannel4QuarterStacc 0 as2
    m_musCrownCityChannel4QuarterStacc 0 as2
    rest Q
    m_musCrownCityChannel4Quarter 0 gs2

; Measure 13
    m_musCrownCityChannel4QuarterDotted 0 f2
    octave 3
    duty HI_VOL
    beat f E2 r HF+E1
; Measure 14a
    beat f E2
    m_musCrownCityChannel4Quarter 0 g2
    m_musCrownCityChannel4Quarter 0 gs2
    m_musCrownCityChannel4Quarter 0 a2
; Measure 15
    m_musCrownCityChannel4QuarterDotted 0 as2
    octave 3
    duty HI_VOL
    beat as E2 r Q
    m_musCrownCityChannel4Quarter 0 gs2
; Measure 16
    m_musCrownCityChannel4QuarterDottedStacc 0 as2
    duty HI_VOL
    beat as2 E2 r E1
    m_musCrownCityChannel4QuarterDottedStacc 1 as2

; Measure 17
    m_musCrownCityChannel4QuarterDotted 0 f2
    octave 3
    duty HI_VOL
    beat f E2 r HF+E1
; Measure 18a
    beat f E2
    m_musCrownCityChannel4Quarter 0 g2
    m_musCrownCityChannel4Quarter 0 gs2
    m_musCrownCityChannel4Quarter 0 a2
; Measure 19
    m_musCrownCityChannel4QuarterDotted 0 as2
    octave 3
    duty HI_VOL
    beat as E2 r E1 od as Y5 r Y6
    m_musCrownCityChannel4Quarter 0 gs2
; Measure 20
    rest Q
    m_musCrownCityChannel4Quarter 0 gs2
    m_musCrownCityChannel4Quarter 0 as2
    m_musCrownCityChannel4Quarter 0 gs2

; Measure 21
    m_musCrownCityChannel4QuarterDotted 0 g2
    octave 3
    duty HI_VOL
    beat g E2 r E1 od g Y5 r Y6
    m_musCrownCityChannel4Quarter 0 g2
; Measure 22
    m_musCrownCityChannel4Quarter 0 f2
    m_musCrownCityChannel4Quarter 0 g2
    m_musCrownCityChannel4Quarter 0 as2
    m_musCrownCityChannel4Quarter 0 b2
; Measure 23
    m_musCrownCityChannel4QuarterDotted 0 c3
    octave 4
    duty HI_VOL
    beat c E2 r E1 od c Y5 r Y6
    m_musCrownCityChannel4Quarter 0 c3
; Measure 24
    m_musCrownCityChannel4Quarter 0 as2
    m_musCrownCityChannel4Quarter 0 c3
    m_musCrownCityChannel4Quarter 0 f2
    m_musCrownCityChannel4Quarter 0 g2  

; Measure 25
    octave 3
.rept 2
    duty HI_VOL
    beat gs Q
    duty LO_VOL
    beat gs E1 r E2
.endr
; Measure 26
    duty HI_VOL
    beat g E1 ou g E2
    m_musCrownCityChannel4Measure27b 1 g2 g3 c3 1
; Measure 27b
    m_musCrownCityChannel4Measure27b 0 c3 c4 f2 1
; Measure 28b
    m_musCrownCityChannel4Measure27b 1 f3 c4 a2 0
; Measure 29
    m_musCrownCityChannel4Measure29 as2 as3
; Measure 30
    m_musCrownCityChannel4Quarter 0 ds3
    m_musCrownCityChannel4Measure27b 0 ds4 g3 gs2 1
; Measure 31b
    m_musCrownCityChannel4Measure27b 0 gs3 g3 cs3 1
; Measure 32b
    m_musCrownCityChannel4Measure27b 0 cs3 g3 gs3 0
; Measure 33
    m_musCrownCityChannel4Measure29 a2 a3
; Measure 34
    duty HI_VOL
    octave 3
    beat d3 E1 d4 E2
    m_musCrownCityChannel4Measure27b 0 d3 g3 g2 1
; Measure 35b
    m_musCrownCityChannel4Measure27b 0 g2 g3 c3 1
; Measure 36b
    m_musCrownCityChannel4Measure27b 0 c3 gs3 f3 1
; Measure 37b-38
.rept 7
    m_musCrownCityChannel4Quarter 0 f2
.endr
; Measure 39
.rept 4
    m_musCrownCityChannel4QuarterStacc 0 as2
.endr
; Measure 41
    octave 2
    duty HI_VOL
    beat as Q
    duty LO_VOL
    beat as E1 r E2+E1

    m_musCrownCityChannel4QuarterDotted 1 as2
; Measure 42
    octave 3
    m_musCrownCityChannel4Measure42 ds3 ds4 as3 ds3
; Measure 43
    m_musCrownCityChannel4Measure43 d3 d4 g2 g3
; Measure 44
    m_musCrownCityChannel4Measure42 c3 c4 gs3 c3
; Measure 45
    m_musCrownCityChannel4Measure43 as2 as3 a2 a3
; Measure 46
    m_musCrownCityChannel4Measure42 gs2 gs3 gs3 gs2
; Measure 47
    m_musCrownCityChannel4Measure43 g2 g3 fs2 fs3
; measure 48
    octave 2
    duty HI_VOL
    beat f E1 ou f E2
    m_musCrownCityChannel4Quarter 0 g2
    m_musCrownCityChannel4Quarter 0 gs2
    m_musCrownCityChannel4Quarter 0 a2
; Measure 49
    m_musCrownCityChannel4Quarter 0 as2
    m_musCrownCityChannel4QuarterDotted 0 as2
    m_musCrownCityChannel4QuarterDotted 1 as2
; Measure 50
    octave 3
    duty HI_VOL
    beat ds Q
    duty LO_VOL
    beat ds E1 r E2+E1
    duty HI_VOL
    beat as E2   
    m_musCrownCityChannel4Quarter 0 ds3
; Measure 51
    octave 3
    duty HI_VOL
    beat d Q
    duty LO_VOL
    beat d E1 r E2
    m_musCrownCityChannel4Quarter 0 g2
    m_musCrownCityChannel4QuarterStacc 0 g3
; Measure 52
    m_musCrownCityChannel4Measure43 c3 c4 as2 as3 
; Measure 53
    m_musCrownCityChannel4Quarter 0 a2
    m_musCrownCityChannel4QuarterStacc 0 a3
    octave 2
    duty HI_VOL
    beat gs Q+E1
    duty LO_VOL
    beat gs E2
; Measure 54
.rept 2
    m_musCrownCityChannel4QuarterDotted 0 gs2
    octave 3
    duty HI_VOL
    beat gs E2
.endr
; Measure 55
.rept 2
    m_musCrownCityChannel4QuarterDotted 0 g2
    octave 3
    duty HI_VOL
    beat g E2
.endr
; Measure 56
.rept 2
    m_musCrownCityChannel4QuarterDotted 0 gs2
    octave 3
    duty HI_VOL
    beat gs E2
.endr
; Measure 57
.rept 2
    m_musCrownCityChannel4QuarterDotted 0 ds3
    octave 4
    duty HI_VOL
    beat ds E2
.endr

; Measure 58-63
.rept 3
    octave 2
    m_musCrownCityChannel4QuarterDotted 0 ds
    m_musCrownCityChannel4QuarterDotted 1 as
    octaveu
    duty HI_VOL
    beat ds Q+Q+E1
    duty LO_VOL
    beat ds E2+Q

    octaved
    duty HI_VOL
    beat as Q
.endr
; Measure 64
    octave 3
    duty HI_VOL
    beat cs Q+E1
    duty LO_VOL
    beat cs E2    

    octaved
    duty HI_VOL
    beat gs Q+E1
    duty LO_VOL
    beat gs E2  
; Measure 65
    octaveu
    duty HI_VOL
    beat c Q+E1
    duty LO_VOL
    beat c E2    

    octaved
    duty HI_VOL
    beat fs Q+E1
    duty LO_VOL
    beat fs E2 

    goto @measure9Loop
    cmdff


musCrownCityChannel6:
.redefine HI_VOL $6
.redefine LO_VOL $4

.redefine HIT       $24; ;snare  ;$2a 
.redefine CRASH     $27;$2e;22 ;crash symbol   ;$52,$2e 
.redefine LO_TOM    $25;24 ;tom/clap
.redefine HI_TOM    $23;25
.redefine BASS      $29


; Measure 1
    vol HI_VOL
    beat CRASH Q+E1 HIT E2
    beat CRASH E1 HIT E2 HIT E1 CRASH E2+E1
; Measure 2
    beat HIT E2 HIT E1 CRASH E2
    rest HF+HF
; Measure 3c
    beat BASS R1 HIT R2 HI_TOM R3
    beat HIT R1 HIT R2 HIT R3
; Measure 4
    beat HIT E1 HI_TOM E2
    beat HIT R1 BASS R2 HIT R3
    beat BASS R1 LO_TOM R2 BASS R3
    beat LO_TOM R1 HI_TOM R2 LO_TOM R3 
; Measure 5
    beat BASS HF
    beat CRASH E1 HIT E2 HIT E1 CRASH E2+E1
; Measure 6
    beat HIT E2 HIT E1 CRASH E2
    rest HF+HF
; Measure 7c
    beat HIT E1 HIT E2 LO_TOM E1 HIT E2
; Measure 8
    beat HIT E1 HIT E2 r E1 HIT E2
    beat HIT E1 HIT E2+E1 HIT E2

/*
@measure9Loop
    beat BASS HF
    beat HIT HF
    goto @measure9Loop
*/

/*
@measure9Loop:
; Measure 9
    beat CRASH Q+E1 BASS E2
    beat HIT Q r Q+Q
; Measure 10b
    beat BASS Q
    beat HIT E1 BASS E2+E1 HIT E2
; Measure 11 (M9)
    beat BASS Q+E1 BASS E2
    beat HIT Q r Q+Q
; Measure 12b
    beat BASS Q
    beat HIT E1 BASS E2+E1 HIT E2
    ;goto @measure9Loop
; Measure 13
    beat BASS Q+E1 HIT E2
    beat HIT HF+Q
; Measure 14b
    beat BASS Q HIT E1 BASS E2+E1 HIT E2+Q
; Measure 15b
    beat BASS E1 HIT E2 HIT E1 HIT E2
    beat BASS Q
; Measure 16
    beat HIT E1 HIT E2+E1 HIT E2
    beat HIT E1 BASS E2+Q
; Measure 17
    beat CRASH HF HIT HF+Q
; Measure 18b (M10)
    beat BASS Q
    beat HIT E1 BASS E2+E1 HIT E2


    ;goto @measure9Loop
*/
    cmdff

;.redefine musCrownCityChannel6  MUSIC_CHANNEL_FALLBACK EXPORT