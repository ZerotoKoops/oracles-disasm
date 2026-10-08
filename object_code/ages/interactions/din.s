; ==================================================================================================
; INTERAC_DIN
; ==================================================================================================
interactionCodeaa:
	ld e,Interaction.subid
	ld a,(de)
	sub $0a
	jr c,@generic
	rst_jumpTable
	.dw @subid0a
	;.dw @subid0b

@generic:
	call checkInteractionState
	jr z,@@state0

@@state1:
	call interactionRunScript
	ld e,Interaction.subid
	ld a,(de)
	cpa $09 ; endgame Din
	jp nz,npcFaceLinkAndAnimate
	jp interactionAnimateAsNpc

@@state0:
	call interactionIncState

	call interactionInitGraphics
	ld a,$06
	call objectSetCollideRadius
	call objectMarkSolidPosition
	call objectSetVisiblec2

	ld e,Interaction.subid
	ld a,(de)
	cp 9
	jr z,+
	ld a,INTERAC_DIN
	ld (wInteractionIDToLoadExtraGfx),a
+

; Whether to delete
	callab agesInteractionsBank09.getGameProgress_Seasons
	;ld a,(wGameProgress2)
	;ld b,a

	ld hl,@@dinSubidAppearances
	ld a,b ; game progress in b
	rst_addAToHl
	ld e,Interaction.subid
	ld a,(de)
	cp (hl)
	jp nz,interactionDelete

; Text
	ld hl,@@dinTextIndices
	ld e,Interaction.subid
	ld a,(de)
	rst_addAToHl
	ld a,(hl)
	ld e,Interaction.textID
	ld (de),a
	inc e ; Interaction.textID+1
	ld a,>TX_1c00
	ld (de),a

; TODO: set animation/graphics?

; Scripts
	ld hl,@dinScripts
	ld a,b ; game progress in b
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	call interactionSetScript

	ld e,Interaction.subid
	ld a,(de)
	cp $09
	jr nz,+
	ld a,$04
	call interactionSetAnimation
+
	jp @@state1

@@dinSubidAppearances:
	.db $00 $01 $02 $03
	.db $04 $05 $06 $07
	.db $08 $09

@@dinTextIndices:
	.db <TX_1c00 ; $00 Before sword - ROOM_AGES_5b1
	.db <TX_1c01 ; $01 After sword - ROOM_AGES_5b1
	.db <TX_1c02 ; $02 After bombs - ROOM_AGES_023
	.db <TX_1c03 ; $03 After boomerang - ROOM_AGES_013
	.db <TX_1c04 ; $04 Afrer Rod - ROOM_AGES_5b1
	.db <TX_1c05 ; $05 After flippers - ROOM_AGES_5c4
	.db <TX_1c06 ; $06 After feather - ROOM_AGES_5cb
	.db <TX_1c07 ; $07 After gift - ROOM_AGES_003
	.db <TX_1c10 ; $08 After both gifts - ROOM_AGES_003
	.db <TX_1c08 ; $08 After game win

@dinScripts:
	.dw mainScripts.dinScript_generic ; $00
	.dw mainScripts.dinScript_generic ; $01
	.dw mainScripts.dinScript_generic ; $02
	.dw mainScripts.dinScript_generic ; $03
	.dw mainScripts.dinScript_generic ; $04
	.dw mainScripts.dinScript_generic ; $05
	.dw mainScripts.dinScript_generic ; $06
	.dw mainScripts.dinScript_generic ; $07
	.dw mainScripts.dinScript_generic ; $08
	.dw mainScripts.dinScript_endgame ; $09

@subid0a:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @@state0 ; $00 initialize
	.dw dinAnimateAndRunScript ; $01 spawn Nayru
	.dw @@state2 ; $02 get Nayru's vars
	.dw checkRelatedObjState ; $03 wait for Nayru to walk up
	.dw dinAnimateAndRunScript ; $04 turn to Nayru, and turn back to Link
	.dw checkRelatedObjState ; $05
	.dw dinAnimateAndRunScript ; $06

;spawned Nayru, now find her
@@state2:
	call objectGetAngleTowardLink
	call convertAngleToDirection
	ld e,Interaction.var3f
	ld (de),a

	ld bc,$d041
