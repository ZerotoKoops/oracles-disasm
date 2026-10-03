; ==================================================================================================
; INTERAC_MISCELLANEOUS_2
; ==================================================================================================
interactionCodedc:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw interactiondc_subid00
	.dw interactiondc_subid01
	.dw interactiondc_subid02
	.dw interactiondc_stub
	.dw interactiondc_stub
	.dw interactiondc_subid05
	.dw interactiondc_stub
	.dw interactiondc_subid07
	.dw interactiondc_subid08
	.dw interactiondc_stub
	.dw interactiondc_stub
	.dw interactiondc_subid0B
	.dw interactiondc_subid0C
	.dw interactiondc_subid0D
	.dw interactiondc_stub
	.dw interactiondc_subid0F
	.dw interactiondc_subid10
	.dw interactiondc_subid11
	.dw interactiondc_stub
	.dw interactiondc_subid13
	.dw interactiondc_subid14
	.dw interactiondc_subid15
	.dw interactiondc_subid16
	.dw interactiondc_subid17
	.dw interactiondc_subid18
	.dw interactiondc_subid19
	.dw interactiondc_subid1a


; Heart piece spawner
interactiondc_subid07:
	call getThisRoomFlags
	and ROOMFLAG_ITEM
	jp nz,interactionDelete

	call getItemBasedOnVar03
	call createTreasure
	call objectCopyPosition
interactiondc_stub:
	jp interactionDelete


; Replaces a tile at a position with a given value when destroyed
interactiondc_subid08:
	call checkInteractionState
	jr z,@state0

@state1:
	ld e,Interaction.yh
	ld a,(de)
	ld c,a

	ld b,>wRoomLayout
	ld a,(bc)
	ld l,a
	ld e,Interaction.var03
	ld a,(de)
	cp l
	ret z

	call getThisRoomFlags
	ld e,Interaction.xh
	ld a,(de)
	or (hl)
	ld (hl),a
	jp interactionDelete

@state0:
	call getThisRoomFlags
	ld e,Interaction.xh
	ld a,(de)
	and (hl)
	jp nz,interactionDelete

	ld e,Interaction.yh
	ld a,(de)
	ld c,a
	ld b,>wRoomLayout
	ld a,(bc)
	ld e,Interaction.var03
	ld (de),a
	jp interactionIncState


; Graveyard key spawner
interactiondc_subid00:
	call getThisRoomFlags
	and ROOMFLAG_ITEM
	jp nz,interactionDelete
	ld a,(wNumTorchesLit)
	cp $02
	ret nz
	ld bc,TREASURE_OBJECT_GRAVEYARD_KEY_00
	call createTreasure
	call objectCopyPosition
	jp interactionDelete


; Graveyard gate opening cutscene
interactiondc_subid01:
	call checkInteractionState
	jp nz,interactionRunScript
	call getThisRoomFlags
	and $80
	jp nz,interactionDelete
	ld hl,mainScripts.interactiondcSubid01Script
	call interactionSetScript
	call interactionSetAlwaysUpdateBit
	jp interactionIncState


; Makes screen shake before tuni nut is restored
interactiondc_subid05:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2

@state0:
	ld a,GLOBALFLAG_TUNI_NUT_PLACED
	call checkGlobalFlag
	jp nz,interactionDelete

	call returnIfScrollMode01Unset

	ld a,SNDCTRL_STOPSFX
	call playSound

	ld a,$01
	ld (wScreenShakeMagnitude),a

	call @setRandomShakeDuration
	ld a,(wFrameCounter)
	rrca
	call c,interactionIncState
	jp interactionIncState

@state1:
	xor a
	call @shakeScreen
	ret nz
	call @setRandomShakeDuration
	jp interactionIncState

@state2:
	ld a,(wFrameCounter)
	and $0f
	ld a,SND_RUMBLE
	call z,playSound
	ld a,$08
	call @shakeScreen
	ret nz
	ld l,Interaction.state
	ld (hl),$01

@setRandomShakeDuration:
	call getRandomNumber
	and $7f
	sub $40
	add $60
	ld e,Interaction.counter1
	ld (de),a
	ret

