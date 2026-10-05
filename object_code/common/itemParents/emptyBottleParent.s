;; ITEM_EMPTY_BOTTLE
; var3a: wEmptyBottleItem at initialization
parentItemCode_emptyBottle:
	ld e,Item.state
	ld a,(de)
	rst_jumpTable
	.dw emptyBottle_state0
	.dw emptyBottle_state1
	.dw emptyBottle_state2

emptyBottle_state0:
	lda $01
	ld (de),a

	; Don't allow any other items to be used
	ld e,Item.enabled
	ld a,$ff
	ld (de),a

	ld e,Item.var3a
	ld a,(wEmptyBottleItem)
	ld (de),a

emptyBottle_state1:
	ld e,Item.var3a
	ld a,(de)
	rst_jumpTable
	.dw @empty
	.dw @fairy
	.dw @water

@empty:
	call updateLinkDirectionFromAngle
; sets state exactly to $01 so no good here
	call parentItemLoadAnimationAndIncState
	call itemCreateChild
	jp itemIncState

@water:
	ld a,(wActiveTileType)
	cpa TILETYPE_NORMAL
	jr nz,@@cantEmpty

; check collision of the tile in fron of Link
/*
	ld a,(w1Link.direction)
	ld hl,@@offsetData
	rst_addAToHl
	ld a,(wActiveTilePos)
	add (hl)
*/
	push de
	ld d,>w1Link.start
	callab bank6.specialObjectGetTileInFront
	pop de
	ld a,(bc)
; bc == wRoomLayout + offset
; a == tile index
	cpa TILEINDEX_SOFT_SOIL_PLANTED
	jr z,@@onSoftSoil

	ld h,>wRoomCollisions
	ld l,c
	ld a,(hl)
	cpa $00
	jr nz,@@cantEmpty

	ld a,(wEmptyBottleItem)
	ld e,a
	ld hl,@@dropTiles
	call lookupKey
	jr nc,@@cantEmpty
; c == wRoomLayout + offset
; a == replacing tile
	
	call setTile
	jr emptyBottle_emptyBottle

@@onSoftSoil:
	ld bc,TX_09_SOFTSOIL
	call showText
	lda 80
	call addToGashaMaturity
	jr emptyBottle_emptyBottle


@@dropTiles:
	.db BOTTLE_WATER, TILEINDEX_PUDDLE
	.db $00

@@cantEmpty:
	ld bc,TX_09_CANTEMPTY
	call showText
	jp clearParentItem

@fairy:
	ld c,$18

	lda BLUE_JOY_RING
	call cpActiveRing
	jr z,@@doubleHearts

	lda GOLD_JOY_RING
	call cpActiveRing
	jr nz,@@giveHearts

@@doubleHearts:
	ld c,$30
@@giveHearts:
	lda TREASURE_HEART_REFILL
	call giveTreasure
; fall through

emptyBottle_emptyBottle:
	call emptyBottleItem
	jr +
emptyBottle_deleteSelf:
	call emptyBottle_refreshGfx
+
	jp clearParentItem


emptyBottle_state2:
	ld e,Item.var3a
	ld a,(de)
	rst_jumpTable
	.dw @empty
	.dw emptyBottle_deleteSelf ; fairy - stub
	.dw emptyBottle_deleteSelf ; water - stub

@empty:
; save [var3a] in b
	ld a,(de)
	ld b,a
; check var3b (if bottling already occurred)
	inc e
	ld a,(de)
	cpa $00
	jr nz,@@playAnimation
; check if [wEmptyBottleItem] changed from [var3a]
	ld a,(wEmptyBottleItem)
	cpa $00
	jr z,@@playAnimation
	cp b
	jr nz,@getItem

@@playAnimation:
	; Wait for the animation to finish, then delete the item
	ld e,Item.animParameter
	ld a,(de)
	rlca
	jp nc,specialObjectAnimate_optimized
	jp clearParentItem

@getItem:
; a == [wEmptyBottleItem]
	ld a,(wEmptyBottleItem)
	ld bc,TX_00_GET_FAIRYBOTTLE-1
	add c
	ld c,a
	call showText

	lda SND_GETITEM
	call playSound

	ld e,Item.var3b
; e == [var3b]
	lda $01
	ld (de),a
	jr @empty@playAnimation















/*
	call checkLinkOnGround
	jp nz,clearParentItem
	call isLinkInHole
	jp c,clearParentItem
	call checkNoOtherParentItemsInUse
	jp nz,clearParentItem

	ld a,$80
	ld (wcc95),a
	ld a,$ff ~ DISABLE_LINK ~ DISABLE_ALL_BUT_INTERACTIONS
	ld (wDisabledObjects),a

	call parentItemLoadAnimationAndIncState ; TODO: make sure this is okay to call - set up Link's animations

	lda SND_GAINHEART
	call playSound
*/












/*
	ld hl,wcc63
	bit 7,(hl)
	jr nz,++

	ld (hl),$00
	call updateLinkDirectionFromAngle

	; Initialize child item
	ld hl,w1WeaponItem.enabled
	ld a,(hl)
	or a
	ld b,$40
	call nz,clearMemory
	ld h,d
	ld l,Item.enabled
	set 7,(hl)
	call parentItemLoadAnimationAndIncState
	jp itemCreateChild

; Swinging bottle
@state1:
	ld a,(wcc63)
	rlca
	jp c,@label_4c8b

	call specialObjectAnimate_optimized
	ld h,d
*/
/*
	ld e,Item.animParameter
	ld a,(de)
	or a
	jr z,++	
++
*/
/*
	; Check for bit 7 of animParameter (marks end of swing animation)
	ld l,e
	bit 7,a
	jr nz,@state2

	bit 5,a
	ret z
	res 5,(hl)
	ret

*/