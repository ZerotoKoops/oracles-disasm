updateJumpIndex:
; jump index already set to zero from playSound
; wLastChannelJumpIndex updated by indexJump in audio.s
	ld hl,wLastChannelJumpIndex
	ld a,(wNumEnemies)
.ifdef ROM_AGES
	cp $02
.else ; ROM_SEASONS
	cp $02
.endif
	jr c,@notManyEnemies
; Enemies are around
; If playing standing section, go back to section A/L
	ld a,(hl)
	cp SECTION_R
	jr nc,@sectionA
; play section M first and only once
	cp SECTION_M
	ld a,SECTION_M
	jp c,@setJumpIndex
; cycle section N through Q
	ld a,(hl)
	inc a
	cp SECTION_R
	jr c,@setJumpIndex

	ld a,SECTION_N
	jr @setJumpIndex

@notManyEnemies:
	cpa $00
	jr z,@noEnemies
	ld a,120;30
	ld (wChannelJumpIndexTimer),a
@noEnemies:
; check if Link is moving or if an item is out
	ld hl,hyruleField_swordDistributionTable
	ld b,ITEM_SWORD
	call @checkForItem
	jr c,@linkIsMoving

	ld hl,hyruleField_genericItemDistributionTable
	ld d,FIRST_ITEM_INDEX
@@nextItem:	
	ld e,Item.enabled
	ld a,(de)
	bit 0,a
	jr nz,@linkIsMoving
	inc d
	ld a,d
	cp $e0
	jr c,@@nextItem

	ld a,(w1Link.speed)
	or a
	jr z,@checkStandingTimer
/*
; if Link is walking, checks for water tiles. 
	ld a,TILEINDEX_WATER ;$fd
@@findWaterTile:
	call findTileInRoom
	ld hl,hyruleField_waterDistributionTable
	jr z,@linkIsMoving
	dec a
	cp TILEINDEX_PUDDLE
	jr nz,@@findWaterTile
*/
; no special cases, Link is walking
	ld hl,hyruleField_walkingDistributionTable
	
@linkIsMoving:
; Make sure link doesn't need to go back to section A
	ld a,200;50
	ld (wChannelJumpIndexTimer),a
@@skipTimerReset:
	ld a,(wLastChannelJumpIndex)
	sub SECTION_L
	jr c,@normalBehavior

@sectionA:
	;xor a ; SECTION_A
	ld hl,hyruleField_restartDistributionTable
	call getRandomIndexFromProbabilityDistribution
	ld a,b
	jr @setJumpIndex

@checkStandingTimer:
; Link is standing, let timer run out before beginning standing music
	ld a,(wChannelJumpIndexTimer)
	or a
	jr z,@linkIsStanding
	dec a
	ld (wChannelJumpIndexTimer),a
	jr @linkIsMoving@skipTimerReset

@linkIsStanding:
; timer ran out, play standing music
	ld a,(wLastChannelJumpIndex)
	cpa SECTION_R
	lda SECTION_R
	jr c,@setJumpIndex
; randomize between sections S to U after playing R
	ld hl,hyruleField_standingDistributionTable
	call getRandomIndexFromProbabilityDistribution
	lda SECTION_S
	add b
	jr @setJumpIndex

@normalBehavior:
; Normal behaviour
	call getRandomIndexFromProbabilityDistribution
	inc b ; add SECTION_B
	ld a,b

@setJumpIndex:
	ld hl,wLastChannelJumpIndex
	cp (hl)
	ret z

	ld (wChannelJumpIndex),a
	ret

; sets carry flag if item is present
; [b] 	item id
@checkForItem:
	ld d,FIRST_ITEM_INDEX
@@nextItem:	
	ld e,Item.id
	ld a,(de)
	cp b
	jr z,@@foundItem
	inc d
	ld a,d
	cp $e0
	jr c,@@nextItem
	ret
@@foundItem:
	scf
	ret 

hyruleField_restartDistributionTable:
	.db $60					; Section A
	.db $10 $00 $00 $00 $00 ; Sections B-F
	.db $00 $00 $20 $40 $30 ; Sections G-K

hyruleField_walkingDistributionTable:
	.db $20 $18 $20 $40 $10	; Sections B-F; $a8
	.db	$10 $10 $08 $18 $18	; Sections G-K; $58
	;	12.500% 9.375% 9.375% 25.0% 3.125%
	;	09.375% 6.250% 3.125% 12.5% 9.375%

hyruleField_swordDistributionTable:
	.db $08 $10 $24 $00 $18	; Sections B-F; $54
	.db	$18 $18 $38 $20 $24	; Sections G-K; $ac

hyruleField_genericItemDistributionTable:
	.db $14 $14 $22 $20 $14	; Sections B-F; $7e
	.db	$14 $14 $20 $1c $1e	; Sections G-K; $82

/*
hyruleField_waterDistributionTable:
	.db $0c $0c $30 $28 $38	; Sections B-F; $a8
	.db	$18 $20 $08 $08 $10	; Sections G-K; $58
*/

hyruleField_standingDistributionTable:
	.db $40 $40 $80 ; Sections S-U