@shakeScreen:
	call setScreenShakeCounter
	ld a,(wFrameCounter)
	rrca
	ret c
	jp interactionDecCounter1


; Handles floor falling in King Moblin's castle
interactiondc_subid0B:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2
	.dw @state3

@state0:
	ld a,$01
	ld (de),a
	ld a,$18
	call objectSetCollideRadius
	ld hl,@listOfTilesToBreak
	jp interactionSetMiniScript

@state1:
	call objectCheckCollidedWithLink_ignoreZ
	ret nc
	call checkLinkCollisionsEnabled
	ret nc

	ld a,DISABLE_LINK
	ld (wDisabledObjects),a

	ld a,SND_CLINK
	call playSound

	ld hl,w1Link
	call objectTakePosition

	ld e,Interaction.counter1
	ld a,30
	ld (de),a

	ld bc,$f808
	call objectCreateExclamationMark
	jp interactionIncState

@state2:
	call interactionDecCounter1
	ret nz
	ld (hl),30 ; [counter1]
	xor a
	ld (wDisabledObjects),a
	jp interactionIncState

@state3:
	call interactionDecCounter1
	ret nz
	ld (hl),$07 ; [counter1]

	call interactionGetMiniScript
	ldi a,(hl)
	ld c,a
	call interactionSetMiniScript
	ld a,c
	or a
	jp z,interactionDelete

	ld a,TILEINDEX_WARP_HOLE
	jp breakCrackedFloor

@listOfTilesToBreak:
	.db $67 $66 $65 $64 $63 $62 $61 $51
	.db $41 $31 $21 $11 $12 $13 $23 $33
	.db $43 $44 $45 $46 $47 $48 $38 $28
	.db $18 $17 $16 $00


; Bridge handler in Rolling Ridge past (subid 0c) and present (subid 0d)
interactiondc_subid0C:
interactiondc_subid0D:
	call checkInteractionState
	jr z,@state0

@state1:
	ld a,(wActiveTriggers)
	or a
	ret z

	ld e,Interaction.subid
	ld a,(de)
	sub $0c
	ld bc,$0801
	ld e,$56
	jr z,++
	ld bc,$0603
	ld e,$28
++
	call getFreePartSlot
	ret nz
	ld (hl),PART_BRIDGE_SPAWNER
	ld l,Part.counter2
	ld (hl),b
	ld l,Part.angle
	ld (hl),c
	ld l,Part.yh
	ld (hl),e

	call getThisRoomFlags
	set 7,(hl)

	ld a,SND_SOLVEPUZZLE
	call playSound
	jp interactionDelete

@state0:
	call getThisRoomFlags
	and $80
	jp nz,interactionDelete
	jp interactionIncState


; Shows text upon entering a room (only used for sea of no return entrance and black tower turret)
interactiondc_subid0F:
	call checkInteractionState
	jr z,@state0
	call objectCheckCollidedWithLink_notDead
	ret nc

	ld bc,TX_120a
	ld a,(wActiveRoom)
	cp $d0
	jr nz,@showText
	ld bc,TX_0209
@showText:
	call showText
	jp interactionDelete

@state0:
	ld a,(wScrollMode)
	and $02
	jp z,interactionDelete
	ld a,(w1Link.yh)
	cp $78
	jp c,interactionDelete
	ld a,$08
	call objectSetCollideRadius
	jp interactionIncState


; [edited for Room 026]
; Black tower entrance handler: warps Link to different variants of black tower.
interactiondc_subid10:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2

@state0:
	ld hl,wRoomLayout+$51
	xor a
	ldi (hl),a
	ld (hl),a

	ld bc,$0408
	call objectSetCollideRadii

	call objectCheckCollidedWithLink_notDeadAndNotGrabbing
	call nc,interactionIncState
	jp interactionIncState

@state1:
	call objectCheckCollidedWithLink_notDeadAndNotGrabbing
	ret c
	jp interactionIncState

