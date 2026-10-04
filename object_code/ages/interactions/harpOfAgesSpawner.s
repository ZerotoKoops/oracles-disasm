; ==================================================================================================
; INTERAC_HARP_OF_AGES_SPAWNER
; ==================================================================================================
interactionCodeb3:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1

@state0:
	call getThisRoomFlags
	bit ROOMFLAG_BIT_ITEM,(hl)
	jp nz,interactionDelete ; Already got harp

	xor a
	ld (wTmpcfc0.genericCutscene.state),a

	call staticItemsReplacementsLookup
	call createTreasure

	ld l,Interaction.yh
	ld (hl),$38
	ld l,Interaction.xh
	ld (hl),$58
	ld b,h

	; Spawn a sparkle object attached to the harp of ages object we just spawned
	call getFreeInteractionSlot
	jr nz,@incState
	ld (hl),INTERAC_SPARKLE
	inc l
	ld (hl),$0c ; [subid]
	ld l,Interaction.relatedObj1
	ld a,Interaction.start
	ldi (hl),a
	ld (hl),b

@incState:
	call interactionSetAlwaysUpdateBit
	jp interactionIncState


@state1:
	jp interactionDelete
