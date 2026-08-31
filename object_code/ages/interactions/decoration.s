; ==================================================================================================
; INTERAC_DECORATION
; ==================================================================================================
interactionCode80:
	call checkInteractionState
	jr z,@state0

@state1:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw interactionAnimate ; $00
	.dw interactionAnimate ; $01
	.dw interactionAnimate ; $02
	.dw interactionAnimate ; $03
	.dw interactionAnimate ; $04
	.dw interactionAnimate ; $05
	.dw interactionAnimate ; $06
	.dw @deleteIfGotRoomItem ; $07
	.dw @deleteIfGotRoomItem ; $08
	.dw interactionAnimate ; $09
	.dw interactionAnimate ; $0a
	.dw interactionAnimate ; $0b
	.dw interactionAnimate ; $0c
	.dw interactionAnimate ; $0d
	.dw interactionAnimate ; $0e

@state0:
	call interactionInitGraphics
	call interactionIncState
	call objectSetVisible83
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @stub
	.dw @deleteIfMoblinsKeepDestroyed
	.dw @stub
	.dw @stub
	.dw @deleteIfRoomFlagBit7Unset
	.dw @stub
	.dw @deleteIfRoomFlagBit7Unset
	.dw @deleteIfGotRoomItem
	.dw @deleteIfGotRoomItem
	.dw @stub
	.dw @subid0a
	.dw @pirateFlag
	.dw @pirateBow1
	.dw @pirateBow2
	.dw @pirateBow3

@stub:
	ret

; Subid $01 (moblin's keep flag)
@deleteIfMoblinsKeepDestroyed:
	ld a,GLOBALFLAG_MOBLINS_KEEP_DESTROYED
	call checkGlobalFlag
	ret z
	jp interactionDelete

; Subid $04, $06 (scent seedling & tokay eyeball)
@deleteIfRoomFlagBit7Unset:
	call getThisRoomFlags
	bit 7,a
	ret nz
	jp interactionDelete

@deleteIfGotRoomItem:
	call getThisRoomFlags
	bit ROOMFLAG_BIT_ITEM,a
	ret z
	jp interactionDelete

; Fountain "stream": decide which palette to used based on whether this is the "ruined"
; symmetry city or not
@subid0a:
	call objectSetVisible80
	call @isSymmetryCityRoom
	jr c,@isSymmetryCity

@normalPalette:
	ld a,PALH_7d
	jp loadPaletteHeader

@isSymmetryCity:
	ld a,(wActiveGroup)
	or a
	jr nz,@ruinedSymmetryPalette
	call getThisRoomFlags
	and $01
	jr nz,@normalPalette

@ruinedSymmetryPalette:
	ld a,PALH_7c
	jp loadPaletteHeader

@isSymmetryCityRoom:
	ld a,(wActiveRoom)
	ld e,a
	ld hl,@symmetryCityRooms
	jp lookupKey

@symmetryCityRooms:
	.db $12 $00
	.db $13 $00
	.db $14 $00
	.db $00

@pirateFlag: ; $0b
@pirateBow1: ; $0c
	call @pirateBow3@initialize
	ld e,Interaction.subid
	ld a,(de)
	cp $0c
	ret nz
; add bow edges and railing 
	ldbc $30,$00 ; Y X location
	ld e,$0d;$0a ; subid
	call @@createDecoration
	ldbc $30,$18
	ld e,$0e;$0b
@@createDecoration:
	call getFreeInteractionSlot
	ret nz
	ld (hl),INTERAC_DECORATION ; INTERAC_74
	inc l
	ld (hl),e
	ld e,Interaction.yh
	ld a,(de)
	add b
	ld l,e
	ld (hl),a
	ld e,Interaction.xh
	ld a,(de)
	add c
	ld l,e
	ld (hl),a
	ret

@pirateBow2: ; $0d
@pirateBow3: ; $0e
@@initialize:
	call interactionIncState
	ld a,PALH_cb;PALH_57
	call loadPaletteHeader
	call interactionInitGraphics
	jp objectSetVisible80