-
	ld a,(bc)
	cp INTERAC_NAYRU
	jr z,@@@foundNayru
	inc b
	ld a,$e0
	cp b
	jr nz,-
	jp dinAnimateAndRunScript

@@@foundNayru:
	ld e,Interaction.relatedObj1+1
	ld a,b
	ld (de),a
	dec e ; Interaction.relatedObj1
	ld a,Interaction.start
	ld (de),a
; saves Din in Nayru's vars
	ld c,e ; Interaction.relatedObj1
	ld (bc),a
	inc c ; Interaction.relatedObj1+1
	ld a,d
	ld (bc),a

	jp interactionIncState

;initialization
@@state0:
	ld a,(wEssencesObtained)
	cpa $02
	jp nz,interactionDelete

	call interactionIncState

	call interactionInitGraphics
	ld a,$06
	call objectSetCollideRadius
	call objectMarkSolidPosition
	call objectSetVisiblec2

	ld a,>TX_1c00
	call interactionSetHighTextIndex

	ld a,INTERAC_DIN
	ld (wInteractionIDToLoadExtraGfx),a

	ld hl,mainScripts.dinScript_zeldaKidnapped
	call interactionSetScript

dinAnimateAndRunScript:
	call interactionAnimateBasedOnSpeed
	call interactionPushLinkAwayAndUpdateDrawPriority
	jp interactionRunScript

; check Nayru's state
checkRelatedObjState:
	ld a,Object.state
	call objectGetRelatedObject1Var

	ld e,Interaction.substate
	ld a,(de)
	cpa $00
	jr z,@substate0

	ld e,Interaction.var2f
	ld a,(de)
	cp (hl)
	jp z,dinAnimateAndRunScript

	call interactionIncState
	inc l ; Interaction.substate
	ld (hl),$00
	ret

@substate0:
	ld a,$01
	ld (de),a

	ld e,Interaction.var2f
	ld a,(hl)
	ld (de),a
	ret



/*
interactionCodeaa:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1

@state0:
	ld a,$01
	ld (de),a ; [state]
	call interactionInitGraphics
	call objectSetVisible82
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @initSubid0
	.dw @initSubid1
	.dw @initSubid2

@initSubid0:
@initSubid1:
	ret

@initSubid2:
	call interactionSetAlwaysUpdateBit
	ld bc,$4830
	jp interactionSetPosition


@state1:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @runSubid0
	.dw interactionAnimate
	.dw interactionAnimate

@runSubid0:
	call @runSubid0Substates
	ld e,Interaction.zh
	ld a,(de)
	or a
	jp nz,objectSetVisiblec2
	jp objectSetVisible82

@runSubid0Substates:
	ld e,Interaction.substate
	ld a,(de)
	rst_jumpTable
	.dw @substate0
	.dw @substate1
	.dw @substate2
	.dw @substate3
	.dw interactionAnimate

@substate0:
	call interactionAnimate
	ld a,(wTmpcfc0.genericCutscene.state)
	cp $04
	ret nz
	call interactionIncSubstate
	ld l,Interaction.counter1
	ld (hl),120
	ld a,$05
	call interactionSetAnimation
	jp @beginJump

@substate1:
	call interactionDecCounter1
	jp nz,@updateSpeedZ
	call interactionIncSubstate
	xor a
	ld l,Interaction.zh
	ld (hl),a
	ld l,Interaction.counter1
	ld (hl),30
	jp interactionAnimate

@substate2:
	call interactionDecCounter1
	jr nz,++
	call interactionIncSubstate
	ld l,Interaction.counter1
	ld (hl),60
	ld bc,TX_3d09
	call showText
++
	jp interactionAnimate

@substate3:
	call interactionDecCounter1IfTextNotActive
	jr nz,++
	call interactionIncSubstate
	ld hl,wTmpcfc0.genericCutscene.state
	ld (hl),$05
++
	jp interactionAnimate


; Scripts unused?
@loadScript:
	ld e,Interaction.subid
	ld a,(de)
	ld hl,@scriptTable
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	jp interactionSetScript

@scriptTable:
	.dw mainScripts.dinScript


@updateSpeedZ:
	ld c,$20
	call objectUpdateSpeedZ_paramC
	ret nz
	ld h,d

@beginJump:
	ld bc,-$100
	jp objectSetSpeedZ
*/
