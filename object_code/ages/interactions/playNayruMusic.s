; ==================================================================================================
; INTERAC_PLAY_NAYRU_MUSIC
; ==================================================================================================
interactionCode2f:
	ld e,Interaction.subid
	ld a,(de)
	cpa $00
	jr nz,@subid01

@subid00:
	;ld a,GLOBALFLAG_INTRO_DONE
	;call checkGlobalFlag
	;jp nz,interactionDelete
	ld hl,wActiveMusic
	ld a,MUS_SANCTUARY;NAYRU
	cp (hl)
	jr z,+

	ld (hl),a
	call playSound
+
	ld b,$02
-
	ldh a,(<hMusicVolume)
	cp b
	jp z,interactionDelete

	ld a,b
	call setMusicVolume
	jp interactionDelete

@subid01:
	ld b,$03
	jr -