@state2:
	call objectCheckCollidedWithLink_notDeadAndNotGrabbing
	ret nc
	call checkLinkVulnerable
	ret nc

	ld e, Interaction.var03
	ld a,(de)
	or a
	jr nz,@@Room87
@@Room26:
	ld a,(wCurrentSeason)
	cp SEASON_WINTER
	ld hl,@@warp1
	jr z,+
	ld hl,@@warp2
+
	call setWarpDestVariables
	ld a,SND_ENTERCAVE
	call playSound
	jp interactionDelete

@@warp1:
	m_HardcodedWarpA ROOM_AGES_339, $93, $ff, $01
@@warp2:
	m_HardcodedWarpA ROOM_AGES_338, $93, $ff, $01


@@Room87:
	ld a,(wCurrentSeason)
	ld c,$05
	call multiplyAByC
	ld bc,@@summerWarp
	add hl,bc
	rst_addAToHl

	call setWarpDestVariables
	ld a,SND_ENTERCAVE
	call playSound
	jp interactionDelete

@@summerWarp:
	m_HardcodedWarpA ROOM_AGES_52a, $93, $91, $03
@@fallWarp:
	m_HardcodedWarpA ROOM_AGES_52d, $93, $91, $03
@@winterWarp:
	m_HardcodedWarpA ROOM_AGES_53d, $93, $91, $03
@@springWarp:
	m_HardcodedWarpA ROOM_AGES_514, $93, $91, $03



; Gives D6 Past boss key when you get D6 Present boss key
; Sets wDungeonBossKeys,wDungeonCompasses, or wDungeonMaps
; according to Y (0-2)
;
interactiondc_subid11:
	call getThisRoomFlags
	and ROOMFLAG_ITEM
	ret z
	ld hl,wDungeonBossKeys
	ld e,Interaction.yh
	ld a,(de)
	rst_addAToHl

	ld b,$02
	ld a,(wDungeonIndex)
	cp b
	jr nz,+
	ld b,$0b
+
	ld a,b
	jp setFlag


; Makes lava-waterfall an d4 entrance behave like lava instead of just a wall, so that the fireballs
; "sink" into it instead of exploding like on land.
interactiondc_subid13:
	call returnIfScrollMode01Unset
	ld de,@subid13Data
	jr setRoomLayoutBlock

@subid13Data:
	.db $14 $24 $34 $ff
/*
interactiondc_subid14:
	call returnIfScrollMode01Unset
	ld de,@subid14Data
	jr setRoomLayoutBlock

@subid14Data:
	.db $21 $31 $27 $37 $64 $74 $ff
*/
setRoomLayoutBlock:
	ld b,TILEINDEX_OVERWORLD_LAVA_1
	ld hl,wRoomLayout
-
	ld a,(de)
	ld l,a
	inc a
	jp z,interactionDelete
	ld (hl),b
	inc l
	ld (hl),b
	inc de
	jr -



; Spawns portal to final dungeon from maku tree
interactiondc_subid14:
	call objectGetTileAtPosition
	cp $ed ; TODO
	ret nz
	call getThisRoomFlags
	set ROOMFLAG_BIT_80,(hl)
	ld b,INTERAC_DECORATION
	call objectCreateInteractionWithSubid00
@delete:
	jp interactionDelete



; Sets present sea of storms chest contents (changes if linked)
interactiondc_subid15:
	call checkInteractionState
	jr z,interactiondc_subid15And16_state0

@state1:
	call checkIsLinkedGame
	ld a,$01
	jr nz,interactiondc_subid15And16_setChestContents
	dec a

interactiondc_subid15And16_setChestContents:
	ld hl,@chestContents
	rst_addDoubleIndex
	ldi a,(hl)
	ld (wChestContentsOverride),a
	ld a,(hl)
	ld (wChestContentsOverride+1),a
	jp interactionDelete

@chestContents:
	dwbe TREASURE_OBJECT_GASHA_SEED_01 ; Unlinked
	dwbe TREASURE_OBJECT_RING_1e       ; Linked

interactiondc_subid15And16_state0:
	call getThisRoomFlags
	and ROOMFLAG_ITEM
	jp nz,interactionDelete
	jp interactionIncState


