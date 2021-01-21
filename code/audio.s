.include "include/rominfo.s"
.include "include/musicMacros.s"

.include "include/constants.s"

; HACK-BASE: Bank of sound engine (and of data in "audio/{game}/soundChannelData.s") changed to
; allocate more space to the compressed data section (text, graphics, room layouts).
.BANK $72 SLOT 1
.ORG 0

;;
b39_initSound:
	jp _initSound

;;
b39_updateSound:
	jp _updateSound

;;
; @param	a	Sound to play
b39_playSound:
	jp _playSound

;;
b39_stopSound:
	jp _stopSound

;;
; Unused? (The address it jumps too doesn't seem like it would do anything useful...)
func_39_400c:
	pop af
	jp $4d3e

;;
; @param	a	Volume (0-3)
b39_updateMusicVolume:
	jp _updateMusicVolume


; This is pointless?
.dw sound00


;;
_initSound:
	ldh (<hSoundDataBaseBank),a
	call _stopSound
	ld a,$03
	ld (wMusicVolume),a
	ld a,$00
	ld (wSoundFadeDirection),a
	ld (wSoundFadeCounter),a
	ld (wSoundDisabled),a
	ld (wc023),a
	ld a,$8f
	ld ($ff00+R_NR52),a
	ld a,$77
	ld (wSoundVolume),a
	ld ($ff00+R_NR50),a
	ld a,$ff
	ld ($ff00+R_NR51),a
	ld c,@readFunctionEnd-@readFunction+2
	ld hl,@readFunction
	ld de,wMusicReadFunction
-
	ldi a,(hl)
	ld (de),a
	inc de
	dec c
	jr nz,-
	ret

; This function is copied to wMusicReadFunction and executed there.
@readFunction:
	ldh (<hSoundDataBaseBank2),a
	ld ($2000),a
	ldi a,(hl)
	ld c,a
	ldh a,(<hSoundDataBaseBank)
	ldh (<hSoundDataBaseBank2),a
	ld ($2000),a
	ld a,c
	ret
	ret
	ret
@readFunctionEnd:


;;
; @param	a	Volume (0-3)
;
_updateMusicVolume:
	push bc
	push de
	push hl
	push af
	call @updateSquareChannelVolumes

	pop af
	ld (wMusicVolume),a
	cp $00
	jr nz,+

	ld a,$01
	jr ++
+
	ld a,$00
++
	ld (wc023),a
	pop hl
	pop de
	pop bc
	ret

;;
@updateSquareChannelVolumes:
	; Update square 1's volume
	ld a,$00
	ld (wSoundChannel),a
	ld hl,wChannelsEnabled
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,+
	call _updateChannelStuff
+
	; Update square 2's volume
	ld a,$01
	ld (wSoundChannel),a
	ld hl,wChannelsEnabled
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,+
	call _updateChannelStuff
+
	ret

;;
_stopSound:
	ld a,$00
-
	ld (wSoundChannel),a
	call _channelCmdff
	ld a,(wSoundChannel)
	inc a
	cp $08
	jr nz,-
	ret

;;
_func_39_40b9:
	ld a,$00
-
	ld (wSoundChannel),a
	call _updateChannelStuff
	ld a,(wSoundChannel)
	inc a
	cp $08
	jr nz,-
	ret

;;
; Disable all sound effect channels
;
_stopSfx:
	; Square 1
	ld a,$02
	ld (wSoundChannel),a
	ld hl,wChannelsEnabled
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,+
	call _channelCmdff
+
	; Square 2
	ld a,$03
	ld (wSoundChannel),a
	ld hl,wChannelsEnabled
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,+
	call _channelCmdff
+
	; Wave
	ld a,$05
	ld (wSoundChannel),a
	ld hl,wChannelsEnabled
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,+
	call _channelCmdff
+
	; Noise
	ld a,$07
	ld (wSoundChannel),a
	ld hl,wChannelsEnabled
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,+
	call _channelCmdff
+
	ret

;;
_updateSound:
	push bc
	push de
	push hl
	ld a,(wSoundDisabled)
	cp $00
	jr z,+
	jp @ret
+
	ld a,(wSoundVolume)
	ld ($ff00+R_NR50),a
	ld a,(wSoundFadeDirection)
	cp $00
	jr z,@updateChannels

	ld a,(wSoundFadeSpeed)
	ld b,a
	ld a,(wSoundFadeCounter)
	inc a
	ld (wSoundFadeCounter),a
	and b
	cp b
	jr nz,@updateChannels

	ld a,(wSoundFadeDirection)
	cp $0a
	jr z,@incVolume

@decVolume:
	ld a,(wSoundVolume)
	cp $00
	jr z,@stopSound

	sub $11
	ld (wSoundVolume),a
	jp @updateChannels

@incVolume:
	ld a,(wSoundVolume)
	cp $77
	jr z,@clearFadeVariables

	add $11
	ld (wSoundVolume),a
	jp @updateChannels

@stopSound:
	call _stopSound

@clearFadeVariables:
	ld a,$00
	ld (wSoundFadeCounter),a
	ld (wSoundFadeDirection),a

@updateChannels:
	ld a,$00
@channelLoop:
	ld (wSoundChannel),a
	ld hl,wChannelsEnabled
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,@nextChannel

	ld hl,wChannelWaitCounters
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr nz,+

	call _doNextChannelCommand
	jr @nextChannel
+
	call _func_39_41c2
@nextChannel:
	ld a,(wSoundChannel)
	inc a
	cp $08
	jr nz,@channelLoop

	ld a,(wc023)
	cp $01
	jr nz,@ret

	ld a,$02
	ld (wc023),a

@ret:
	pop hl
	pop de
	pop bc
	ret

;;
_func_39_41c2:
	ld hl,wChannelWaitCounters
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	dec a
	ld (hl),a
	ld a,(wSoundChannel)
	cp $06
	jr nc,@ret

	ld hl,wc039
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	and $40
	jr nz,@ret
	ld a,(wSoundChannel)
	cp $05
	jr nc,+
	call _func_39_464c
+
	call _func_39_41f3
@ret:
	ret

;;
_func_39_41f3:
	ld hl,wc03f
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	ld c,a
	and $7f
	jr z,_label_39_024

	ld a,c
	and $80
	jr nz,+

	ld d,$00
	jr ++
+
	ld d,$ff
++
	push de
	ld hl,wc03f
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	pop de
	ld e,a
	ld a,(wSoundChannel)
	sla a
	ld b,a
	ld a,b
	add <hSoundData3
	ld c,a
	ld a,($ff00+c)
	inc c
	ld l,a
	ld a,($ff00+c)
	inc c
	ld h,a
	add hl,de
	ld a,(wSoundChannel)
	sla a
	ld b,a
	ld a,l
	ld c,<hSoundData3
	call _writeIndexedHighRamAndIncrement
	ld a,h
	ld ($ff00+c),a
	inc c
_label_39_024:
	ld hl,wc045
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	and $10
	jr nz,_label_39_026

	ld hl,wc051
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,_label_39_025

	dec a
	ld hl,wc051
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	ld hl,$0000
	jp _func_42d1

_label_39_025:
	ld a,$10
	ld hl,wc045
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	ld a,$00
	ld hl,wc051
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
_label_39_026:
	ld hl,wc051
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $08
	jr nz,_label_39_027

	ld a,$00
	ld hl,wc051
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	ld a,$00
_label_39_027:
	ld hl,_data_4b40
	call _readWordFromTable
	push hl
	ld hl,wc051
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	inc a
	ld (hl),a
	ld hl,wChannelVibratos
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	and $0f
	pop hl
	call _func_39_4a10

;;
_func_42d1:
	ld a,(wSoundChannel)
	sla a
	ld b,a
	ld a,b
	add $f2
	ld c,a
	ld a,($ff00+c)
	inc c
	ld e,a
	ld a,($ff00+c)
	inc c
	ld d,a
	add hl,de
	ld a,l
	ld (wSoundFrequencyL),a
	ld a,h
	ld (wSoundFrequencyH),a

;;
_func_42ea:
	ld a,(wSoundChannel)
	scf
	ccf
	cp $04
	jr nc,_label_39_029

	cp $02
	jr nc,_label_39_028

	inc a
	inc a
	ld e,a
	ld hl,wChannelsEnabled
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,_label_39_028
	ret

_label_39_028:
	ld a,(wSoundChannel)
	and $01
	ld b,a
	sla a
	sla a
	add b
	ld b,a
	push bc
	ld a,(wSoundFrequencyL)
	ld c,R_NR13
	call _writeIndexedHighRamAndIncrement
	ld a,(wSoundCmdEnvelope)
	ld e,a
	ld a,(wSoundFrequencyH)
	or e
	ld ($ff00+c),a
	inc c
	pop bc
	push bc
	ld hl,wChannelDutyCycles
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	pop bc
	ld c,$11
	call _writeIndexedHighRamAndIncrement
	ret

_label_39_029:
	call _func_39_434b
	cp $00
	jr nz,_label_39_030
	ld a,l
	ld ($ff00+R_NR33),a
	ld a,h
	ld ($ff00+R_NR34),a
	ld a,$00
	ld ($ff00+R_NR31),a
_label_39_030:
	ret

;;
; @param[out]	a	0 or 1 (something about whether wSoundChannel can be active?)
_func_39_434b:
	ld a,(wSoundChannel)
	cp $05
	jr z,@zero

	ld a,(wChannelsEnabled+5)
	cp $00
	jr nz,@one

	ld a,(wc023)
	cp $02
	jr z,@one
@zero:
	ld a,$00
	ret
@one:
	ld a,$01
	ret

;;
_getNextChannelByte:
	push bc
	push de
	push hl
	ld a,(wSoundChannel)
	sla a
	add <hSoundChannelAddresses
	ld c,a
	ld a,($ff00+c)
	inc c
	ld l,a
	ld a,($ff00+c)
	ld h,a
	ld a,(wSoundChannel)
	add <hSoundChannelBanks
	ld c,a
	ld a,($ff00+c)
	inc c
	call wMusicReadFunction
	push af
	ld a,(wSoundChannel)
	sla a
	ld b,a
	ld a,l
	ld c,<hSoundChannelAddresses
	call _writeIndexedHighRamAndIncrement
	ld a,h
	ld ($ff00+c),a
	inc c
	pop af
	pop hl
	pop de
	pop bc
	ret

;;
_doNextChannelCommand:
	call _getNextChannelByte
	scf
	ccf
	cp $f0
	jr nc,@cmdf0Toff

	scf
	ccf
	cp $e0
	jr c,+
	jp _cmde0Toef
+
	scf
	ccf
	cp $d0
	jr c,+
	jp _cmdVolume
+
	ld (wSoundCmd),a
	jp _standardSoundCmd

@cmdf0Toff:
	ld e,a
	ld a,$ff
	sub e
	ld hl,@table
	call _readWordFromTable
	jp hl

@table:
	.dw _channelCmdff
	.dw _channelCmdfe
	.dw _channelCmdfd
	.dw _channelCmdff
	.dw _channelCmdff
	.dw _channelCmdff
	.dw _channelCmdf9
	.dw _channelCmdf8
	.dw _channelCmdff
	.dw _channelCmdf6
	.dw _channelCmdff
	.dw _channelCmdff
	.dw _channelCmdf3
	.dw _channelCmdf2
	.dw _channelCmdf1
	.dw _channelCmdf0

;;
_channelCmdf1:
	call _getNextChannelByte
	ld hl,wVolta
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	cp (hl)
	jp z, _channelCmdfe
	call _getNextChannelByte
	call _getNextChannelByte
	jp _doNextChannelCommand
;;
_channelCmdf2:
	jp _doNextChannelCommand
;;
_channelCmdf3:
	call _getNextChannelByte
	ld hl,wVolta
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	jp _doNextChannelCommand

;;
; Vibrato
;
_channelCmdf9:
	ld a,(wSoundChannel)
	scf
	ccf
	cp $06
	jr nc,++

	call _getNextChannelByte
	ld hl,wChannelVibratos
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	jp _doNextChannelCommand

;;
_channelCmdf8:
	ld a,(wSoundChannel)
	scf
	ccf
	cp $06
	jr nc,++

	call _getNextChannelByte
	ld hl,wc03f
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	jp _doNextChannelCommand

;;
_channelCmdfd:
	ld a,(wSoundChannel)
	scf
	ccf
	cp $06
	jr nc,++

	call _getNextChannelByte
	ld hl,wChannelPitchShift
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	jp _doNextChannelCommand
++
	call _getNextChannelByte
	jp _doNextChannelCommand

;;
_cmde0Toef:
	and $07
	ld hl,wChannelEnvelopes
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	call _getNextChannelByte
	and $07
	ld hl,wChannelEnvelopes2
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	jp _doNextChannelCommand

;;
_channelCmdf0:
	ld a,(wSoundChannel)
	cp $07
	jr z,_label_39_038

	call _getNextChannelByte
	push af
	and $3f
	jr z,_label_39_037

	pop af
	ld hl,wChannelDutyCycles
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	ld a,$41
	ld hl,wc039
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	jp _doNextChannelCommand
_label_39_037:
	pop af
	and $c0
	ld hl,wChannelDutyCycles
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	ld a,$01
	ld hl,wc039
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	jp _doNextChannelCommand
_label_39_038:
	call _getNextChannelByte
	ld ($ff00+R_NR42),a
	ld a,$00
	ld ($ff00+R_NR41),a
	ld a,$80
	ld ($c01c),a
	jp _doNextChannelCommand

; Command $d0 to $df
_cmdVolume:
	push af
	ld a,(wSoundChannel)
	cp $04
	jr z,@next

	pop af
	and $0f
	ld hl,wChannelVolumes
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	jp _doNextChannelCommand

@next:
	pop af
	jp _doNextChannelCommand

;;
_channelCmdf6:
	ld a,(wSoundChannel)
	cp $04
	jr z,@wave

	cp $05
	jr z,@wave

	call _getNextChannelByte
	and $03
	swap a
	sla a
	sla a
	ld hl,wChannelDutyCycles
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	jp _doNextChannelCommand

@wave:
	call _getNextChannelByte
	ld hl,wChannelDutyCycles
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	ld (wWaveformIndex),a
	call _setWaveform
	jp _doNextChannelCommand

;;
_standardSoundCmd:
	ld a,(wSoundChannel)
	ld hl,@table
	call _readWordFromTable
	jp hl

@table:
	.dw @channel0To3
	.dw @channel0To3
	.dw @channel0To3
	.dw @channel0To3
	.dw _standardCmdChannels4To5
	.dw _standardCmdChannels4To5
	.dw _standardCmdChannel6
	.dw _standardCmdChannel7

@channel0To3:
	ld hl,wc039
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,+

	call _getNextChannelByte
	ld l,a
	ld a,(wSoundCmd)
	ld h,a
	jp @cmdUnknown
+
	ld a,(wSoundCmd)
	cp $60
	jr z,@cmd60

	cp $61
	jr z,@cmd61

	jp @cmdFrequency

@cmd60:
	ld hl,wChannelEnvelopes2
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr nz,@cmd61

	ld a,$02
	ld hl,wc05d
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	call _getChannelVolume
	sla a
	sla a
	sla a
	sla a
	ld c,$01
	or c
	ld (wSoundCmdEnvelope),a
	call _updateChannelVolume
	call _func_39_41f3
@cmd61:
	jp _setChannelWaitCounter

@cmdFrequency:
	ld a,(wSoundCmd)
	sub $0c
	ld hl,_soundFrequencyTable
	call _readWordFromTable
@cmdUnknown:
	call _setSoundFrequency
	ld a,$00
	ld hl,wc05d
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	call _func_39_464c
	ld a,$00
	ld hl,wc045
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	ld a,$00
	ld hl,wChannelVibratos
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	and $f0
	srl a
	srl a
	srl a
	ld hl,wc051
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	call _func_42ea
;;
; Read a byte, set the channel wait counter to the value
_setChannelWaitCounter:
	call _getNextChannelByte
	dec a
	ld hl,wChannelWaitCounters
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	ret

;;
_func_39_4609:
	ld hl,_data_4ad0
	ld a,b
	sla a
	sla a
	sla a
	add c
	ld d,$00
	ld e,a
	add hl,de
	ld a,(hl)
	ret

;;
; Sends wSoundFrequency to given value plus value in table at wChannelPitchShift.
_setSoundFrequency:
	push hl
	ld hl,wChannelPitchShift
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	ld d,a
	sla d
	jr c,+

	ld d,$00
	jr ++
+
	ld d,$ff
++
	ld e,a
	pop hl
	add hl,de
	ld a,(wSoundChannel)
	sla a
	ld b,a
	ld a,l
	ld c,<hSoundData3
	call _writeIndexedHighRamAndIncrement
	ld a,h
	ld ($ff00+c),a
	inc c
	ld a,l
	ld (wSoundFrequencyL),a
	ld a,h
	ld (wSoundFrequencyH),a
	ret

;;
_func_39_464c:
	ld a,(wSoundChannel)
	cp $04
	jr nz,+
	jp _func_39_4766
+
	ld hl,wc05d
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,_label_39_047

	cp $01
	jr z,_label_39_048

	ld a,$00
	ld (wSoundCmdEnvelope),a
	ret
_label_39_047:
	ld hl,wChannelEnvelopes
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,_label_39_049

	ld c,a
	or $18
	ld (wSoundCmdEnvelope),a
	push bc
	call _getChannelVolume
	pop bc
	ld b,a
	call _func_39_4609
	ld hl,wc061
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	ld a,$01
	ld hl,wc05d
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	jp _updateChannelVolume

_label_39_048:
	ld hl,wc061
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,_label_39_049

	ld hl,wc061
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	dec a
	ld (hl),a
	ld a,$00
	ld (wSoundCmdEnvelope),a
	ret

_label_39_049:
	ld hl,wChannelEnvelopes2
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr nz,+

	ld a,$02
	jr ++
+
	ld a,$03
++
	ld hl,wc05d
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	call _getChannelVolume
	sla a
	sla a
	sla a
	sla a
	ld (wSoundCmdEnvelope),a
	ld hl,wChannelEnvelopes2
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	ld c,a
	ld a,(wSoundCmdEnvelope)
	or c
	ld (wSoundCmdEnvelope),a
	jp _updateChannelVolume

;;
_updateChannelVolume:
	ld a,(wSoundChannel)
	cp $02
	jr nc,++

	ld a,(wMusicVolume)
	cp $00
	jr z,@ret

	ld a,(wSoundChannel)
	inc a
	inc a
	ld e,a
	ld hl,wChannelsEnabled
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,++
@ret:
	ret
++
	ld a,(wSoundChannel)
	and $01
	jr nz,+

	; Channel 1 only: sweep off
	ld a,$08
	ld ($ff00+R_NR10),a
+
	; Set channel volume
	ld a,(wSoundChannel)
	and $01
	ld b,a
	sla a
	sla a
	add b
	ld b,a
	ld a,(wSoundCmdEnvelope)
	ld c,R_NR12
	call _writeIndexedHighRamAndIncrement
	ld hl,wc039
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	and $40
	or $80
	ld (wSoundCmdEnvelope),a
	ret

;;
_func_39_4766:
	call _func_39_489e
	ld b,a
	ld a,(wc025+4)
	cp b
	jr z,+

	call _func_39_489e
	ld (wc025+4),a
	call _func_39_434b
	cp $00
	jr nz,+

	ld a,(wc025+4)
	ld ($ff00+R_NR32),a
+
	ret

;;
_getChannelVolume:
	ld a,(wSoundChannel)
	scf
	ccf
	cp $02
	jr nc,_label_39_056
;;
_func_39_478c:
	ld a,(wMusicVolume)
	cp $00
	jr z,_label_39_059
	cp $01
	jr z,_label_39_058
	cp $02
	jr z,_label_39_057
_label_39_056:
	ld hl,wChannelVolumes
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	ret
_label_39_057:
	ld hl,wChannelVolumes
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	srl a
	ret
_label_39_058:
	ld hl,wChannelVolumes
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	srl a
	srl a
	ret
_label_39_059:
	ld a,$00
	ret

_standardCmdChannels4To5:
	ld hl,wc039
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,+

	call _getNextChannelByte
	ld l,a
	ld a,(wSoundCmd)
	ld h,a
	jp @cmdUnknown
+
	ld a,(wSoundCmd)
	scf
	ccf
	cp $60
	jr nz,@freqCommand
@cmd60:
	ld a,$01
	ld hl,wc02d
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	call _func_39_489e
	ld hl,wc025
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	call _func_39_434b
	cp $00
	jr nz,+

	ld hl,wc025
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	ld ($ff00+R_NR32),a
+
	jp _setChannelWaitCounter
@freqCommand:
	ld a,$00
	ld hl,wc02d
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	ld a,(wSoundCmd)
	ld hl,_soundFrequencyTable
	call _readWordFromTable
@cmdUnknown:
	call _setSoundFrequency
	ld a,$00
	ld hl,wc045
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	ld a,$00
	ld hl,wChannelVibratos
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	and $f0
	srl a
	srl a
	srl a
	ld hl,wc051
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	call _func_39_489e
	ld hl,wc025
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
	call _func_39_434b
	cp $00
	jr nz,+

	ld hl,wc025
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	ld ($ff00+R_NR32),a
	ld a,(wSoundFrequencyL)
	ld ($ff00+R_NR33),a
	ld a,(wSoundFrequencyH)
	ld ($ff00+R_NR34),a
+
	jp _setChannelWaitCounter

;;
_func_39_489e:
	ld hl,wc02d
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr nz,_label_39_067
	ld a,(wSoundChannel)
	cp $05
	jr nc,_label_39_064
	ld a,(wMusicVolume)
	cp $00
	jr z,_label_39_067
	cp $01
	jr z,_label_39_066
	cp $02
	jr z,_label_39_065
_label_39_064:
	ld a,$20
	ret
_label_39_065:
	ld a,$40
	ret
_label_39_066:
	ld a,$60
	ret
_label_39_067:
	ld a,$00
	ret

;;
_standardCmdChannel6:
	ld a,(wSoundCmd)
	ld c,a
	ld de,_noiseFrequencyTable
-
	ld a,(de)
	inc de
	cp $ff
	jr z,@end

	cp c
	jr z,+

	inc de
	inc de
	jr -
+
	ld a,(de)
	ld l,a
	inc de
	ld a,(de)
	ld h,a
	ld a,($c074)
	cp $00
	jr nz,@end

	push hl
	call _func_39_478c
	pop hl
	sla a
	sla a
	sla a
	sla a
	or l
	ld ($ff00+R_NR42),a
	ld a,h
	ld ($ff00+R_NR43),a
	ld a,$80
	ld ($ff00+R_NR44),a
@end:
	jp _setChannelWaitCounter

;;
_standardCmdChannel7:
	ld a,(wSoundCmd)
	ld ($ff00+R_NR43),a
	ld a,$00
	ld ($ff00+R_NR41),a
	ld a,($c01c)
	cp $00
	jr z,+
	ld ($ff00+R_NR44),a
+
	ld a,$00
	ld ($c01c),a
	jp _setChannelWaitCounter

_channelCmdff:
	ld a,$00
	ld hl,wChannelsEnabled
	push af
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	pop af
	ld (hl),a
;;
; Checks whether to call _updateChannelVolume on square channels, does some other things
; with the other types of channels...
;
_updateChannelStuff:
	ld a,(wSoundChannel)
	ld hl,@table
	call _readWordFromTable
	jp hl

@table:
	.dw @musicSquareChannel
	.dw @musicSquareChannel
	.dw @sfxSquareChannel
	.dw @sfxSquareChannel
	.dw @musicWaveChannel
	.dw @sfxWaveChannel
	.dw @noiseChannel
	.dw @noiseChannel

@musicSquareChannel:
	; Only update if the corresponding sfx channel is not enabled
	ld a,(wSoundChannel)
	inc a
	inc a
	ld e,a
	ld hl,wChannelsEnabled
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,+
	ret

@sfxSquareChannel:
	; Sfx always updates (but it still does this pointless check of the corresponding
	; music channel)
	ld a,(wSoundChannel)
	dec a
	dec a
	ld e,a
	ld hl,wChannelsEnabled
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $00
	jr z,+
+
	ld hl,wc05d
	ld a,(wSoundChannel)
	ld e,a
	ld d,$00
	add hl,de
	ld a,(hl)
	cp $03
	jr nz,+
	ret
+
	ld a,$08
	ld (wSoundCmdEnvelope),a
	call _updateChannelVolume
	jp _func_42ea

@musicWaveChannel:
	call _func_39_434b
	cp $00
	jr nz,+

	ld a,$00
	ld ($ff00+R_NR30),a
+
	ret

@sfxWaveChannel:
	ld a,(wChannelsEnabled+4)
	cp $00
	jr z,++

	ld a,$04
	ld e,a
	ld hl,wChannelDutyCycles
	ld d,$00
	add hl,de
	ld a,(hl)
	ld (wWaveformIndex),a
	call _setWaveform
	ld a,(wc025+4)
	ld ($ff00+R_NR32),a
	ret
++
	ld a,$00
	ld ($ff00+R_NR30),a
	ret

@noiseChannel:
	ld a,$08
	ld ($ff00+R_NR42),a
	ld a,$80
	ld ($ff00+R_NR44),a
	ret

;;
_setWaveform:
	call _func_39_434b
	cp $00
	jr z,@waitLoop
	ret

@waitLoop:
	; Wait for channel 3 to be on
	ld a,$00
	ld ($ff00+R_NR30),a
	ld a,($ff00+R_NR52)
	and $04
	jr nz,@waitLoop

	; Copy waveform to $ff30
	ld a,(wWaveformIndex)
	ld hl,_waveformTable
	call _readWordFromTable
	ld c,$10
	ld de,$ff30
-
	ldi a,(hl)
	ld (de),a
	inc de
	dec c
	jr nz,-

-	; Enable channel 3
	ld a,$80
	ld ($ff00+R_NR30),a
	ld a,($ff00+R_NR30)
	and $80
	jr z,-

	; Restart channel 3 (but trashes lower frequency bits?)
	ld a,$80
	ld ($ff00+R_NR34),a
	ret

_channelCmdfe:
	call _getNextChannelByte
	ld l,a
	call _getNextChannelByte
	ld h,a
	ld a,(wSoundChannel)
	sla a
	ld b,a
	ld a,l
	ld c,<hSoundChannelAddresses
	call _writeIndexedHighRamAndIncrement
	ld a,h
	ld ($ff00+c),a
	inc c
	jp _doNextChannelCommand

;;
_func_39_4a10:
	cp $00
	jr nz,+
	ld hl,$0000
	ret
+
	ld e,l
	ld d,h
--
	dec a
	jr z,+

	add hl,de
	jp --
+
	ret

_soundFrequencyTable:
	.dw $002d
	.dw $009d
	.dw $0108
	.dw $016c
	.dw $01cb
	.dw $0224
	.dw $0279
	.dw $02c8
	.dw $0313
	.dw $0358
	.dw $039b
	.dw $03db
	.dw $0416
	.dw $044f
	.dw $0484
	.dw $04b6
	.dw $04e5
	.dw $0512
	.dw $053c
	.dw $0564
	.dw $058a
	.dw $05ac
	.dw $05ce
	.dw $05ed
	.dw $060b
	.dw $0627
	.dw $0642
	.dw $065b
	.dw $0673
	.dw $0689
	.dw $069e
	.dw $06b2
	.dw $06c5
	.dw $06d6
	.dw $06e7
	.dw $06f7
	.dw $0706
	.dw $0714
	.dw $0721
	.dw $072e
	.dw $0739
	.dw $0745
	.dw $074f
	.dw $0759
	.dw $0762
	.dw $076b
	.dw $0773
	.dw $077b
	.dw $0783
	.dw $078a
	.dw $0790
	.dw $0797
	.dw $079d
	.dw $07a2
	.dw $07a8
	.dw $07ad
	.dw $07b1
	.dw $07b6
	.dw $07ba
	.dw $07be
	.dw $07c1
	.dw $07c5
	.dw $07c8
	.dw $07cb
	.dw $07ce
	.dw $07d1
	.dw $07d4
	.dw $07d6
	.dw $07d9
	.dw $07db
	.dw $07dd
	.dw $07df
	.dw $07e1
	.dw $07e2
	.dw $07e4
	.dw $07e6
	.dw $07e7
	.dw $07e9
	.dw $07ea
	.dw $07eb
	.dw $07ec
	.dw $07ed
	.dw $07ee
	.dw $07ef
	.dw $07f0
	.dw $07f1
	.dw $07f2

_data_4ad0:
	.db $00 $01 $02 $03 $04 $05 $06 $07
	.db $00 $02 $04 $06 $07 $09 $0b $0d
	.db $00 $03 $06 $08 $0b $0e $11 $14
	.db $00 $04 $07 $0b $0f $13 $16 $1a
	.db $00 $05 $09 $0e $13 $17 $1c $21
	.db $00 $06 $0b $11 $16 $1c $22 $27
	.db $00 $07 $0d $14 $1a $21 $27 $2e
	.db $00 $07 $0f $16 $1e $25 $2d $34
	.db $00 $08 $11 $19 $22 $2a $32 $3b
	.db $00 $09 $13 $1c $25 $2f $38 $41
	.db $00 $0a $15 $1f $29 $33 $3e $48
	.db $00 $0b $16 $22 $2d $38 $43 $4e
	.db $00 $0c $18 $24 $31 $3d $49 $55
	.db $00 $0d $1a $27 $34 $41 $4e $5b
_data_4b40:
	.db $00 $00 $01 $00 $02 $00 $01 $00
	.db $00 $00 $ff $ff $fe $ff $ff $ff

;;
; @param a The sound to play.
_playSound:
	push bc
	push de
	push hl
	ld (wSoundTmp),a
	cp $00
	jr nz,+
	jp @playSoundEnd
+
	cp $f0
	jr z,@sndf0
	cp $f1
	jr z,@sndf1
	cp $f5
	jr z,@sndf5
	cp $f6
	jr z,@sndf6
	cp $f7
	jr z,@sndf7
	cp $f8
	jr z,@sndf8
	cp $f9
	jr z,@sndf9
	cp $fa
	jr z,@sndfa
	cp $fb
	jr z,@sndfb
	cp $fc
	jr z,@sndfc
	jr @normalSound

; Stop music
@sndf0:
	ld a,SNDCTRL_DE
	ld (wSoundTmp),a
	jr @normalSound

; Stop sound effects
@sndf1:
	call _stopSfx
	jp @playSoundEnd

; Disable sound
@sndf5:
	call _func_39_40b9
	ld a,$01
	ld (wSoundDisabled),a
	jp @setVolumeAndEnd

; Enable sound
@sndf6:
	ld a,$00
	ld (wSoundDisabled),a
	jp @setVolumeAndEnd

; Fast fadeout
@sndfa:
	ld a,$07
	jr +

; Medium fadeout
@sndfb:
	ld a,$0f
	jr +

; Slow fadeout
@sndfc:
	ld a,$1f
+
	ld (wSoundFadeSpeed),a
	ld a,$00
	ld (wSoundFadeCounter),a
	ld a,$01
	ld (wSoundFadeDirection),a
	ld a,$77
	ld (wSoundVolume),a
	jp @playSoundEnd

; Fast fadein
@sndf7:
	ld a,$03
	jr +

; Medium fadein
@sndf8:
	ld a,$07
	jr +

; Slow fadein
@sndf9:
	ld a,$0f
+
	ld (wSoundFadeSpeed),a
	ld a,$00
	ld (wSoundFadeCounter),a
	ld a,$0a
	ld (wSoundFadeDirection),a
	ld a,$00
	ld (wSoundVolume),a
	jp @playSoundEnd

@normalSound:
	ld a,$00
	ld (wSoundFadeDirection),a
	ld a,(wSoundTmp)

	; Get a*3 in de
	ld d,$00
	ld e,a
	ld h,$00
	ld l,a
	sla l
	rl h
	add hl,de
	ld d,h
	ld e,l

	ld hl,_soundPointers
	add hl,de
	ld a,(hl)
	and $80
	jr z,+

	; What were the programmers on? Clearly this part of the code is unused
	call _noiseFrequencyTable

	jp @setVolumeAndEnd

+
	ldi a,(hl)
	ld c,a
	ldh a,(<hSoundDataBaseBank)
	add c
	ld (wLoadingSoundBank),a
	ldi a,(hl)
	ld c,a
	ld a,(hl)
	ld b,a
	ld l,c
	ld h,b

@nextSoundChannel:
	ldh a,(<hSoundDataBaseBank)
	call wMusicReadFunction
	cp $ff
	jr nz,+
	jp @setVolumeAndEnd
+
	ld (wSoundTmp),a
	and $f0
	swap a
	inc a
	ld (wSoundChannelValue),a
	ld a,(wSoundTmp)
	and $0f
	ld (wSoundTmp),a
	ld e,a
	push hl
	ld hl,wChannelsEnabled
	ld d,$00
	add hl,de
	ld a,(hl)
	pop hl
	ld c,a
	ld a,(wSoundChannelValue)
	cp c
	jr nc,+

	inc hl
	inc hl
	jp @nextSoundChannel
+
	push hl
	ld a,(wSoundTmp)
	ld e,a
	ld a,(wSoundChannelValue)
	ld hl,wChannelsEnabled
	ld d,$00
	add hl,de
	ld (hl),a
	ld a,$08
	ld hl,wChannelVolumes
	ld d,$00
	add hl,de
	ld (hl),a
	ld a,$00
	ld hl,wChannelWaitCounters
	ld d,$00
	add hl,de
	ld (hl),a
	ld a,(wSoundTmp)
	cp $00
	jr z,@squareChannel
	cp $01
	jr z,@squareChannel
	cp $02
	jr z,@squareChannel
	cp $03
	jr z,@squareChannel
	cp $04
	jr z,@waveChannel
	cp $05
	jr z,@waveChannel

	; Noise channels
	jr ++

@waveChannel:
	ld a,(wSoundTmp)
	ld e,a
	ld a,$00
	ld hl,wChannelVibratos
	ld d,$00
	add hl,de
	ld (hl),a
	ld hl,wc03f
	ld d,$00
	add hl,de
	ld (hl),a
	ld hl,wChannelPitchShift
	ld d,$00
	add hl,de
	ld (hl),a
	ld hl,wc039
	ld d,$00
	add hl,de
	ld (hl),a
	jr ++

@squareChannel:
	ld a,(wSoundTmp)
	ld e,a

	; Clear a bunch of variables
	ld a,$00
	ld hl,wChannelEnvelopes
	ld d,$00
	add hl,de
	ld (hl),a
	ld hl,wChannelEnvelopes2
	ld d,$00
	add hl,de
	ld (hl),a
	ld hl,wChannelDutyCycles
	ld d,$00
	add hl,de
	ld (hl),a
	ld hl,wChannelVibratos
	ld d,$00
	add hl,de
	ld (hl),a
	ld hl,wc03f
	ld d,$00
	add hl,de
	ld (hl),a
	ld hl,wChannelPitchShift
	ld d,$00
	add hl,de
	ld (hl),a
	ld hl,wc039
	ld d,$00
	add hl,de
	ld (hl),a
++
	; Write the bank for this sound channel into hSoundChannelBanks
	pop hl
	ld a,(wSoundTmp)
	ld b,a
	ld a,(wLoadingSoundBank)
	ld c,<hSoundChannelBanks
	call _writeIndexedHighRamAndIncrement

	; Write the address for this sound channel into hSoundChannelAddresses
	ld a,(wSoundTmp)
	sla a
	ld b,a
	push bc
	ldh a,(<hSoundDataBaseBank)
	call wMusicReadFunction
	pop bc
	ld c,<hSoundChannelAddresses
	call _writeIndexedHighRamAndIncrement
	push bc
	ldh a,(<hSoundDataBaseBank)
	call wMusicReadFunction
	pop bc
	ld ($ff00+c),a
	inc c
	jp @nextSoundChannel

@setVolumeAndEnd:
	ld a,$77
	ld (wSoundVolume),a
@playSoundEnd:
	pop hl
	pop de
	pop bc
	ret

;;
; Reads a word at hl+a*2 into de and hl. Index can't be higher than $7f.
_readWordFromTable:
	sla a
	ld d,$00
	ld e,a
	add hl,de
	ld e,(hl)
	inc hl
	ld d,(hl)
	ld h,d
	ld l,e
	ret

;;
; Adds b to c, writes a to ($ff00+c), increments c.
_writeIndexedHighRamAndIncrement:
	push af
	ld a,b
	add c
	ld c,a
	pop af
	ld ($ff00+c),a
	inc c
	ret

	push af
	ld a,(wSoundChannel)
	ld b,a
	ld a,b
	add c
	ld c,a
	pop af
	ld ($ff00+c),a
	ret

_noiseFrequencyTable:
	.db $24 $01 $47
	.db $22 $00 $47
	.db $23 $02 $46
	.db $26 $02 $26
	.db $28 $00 $35
	.db $27 $02 $14
	.db $2a $01 $14
	.db $2e $06 $07
	.db $52 $03 $17
	.db $32 $02 $37
	.db $2f $02 $45
	.db $29 $02 $47
	.db $30 $00 $07
	.db $ff

_waveformTable:
	.dw @waveform00
	.dw @waveform01
	.dw @waveform02
	.dw @waveform03
	.dw @waveform04
	.dw @waveform05
	.dw @waveform06
	.dw @waveform07
	.dw @waveform08
	.dw @waveform09
	.dw @waveform0a
	.dw @waveform0b
	.dw @waveform0c
	.dw @waveform0d
	.dw @waveform0e
	.dw @waveform0f
	.dw @waveform10
	.dw @waveform11
	.dw @waveform12
	.dw @waveform13
	.dw @waveform14
	.dw @waveform15
	.dw @waveform16
	.dw @waveform17
	.dw @waveform18
	.dw @waveform19
	.dw @waveform1a
	.dw @waveform1b
	.dw @waveform1c
	.dw @waveform1d
	.dw @waveform1e
	.dw @waveform1f
	.dw @waveform20
	.dw @waveform21
	.dw @waveform22
	.dw @waveform23
	.dw @waveform24
	.dw @waveform25
	.dw @waveform26
	.dw @waveform27
	.dw @waveform28
	.dw @waveform29
	.dw @waveform2a
	.dw @waveform2b
	.dw @waveform2c
	.dw @waveform2d

@waveformUnused0:
	.db $00 $00 $00 $00 $66 $77 $88 $88 $88 $88 $88 $88 $88 $77 $66 $55

@waveform04:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $88 $99 $aa $aa $aa $aa $99 $88

@waveform0e:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $88 $88 $88 $88 $88 $88 $88 $88

@waveform28:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $44 $55 $66 $66 $66 $66 $55 $44

@waveform06:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $33 $44 $55 $55 $55 $55 $44 $33

@waveform07:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $44 $55 $66 $66 $66 $66 $55 $44

@waveform26:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $11 $22 $33 $33 $22 $11 $00

@waveform09:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $00 $33 $33 $55 $55 $33 $33 $00

@waveform16:
	.db $01 $23 $45 $67 $89 $ab $cd $ef $ed $cb $a9 $87 $65 $43 $21 $00

@waveform20:
	.db $00 $01 $23 $45 $67 $89 $ab $cd $cb $a9 $87 $65 $43 $21 $00 $00

@waveformUnused1:
	.db $00 $00 $00 $00 $88 $88 $88 $88 $88 $88 $88 $88 $88 $88 $88 $88

@waveform0a:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $cc $cc $cc $cc $cc $cc $cc $cc

@waveform1e:
	.db $ff $ee $dd $cc $bb $aa $99 $88 $77 $66 $55 $44 $33 $22 $11 $00

@waveform21:
	.db $00 $00 $00 $00 $77 $77 $77 $77 $77 $77 $77 $77 $ff $ff $ff $ff

@waveformUnused2:
	.db $ff $ee $cc $bb $99 $88 $66 $55 $cc $aa $99 $77 $66 $44 $22 $00

@waveform23:
	.db $77 $77 $66 $66 $55 $55 $44 $44 $cc $bb $ba $aa $a9 $99 $88 $88

@waveformUnused3:
	.db $88 $aa $cc $ee $ff $ee $dd $cc $bb $aa $99 $88 $66 $44 $22 $00

@waveform22:
	.db $6c $6c $6c $6c $6b $6a $69 $68 $77 $66 $55 $44 $33 $22 $11 $00

@waveform1f:
	.db $11 $ff $33 $dd $55 $bb $77 $99 $88 $88 $77 $99 $55 $bb $33 $dd

@waveform24:
	.db $80 $ae $db $f6 $ff $f6 $db $ae $80 $4f $25 $0a $00 $0a $25 $4f

@waveformUnused4:
	.db $ff $f6 $db $ae $80 $4f $25 $0a $00 $0a $25 $4f $80 $ae $db $f6

@waveform25:
	.db $c0 $d2 $db $d2 $c0 $a3 $80 $5c $40 $2d $25 $2d $40 $5c $80 $a3

@waveformUnused5:
	.db $c0 $db $c0 $80 $40 $25 $40 $80 $c0 $db $c0 $80 $40 $25 $40 $80

@waveform1a:
	.db $80 $db $ff $db $80 $25 $00 $25 $80 $db $ff $db $80 $25 $00 $25

@waveform1b:
	.db $40 $6e $80 $6e $40 $13 $00 $13 $40 $6e $80 $6e $40 $13 $00 $13

@waveformUnused6:
	.db $20 $37 $40 $37 $20 $0a $00 $0a $20 $37 $40 $37 $20 $0a $00 $0a

@waveform27:
	.db $00 $00 $00 $00 $99 $bb $dd $ee $ff $ff $ee $dd $bb $99 $00 $00

@waveform01:
	.db $00 $00 $00 $88 $88 $88 $88 $88 $88 $88 $88 $88 $88 $88 $88 $88

@waveform02:
	.db $00 $00 $00 $00 $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff $ff

@waveform1c:
	.db $ff $bb $00 $bb $bb $bb $bb $bb $bb $bb $bb $bb $bb $bb $bb $bb

@waveform1d:
	.db $77 $66 $55 $44 $33 $22 $11 $00 $77 $66 $55 $44 $33 $22 $11 $00

@waveform14:
	.db $30 $00 $00 $00 $00 $00 $00 $00 $03 $34 $45 $55 $55 $55 $54 $43

@waveform13:
	.db $00 $00 $00 $07 $77 $77 $77 $77 $77 $77 $77 $77 $77 $77 $77 $77

@waveform15:
	.db $50 $00 $00 $00 $00 $00 $00 $00 $05 $46 $67 $77 $77 $77 $76 $65

@waveform12:
	.db $00 $00 $00 $09 $99 $99 $99 $99 $99 $99 $99 $99 $99 $99 $99 $99

@waveformUnused7:
	.db $01 $23 $45 $67 $89 $ab $cd $ef $fe $dc $ba $98 $76 $54 $32 $10

@waveform0c:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $11 $11 $11 $11 $11 $11 $11 $11

@waveform0d:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $33 $33 $33 $33 $33 $33 $33 $33

@waveform0f:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $33 $33 $33 $33 $33 $33 $33 $33

@waveform10:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $77 $77 $77 $77 $77 $77 $77 $77

@waveform11:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $88 $88 $88 $88 $88 $88 $88 $88

@waveform17:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $55 $55 $55 $55 $55 $55 $55 $55

@waveform18:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $99 $99 $99 $99 $99 $99 $99 $99

@waveform19:
	.db $00 $00 $00 $00 $00 $00 $77 $77 $77 $77 $77 $77 $77 $77 $77 $77

@waveform08:
	.db $00 $00 $11 $12 $22 $33 $34 $44 $44 $43 $33 $22 $21 $11 $00 $00

@waveform00:
	.db $11 $22 $33 $44 $55 $66 $78 $9a $a9 $88 $77 $66 $55 $44 $33 $22

@waveform05:
	.db $11 $22 $33 $44 $55 $66 $78 $9a $a9 $88 $77 $66 $55 $44 $33 $22

@waveform03:
	.db $11 $33 $55 $77 $99 $bb $dd $ff $ff $dd $bb $99 $77 $55 $33 $11

@waveform0b:
	.db $00 $0d $dd $dd $dd $dd $dd $dd $dd $dd $dd $dd $dd $dd $dd $dd

@waveform2b:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $44 $44 $44 $44 $44 $44 $44 $44

@waveform2c:
	.db $00 $00 $00 $00 $00 $00 $00 $00 $22 $22 $22 $22 $22 $22 $22 $22

@waveform29:
	.db $00 $00 $00 $00 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22 $22

@waveform2a:
	.db $00 $00 $00 $00 $33 $33 $33 $33 $33 $33 $33 $33 $33 $33 $33 $33

@waveform2d:
	.db $9b $df $ff $fe $dc $ba $98 $76 $21 $00 $01 $23 $22 $22 $23 $23




.ifdef ROM_AGES
	.include "audio/ages/soundChannelPointers.s"
	.include "audio/ages/soundPointers.s"

	.ifdef BUILD_VANILLA
	.ORGA $59ff
	.endif

	.include "audio/ages/soundChannelData.s"

	.ifdef BUILD_VANILLA
		.db $ff $ff $ff
	.endif

.else; ROM_SEASONS
	.include "audio/seasons/soundChannelPointers.s"
	.include "audio/seasons/soundPointers.s"

	.ifdef BUILD_VANILLA
	.ORGA $5a86
	.endif

	.include "audio/seasons/soundChannelData.s"

	.ifdef BUILD_VANILLA
		.dsb 10 $ff
	.endif
.endif
