; In common folder because Ages has a stub

;;
; ITEM_EMPTY_BOTTLE
itemCode10:
	ld e,Item.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1

@state0:
.ifdef ROM_AGES
	ld a,UNCMP_GFXH_AGES_EMPTY_BOTTLE
.else
	ld a,UNCMP_GFXH_SEASONS_1f
.endif
	call loadWeaponGfx
	call loadAttributesAndGraphicsAndIncState
	xor a
	call itemSetAnimation
	jp objectSetVisible82

@state1:
	ret