; Sets past sea of storms chest contents (changes if linked)
interactiondc_subid16:
	call checkInteractionState
	jr z,interactiondc_subid15And16_state0
	call checkIsLinkedGame
	ld a,$00
	jr nz,interactiondc_subid15And16_setChestContents
	inc a
	jr interactiondc_subid15And16_setChestContents


; Forces Link to be squished when he's in a wall (used in ages d5 BK room)
interactiondc_subid17:
	call checkInteractionState
	jp z,interactionIncState

@state1:
	ld a,(w1Link.yh)
	ld b,a
	ld a,(w1Link.xh)
	ld c,a
	callab bank5.checkPositionSurroundedByWalls
	rl b
	ret nc

	ld a,(w1Link.state)
	cp LINK_STATE_NORMAL
	ret nz

	ld hl,wLinkForceState
	ld a,(hl)
	or a
	ret nz

	ld a,LINK_STATE_SQUISHED
	ldi (hl),a
	ld a,(wBlockPushAngle)
	and $08
	xor $08
	ld (hl),a ; [wcc50]
	ret


;causes warp in D3 from obtaining Rod of Seasons and D4 from obtaining Din's gift
interactiondc_subid18:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @state0
	.dw @state1
	.dw @state2
@state0:
	call getThisRoomFlags
	ld b,a
	and ROOMFLAG_40
	jp nz, interactionDelete
	ld a,b
	and ROOMFLAG_ITEM
	jp nz,interactionIncState

	ld e,Interaction.var03
	ld a,(de)
	ld b,a
	;ld b, TREASURE_ROD_OF_SEASONS
	ld c,$00
	call createTreasure
	jp objectCopyPosition

@state1:
	ld a,(wTextIsActive)	;$cba0
	or a
	ret nz
	ld a,$81
	ld (wDisableLinkCollisionsAndMenu),a	;$cbca
	ld (wDisabledObjects),a					;$cca4
	call interactionIncState
	ld e,Interaction.counter1	;$46
	ld a,$96						;wait 150 frames (3 seconds) $5a
	ld (de),a
	ld a,SNDCTRL_MEDIUM_FADEOUT	;$fb
	jp playSound

@state2:
	call interactionDecCounter1
	ret nz
	call getThisRoomFlags
	set ROOMFLAG_BIT_40,(hl)
	ld hl,@D3warpDestVariables
	ld e,Interaction.var03
	ld a,(de)
	cp $07
	jr z,+
	ld hl,@D4warpDestVariables
+
	call setWarpDestVariables
	ld a,SND_FADEOUT				;$b4
	call playSound
	jp interactionDelete
@D3warpDestVariables:
	m_HardcodedWarpA ROOM_AGES_027 $00 $15 $83
@D4warpDestVariables:
	m_HardcodedWarpA ROOM_AGES_077 $00 $46 $83


; creates interaction $dc07 when tile is destroyed
interactiondc_subid19:
	call checkInteractionState
	jr nz,@state1

@state0:
	inc a
	ld (de),a

	call getThisRoomFlags
	bit ROOMFLAG_BIT_ITEM,a
	jp nz,interactionDelete

	call objectGetTileAtPosition
	ld e,Interaction.var30
	ld (de),a

@state1:
	call objectGetTileAtPosition
	ld h,d
	ld l,Interaction.var30
	cp (hl)
	ret z

	; Tile has changed
	call getItemBasedOnVar03
	call createTreasure
	call objectCopyPosition
	ld a,SND_SOLVEPUZZLE
	call playSound
	jp interactionDelete

interactiondc_subid1a:
	call getThisRoomFlags
	bit ROOMFLAG_BIT_ITEM,a
	jp nz,interactionDelete

	ld a,(wScrollMode)
	and $08 ; in screen transition
	ret nz

	ld a,(wNumEnemies)
	cpa $00
	ret nz

	call getItemBasedOnVar03
	call createTreasure
	call objectCopyPosition
	jp interactionDelete

