; ==================================================================================================
; INTERAC_ROSA
; ==================================================================================================
interactionCode68:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @subid00
	.dw @subid01

@subid00:
	call checkInteractionState
	jr nz,@@state1

@@state0:
	ld a,$00
	or a
	jp z,interactionDelete
	call @initGraphicsAndLoadScript
	call objectSetVisiblec2
	ld hl,mainScripts.rosa_subid00Script_alreadyGaveShovel
	jp interactionSetScript

@@state1:
	call interactionRunScript
	jp npcFaceLinkAndAnimate
	jp interactionAnimateAsNpc


@subid01:
	call checkInteractionState
	jr nz,@@state1

@@state0:
	call @loadScriptFromTableAndInitGraphics
	ld l,Interaction.var37
	ld (hl),$04
	call interactionRunScript
@@state1:
	call interactionRunScript
	jp c,interactionDelete
	jp npcFaceLinkAndAnimate


; Unused
@initGraphicsAndIncState:
	call interactionInitGraphics
	call objectMarkSolidPosition
	jp interactionIncState

@initGraphicsAndLoadScript:
	call interactionInitGraphics
	call objectMarkSolidPosition
	jr @loadScriptAndIncState


@loadScriptFromTableAndInitGraphics:
	call interactionInitGraphics
	call objectMarkSolidPosition
	jr @loadScriptFromTableAndIncState

@loadScriptAndIncState:
	call @getScript
	call interactionSetScript
	jp interactionIncState

@loadScriptFromTableAndIncState:
	call @getScript
	inc e
	ld a,(de)
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	call interactionSetScript
	jp interactionIncState

@getScript:
	ld a,>TX_1c00
	call interactionSetHighTextIndex
	ld e,Interaction.subid
	ld a,(de)
	ld hl,@scriptTable
	rst_addDoubleIndex
	ldi a,(hl)
	ld h,(hl)
	ld l,a
	ret

@scriptTable:
	.dw mainScripts.rosa_subid00Script
	.dw @scriptTable2

@scriptTable2:
	.dw mainScripts.rosa_subid01Script