getItemBasedOnVar03:
	ld e,Interaction.var03
	ld a,(de)
	ld hl,itemsTable
	rst_addAToHl
	ld b,(hl)
	inc hl
	ld c,(hl)
	ret

itemsTable:
	.db TREASURE_HEART_PIECE,$00 ; Room 005
	.db TREASURE_HEART_PIECE,$00 ; Room 007
	.db TREASURE_HEART_PIECE,$00 ; Room 00d
	.db TREASURE_HEART_PIECE,$00 ; Room 032
	.db TREASURE_HEART_PIECE,$00 ; Room 172
	.db TREASURE_HEART_PIECE,$00 ; Room 133
	.db TREASURE_HEART_PIECE,$00 ; Room 50a
	.db TREASURE_HEART_PIECE,$00 ; Room 501
	.db TREASURE_HEART_PIECE,$00 ; Room 506
	.db TREASURE_HEART_PIECE,$00 ; Room 504
	.db TREASURE_HEART_PIECE,$00 ; Room 038
	.db TREASURE_HEART_PIECE,$00 ; Room 50b
	.db TREASURE_HEART_PIECE,$00 ; Room 25e
	.db TREASURE_HEART_PIECE,$02 ; Room 453
	.db TREASURE_HEART_PIECE,$00 ; Room 429
	.db TREASURE_HEART_PIECE,$02 ; Room 42a
	.db TREASURE_HEART_PIECE,$00 ; Room 044
	.db TREASURE_HEART_PIECE,$00 ; Room 41e
	.db TREASURE_HEART_PIECE,$00 ; Room 509
	.db TREASURE_HEART_PIECE,$00 ; Room 113
	.db TREASURE_HEART_PIECE,$02 ; Room 239
	.db TREASURE_HEART_PIECE,$00 ; Room 50d
	.db TREASURE_HEART_PIECE,$02 ; Room 32a
	.db TREASURE_HEART_PIECE,$00 ; Room 308
	.db TREASURE_HEART_PIECE,$00 ; Room 507
	.db TREASURE_HEART_PIECE,$00 ; Room 505
	.db TREASURE_HEART_PIECE,$02 ; Room 5b2
	.db TREASURE_HEART_PIECE,$00 ; Room 5c1
	.db TREASURE_HEART_PIECE,$00 ; Room 5c0
	.db TREASURE_HEART_PIECE,$00 ; Room 5b8
	.db TREASURE_HEART_PIECE,$00 ; Room 572
	.db TREASURE_HEART_PIECE,$00 ; Room 54c
	.db TREASURE_HEART_PIECE,$00 ; Room 548
	.db TREASURE_HEART_PIECE,$00 ; Room 534
	.db TREASURE_HEART_PIECE,$00 ; Room 406
	.db TREASURE_HEART_PIECE,$00 ; Room 3af
	.db TREASURE_HEART_PIECE,$00 ; Room 186
	.db TREASURE_HEART_PIECE,$00 ; Room 153
	.db TREASURE_HEART_PIECE,$00 ; Room 138
	.db TREASURE_HEART_PIECE,$02 ; Room 122
	.db TREASURE_HEART_PIECE,$00 ; Room 057
	.db TREASURE_HEART_PIECE,$02 ; Room 011
	.db TREASURE_HEART_PIECE,$00 ; Room 427
	.db TREASURE_HEART_PIECE,$00 ; Room 160
	.db TREASURE_HEART_PIECE,$00 ; Room 20a

interactiondc_subid02:
	call getThisRoomFlags
	bit ROOMFLAG_BIT_ITEM,a
	jp nz,interactionDelete

	call checkInteractionState
	jr z,@@initialize

	; Check that Link has collided with this object, he's not holding anything, and
	; he's diving.
	ld a,(wLinkSwimmingState)
	rlca
	ret nc
	call objectCheckCollidedWithLink_notDeadAndNotGrabbing
	ret nc

	call getItemBasedOnVar03
	call createTreasure
	call objectCopyPosition
	jp interactionDelete

@@initialize:
	inc a ; $01
	ld (de),a
	inc a ; $02
	jp objectSetCollideRadius
