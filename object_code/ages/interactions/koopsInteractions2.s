; BANK $0a
; ==============================================================================
; INTERAC_GET_ROD_OF_SEASONS
;
; Variables:
;   var03:    Index of a seasons' sparkle from 0 to 3
;   var3b:    Initial time for each seasons' sparkle to start dropping sparkles
;   $cceb:    Set to 1 when Rod disappears, to remove its aura, and continue cutscene
; ==============================================================================
interactionCode94:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw _state0
	.dw _state1

_state0:
	ld a,$01
	ld (de),a

	call interactionInitGraphics
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @subid0
	.dw @sparkles
	.dw @rodOfSeasons
	.dw @rodOfSeasonsAura

@subid0:
	call getThisRoomFlags
	bit 5,(hl)
	jp nz,interactionDelete
	xor a
	ld (wcceb),a
	ld hl,mainScripts.gettingRodOfSeasonsScript
	jp interactionSetScript

@sparkles:
	ld e,Interaction.var03
	ld a,(de)
	rlca
	ld hl,@sparklesData
	rst_addDoubleIndex

	ldi a,(hl)
	ld e,Interaction.angle
	ld (de),a

	ldi a,(hl)
	ld e,Interaction.oamFlags
	ld (de),a

	ldi a,(hl)
	ld e,Interaction.var3b
	ld (de),a

	ldi a,(hl)
	ld e,Interaction.speed
	ld (de),a

	ld h,d
	ld l,Interaction.counter1
	ld (hl),60

	ld l,Interaction.counter2
	ld (hl),90
	jp objectSetVisible80
@sparklesData:
	; angle - oamFlags - var3b(time to start pulsing) - speed
	.db $03 $00 $08 SPEED_180	;spring
	.db $0b $02 $0c SPEED_100	;summer
	.db $15 $03 $10 SPEED_100	;autumn
	.db $1d $01 $14 SPEED_180	;winter

@rodOfSeasons:
	ld a,$04
	call objectSetCollideRadius
	ld h,d
	ld l,Interaction.zh
	ld (hl),$f0

	ld l,Interaction.counter1
	ld (hl),$00

	ld l,Interaction.counter2
	ld (hl),$30

	ldbc INTERAC_GET_ROD_OF_SEASONS 03
	call objectCreateInteraction
	ret nz

	ld l,Interaction.relatedObj1
	ldh a,(<hActiveObjectType)
	ldi (hl),a
	ldh a,(<hActiveObject)
	ld (hl),a

	jp objectSetVisible81

@rodOfSeasonsAura:
	call interactionSetAlwaysUpdateBit
	jp objectSetVisible82

_state1:
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @subid0
	.dw @sparkles
	.dw @rodOfSeasons
	.dw @rodOfSeasonsAura

@subid0:
	call interactionRunScript
	jp c,interactionDelete
	ret

@sparkles:
	call interactionAnimate
	ld e,Interaction.substate
	ld a,(de)
	rst_jumpTable
	.dw @@waitToMove
	.dw @@move

@@waitToMove:
	call interactionDecCounter2
	ret nz
	call interactionIncSubstate

@@move:
	call dropSparkles
	call objectApplySpeed
	call interactionDecCounter1
	jp z,interactionDelete
	ret

@rodOfSeasons:
	ld e,Interaction.substate
	ld a,(de)
	rst_jumpTable
	.dw @@substate0
	.dw @@substate1
	.dw @@substate2
	.dw @@substate3
	.dw @@substate4
	.dw @@substate5
	.dw @@substate6

@@substate0:
	ld a,(wFrameCounter)
	and $03
	ret nz

	ld h,d
	ld l,Interaction.counter1
	inc (hl)
	ld a,(hl)
	and $0f
	ld hl,@@hoverOffset;seasonsTable_15_705f
	rst_addAToHl
	ld a,(hl)
	add $f0
	ld e,Interaction.zh
	ld (de),a
	ld h,d
	ld l,Interaction.counter2
	dec (hl)
	ret nz

	call clearAllParentItems

	ld hl,w1Link.direction
	ld (hl),DIR_UP

	call objectGetAngleTowardLink
	ld h,d
	ld l,Interaction.angle
	ld (hl),a

	ld l,Interaction.speed
	ld (hl),SPEED_80

	ld l,Interaction.substate
	inc (hl)
	ret

@@hoverOffset:;seasonsTable_15_705f:
	.db $00 $00 $ff $ff
	.db $ff $fe $fe $fe
	.db $fe $fe $fe $ff
	.db $ff $ff $ff $00

@@substate1:
	call objectGetAngleTowardLink
	ld e,Interaction.angle
	ld (de),a
	call objectApplySpeed
	call objectCheckCollidedWithLink_ignoreZ
	ret nc

	ld e,Interaction.collisionRadiusX
	ld a,$06
	ld (de),a
	jp interactionIncSubstate

@@substate2:
	ld c,$08
	call objectUpdateSpeedZ_paramC
	jr z,+
	call objectCheckCollidedWithLink_notDeadAndNotGrabbing
	ret nc
+
	ld h,d
	ld l,Interaction.counter2
	ld (hl),$1e
	jp interactionIncSubstate

@@substate3:
	call interactionDecCounter2
	ret nz

	ld a,$04
	ld (wLinkForceState),a
	xor a
	ld (wcc50),a

	call interactionIncSubstate
	ld a,(w1Link.yh)
	sub $0e
	ld l,Interaction.yh
	ldi (hl),a

	inc l
	ld a,(w1Link.xh)
	sub $04
	ldi (hl),a

	; zh/speed
	inc l
	xor a
	ldi (hl),a
	ld (hl),a

	call getThisRoomFlags
	set 5,(hl)

	ld a,MUS_ESSENCE
	call playSound

	ld bc,TREASURE_OBJECT_HEART_PIECE_00
	call spawnTreasureOnLink

	jp darkenRoom

@@substate4:
	call retIfTextIsActive
	call interactionIncSubstate
	ld hl,mainScripts.gettingRodOfSeasonsScript_setCounter1To32
	jp interactionSetScript

@@substate5:
	call interactionRunScript
	ret nc

	call interactionIncSubstate
	ld l,Interaction.counter2
	ld (hl),$14
	jp brightenRoom

@@substate6:
	ld a,(wPaletteThread_mode)
	or a
	ret nz

	call interactionDecCounter2
	ret nz
	ld a,$01
	ld (wcceb),a
	jp interactionDelete

@rodOfSeasonsAura:
	ld a,(wcceb)
	or a
	jp nz,interactionDelete

	ld a,$00
	call objectGetRelatedObject1Var
	call objectTakePosition
	call interactionAnimate
	ld h,d
	ld l,Interaction.animParameter
	ld a,(hl)
	or a
	ret z
	ld (hl),$00
	ld l,Interaction.visible
	ld a,$80
	xor (hl)
	ld (hl),a
	ret

dropSparkles:
	ld h,d
	ld l,Interaction.var3b
	dec (hl)
	ret nz

	ld l,Interaction.var3b
	ld (hl),$10
	ldbc INTERAC_SPARKLE, $01
	jp objectCreateInteraction

; ==================================================================================================
; INTERAC_DANCE_HALL_MINIGAME
; ==================================================================================================
/*
interactionCodeec:
ld b,b
	ld e,Interaction.subid
	ld a,(de)
	rst_jumpTable
	.dw @subid0
	.dw @subid1
	.dw @subid2
	.dw @subid3

; spawner
@subid0:
	ld a,$01
	ld (wInShop),a
	ld b,$20
	ld hl,wTmpcfc0.subrosianDance.cfc0 ;$cfc0
	call clearMemory
	ld hl,objectData.objectData7e6c
	call parseGivenObjectData
	jp interactionDelete

; dance leader
@subid1:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @@state0
	.dw @@state1
	.dw @@state2
	.dw @@state3
	.dw @@state4
	.dw @@state5
@@state0:
	call @@initialize
	ld hl,mainScripts.dancecLeaderScript_promptToStartDancing
	jp interactionSetScript

@@initialize ;func_5c21:
	ld a,$01
	ld (de),a
	call interactionSetAlwaysUpdateBit
	ld l,Interaction.direction ;$48
	ld (hl),DIR_DOWN ;$02
	inc l ; [angle]
	ld (hl),ANGLE_DOWN ;$10
	call interactionInitGraphics
	jp objectSetVisiblec2

@@state2:
	ld c,$28
	call objectUpdateSpeedZ_paramC
	call interactionRunScript
	jp interactionAnimate

@@state3:
	call interactionAnimate
	ld e,Interaction.substate
	ld a,(de)
	rst_jumpTable
	.dw @@@substate0
	.dw interactionRunScript
	.dw @@@substate2

@@@substate0:
	ld a,$01
	ld (de),a ; [substate]
	ld (wTmpcfc0.subrosianDance.leaderSubstate),a
	ld a,SPEED_200
	ld (wTmpcfc0.subrosianDance.dancerSetSpeed),a
	ld hl,mainScripts.danceLeaderScript_promptForTutorial
	jp interactionSetScript
	
@@@substate2:
	ld a,(wPaletteThread_mode)
	cpa $00
	ret nz
	lda $00 ; redundant
	ld h,d
	ld l,e
	ldd (hl),a ; [substate] == 0
	inc (hl) ; inc [state]
; sets Link's ID to subrosia dance
	ld a,$14;$01
	call setLinkIDOverride
	jp fastFadeinFromWhite

@@moveClockwise: ;func_5c6f:
	ld a,$01
	ld (wTmpcfc0.subrosianDance.dancerSetDirection),a
	ld a,$04
	jr +++

@@moveCounterclockwise ;func_5c78:
	ld a,$ff
	ld (wTmpcfc0.subrosianDance.dancerSetDirection),a
	ld a,$04
	jr +++

@@makePose: ;func_5c81:
	ld a,$05
	jr +++
; unused
	ld a,$03
+++
	ld (wTmpcfc0.subrosianDance.dancerSetState),a
	ld a,$09
	ld (wTmpcfc0.subrosianDance.dancerIndex),a
	ld hl,wTmpcfc0.subrosianDance.leaderSubstate
	inc (hl)
	ret

; Let's start dancing!
@@state4:
	ld e,Interaction.substate
	ld a,(de)
	rst_jumpTable
	.dw @@@substate0
	.dw @@@substate1
	.dw @@@substate2
	.dw @@@substate3
	.dw @@@substate4

@@@substate0:
	ld a,$01
	ld (de),a
; set difficulty based on number of plays
	;ld a,(wNumTimesPlayedSubrosianDance)
	ld a,(wGameProgress2)
	cpa $08
	jr c,+
	lda $08
+
	ld (wTmpcfc0.subrosianDance.difficultyLevel),a
	ld (wTmpcfc0.subrosianDance.cfdc),a
	call @@@setMoveSpeedValues

; set number of rounds based on difficulty
	ld a,(wTmpcfc0.subrosianDance.difficultyLevel)
	ld hl,@@@numRoundsTable
	rst_addAToHl
; add between 0 and 3 extra rounds randomly
	call getRandomNumber
	and $03
	add (hl)
	ld (wTmpcfc0.subrosianDance.remainingRounds),a
	lda $00
	ld (wTmpcfc0.subrosianDance.dancerSetState),a
	ld (wTmpcfc0.subrosianDance.roundsPlayed),a

	lda SND_WHISTLE
	call playSound
	ld e,Interaction.counter2
	ld a,60
	ld (de),a
	ld a,MUS_SUBROSIAN_DANCE
	jp playSound
	
@@@setMoveSpeedValues: ;func_5cdd:
	ld a,(wTmpcfc0.subrosianDance.difficultyLevel)
	ld hl,@@@speedDifficultyData
	rst_addDoubleIndex
	ldi a,(hl)
	ld (wTmpcfc0.subrosianDance.dancerSetSpeed),a
	ldi a,(hl)
	ld (wTmpcfc0.subrosianDance.dancerSetCounter1),a
	ret

; b0: speed
; b1: counter1 - between each moves
@@@speedDifficultyData: ;table_5ced:
	.db SPEED_100 $20 ; $00
	.db SPEED_140 $1e ; $01
	.db SPEED_140 $1c ; $02
	.db SPEED_180 $1a ; $03
	.db SPEED_180 $18 ; $04
	.db SPEED_1c0 $16 ; $05
	.db SPEED_1c0 $14 ; $06
	.db SPEED_200 $14 ; $07
	.db SPEED_200 $12 ; $08
	.db SPEED_240 $12 ; $09
	.db SPEED_280 $10 ; $0a
	.db SPEED_280 $10 ; $0b
	.db SPEED_280 $0e ; $0c
	.db SPEED_300 $0d ; $0d
	.db SPEED_300 $0c ; $0f

@@@numRoundsTable: ;table_5d0b:
	.db 09 ; $00
	.db 09 ; $01
	.db 10 ; $02
	.db 12 ; $03
	.db 14 ; $04
	.db 16 ; $05
	.db 18 ; $06
	.db 20 ; $07
	.db 22 ; $08

; Leader picks 3 moves
@@@substate1:
	call interactionDecCounter2
	ret nz
	ld (hl),$01
	ld a,$02
	ld (de),a
	ld hl,wTmpcfc0.subrosianDance.move1;$cfc8
	call @getRandomMove ;func_5ec4
	ldi (hl),a
	call @getRandomMove ;func_5ec4
	ldi (hl),a ; [move2]
	call @getRandomMove ;func_5ec4
	ldi (hl),a ; [move3]
	lda $00
	ld (hl),a ; [moveCounter]
	ld e,Interaction.counter1
	ld a,(wTmpcfc0.subrosianDance.dancerSetCounter1)
	ld (de),a
	call @makeLeaderJump
	
; Leader shows his moves
@@@substate2:
	call @func_5f1d
	ret nz
	ld a,(wTmpcfc0.subrosianDance.leaderMoveCounter)
	cpa $03
	jr z,+
	jp @performMoveFirstTime
+
; Leader made all 3 moves
	call interactionIncSubstate
	ld a,(wTmpcfc0.subrosianDance.dancerSetCounter1)
	ld l,Interaction.counter1
	ld (hl),a
	lda $00
	ld (wTmpcfc0.subrosianDance.leaderMoveCounter),a
	ld (wTmpcfc0.subrosianDance.dancerMoveCounter),a
; reset linksMove for next round
	lda $ff
	ld (wTmpcfc0.subrosianDance.linksMove),a
	lda $02
	call interactionSetAnimation

; Dances, but this time with Link and dancers
; Decides if he loses or goes to next round
@@@substate3:
	call @checkMoveSuccess
	jr nz,@@@loseGame

	call @func_5f1d
	ret nz

	ld a,(wTmpcfc0.subrosianDance.dancerIndex)
	cpa $00
	ret nz
	ld a,(wTmpcfc0.subrosianDance.leaderMoveCounter)
	cpa $03
	jr z,+
	jp @performMoveSecondTime
+
; All 3 moves were made by the dancers
; Decide whether to go to next round
	ld a,(wTmpcfc0.subrosianDance.dancerMoveCounter)
	cpa $03
	jr nz,@@@loseGame
	ld hl,wTmpcfc0.subrosianDance.remainingRounds
	dec (hl)
	jr z,@@@winGame

	call @@incRoundAndDifficulty
	ld e,Interaction.substate
	lda $01
	ld (de),a
	lda $00
	ld (wTmpcfc0.subrosianDance.leaderMoveCounter),a
	ret

; You lose!
@@@loseGame: ;func_5d91:
	ld bc,TX_0104
	call showText
	lda $04
	ld e,Interaction.substate
	ld (de),a
	ld a,$ff
	ld (wTmpcfc0.subrosianDance.danceOver),a
	ld a,SND_WHISTLE
	call playSound
	ld a,SNDCTRL_MEDIUM_FADEOUT
	jp playSound

; You win!
@@@winGame: ;func_5dab:
	call interactionIncState
	inc l ; [substate]
	ld (hl),$00
	ld a,$01
	ld (wTmpcfc0.subrosianDance.danceOver),a
	ld a,SNDCTRL_MEDIUM_FADEOUT
	call playSound
	ld bc,TX_010a
	jp showText

; clean up for after game is over
@@@substate4:
	call retIfTextIsActive
	ld hl,@@@warpDestVariables
	jp setWarpDestVariables

@@@warpDestVariables:
	m_HardcodedWarpA ROOM_AGES_37a $00 $17 $03
	;m_HardcodedWarpA ROOM_SEASONS_124 $00 $14 $03

; clean up for winning game
@@state5:
	ld e,Interaction.substate
	ld a,(de)
	rst_jumpTable
	.dw @@@substate0
	.dw @@@substate1
	.dw @@@substate2
	.dw interactionRunScript
	.dw @@state4@substate4

@@@substate0:
	call retIfTextIsActive
	ld e,Interaction.substate
	ld a,$01
	ld (de),a
	jp fastFadeoutToWhite

@@@substate1:
	ld a,(wPaletteThread_mode)
	cpa $00
	ret nz

; set Link's ID to normal
	lda $00 ; redundant
	call setLinkIDOverride
	ld l,SpecialObject.yh
	ld (hl),$30
	ld l,SpecialObject.xh
	ld (hl),$48
	ld l,SpecialObject.direction
	ld (hl),DIR_DOWN
	call interactionIncSubstate
	ld a,$81
	ld (wDisabledObjects),a
	ld (wDisableLinkCollisionsAndMenu),a
	ld a,30
	call addToGashaMaturity
	jp fastFadeinFromWhite

@@@substate2:
	ld a,(wPaletteThread_mode)
	cpa $00
	ret nz

	ld a,$81
	ld (wDisabledObjects),a
	ld (wMenuDisabled),a
; only counts up to 255
	ld hl,wNumTimesPlayedSubrosianDance
	call incHlRefWithCap
	ld a,(hl)
; give boomerang if played only once
	dec a
	jr z,@@@giveBoomerang

; give a random ring on eighth and subsequent plays
; if received all rings, then give a gasha seed
	cp $08
	jr z,@@@giveRingOrGashaSeed

; randomly give ore chunks or gasha seed on 2nd - 4th and 6th - 7th plays
	cp $05
	jr nz,@@@giveOreChunksOrGashaSeed
	call checkIsLinkedGame
	jr nz,@@@giveOreChunksOrGashaSeed
	
; On only 5th play, give strange flute if haven't returned Ricky's gloves
	ld a,(wRickyState)
	and $20
	jr nz,@@@giveOreChunksOrGashaSeed
	ld hl,mainScripts.danceLeaderScript_giveFlute
	jr @@@setScript

@@@giveRingOrGashaSeed: ;func_5e40:
	callab scriptHelp.danceHallMinigame_getRingPrize
	bit 7,b
	jr nz,+
	ld c,$00
	call giveRingToLink
	ld hl,mainScripts.danceLeaderScript_itemGiven
	jr @@@setScript

@@@giveOreChunksOrGashaSeed: ;func_5e56:
	call getRandomNumber
	cpa $60
	ld hl,mainScripts.danceLeaderScript_giveOreChunks
	jr nc,@@@setScript
+
	ld hl,mainScripts.danceLeaderScript_gashaSeed
	jr @@@setScript

@@@giveBoomerang: ;func_5e25:
	ld hl,mainScripts.danceLeaderScript_boomerang

@@@setScript: ;func_5e68:
	call interactionSetScript
	ld e,Interaction.substate
	ld a,$03
	ld (de),a
	ret

@@state1:
	call interactionRunScript
	jp npcFaceLinkAndAnimate

@@incRoundAndDifficulty: ;func_5e77:
	ld hl,wTmpcfc0.subrosianDance.roundsPlayed
	ld a,(hl)
	cp $08
	jr c,+
	ld a,$08
+
	inc a
	ld (hl),a
	ld b,a
	and $03
	ret nz
; if new roundsPlayed is $00, $04 or $08,
; increase the difficultyLevel
; after 4 rounds, increase difficulty by 1
; after 8 rounds, increase difficulty by 2
	ld a,b
	rrca
	rrca
; a is $00, $01 or $02
	and $03
	ld b,a
	ld a,(wTmpcfc0.subrosianDance.difficultyLevel)
	add b
	ld (wTmpcfc0.subrosianDance.difficultyLevel),a
	jp @@state4@setMoveSpeedValues

; if this function returns non-zero,
; Link loses the game
@checkMoveSuccess: ;func_5e97:
; If Link collided with a dancer, then lose
	ld a,(wTmpcfc0.subrosianDance.dancerCollidedWithLink)
	cpa $00
	ret nz

; stop check if linksMove is $ff 
	ld a,(wTmpcfc0.subrosianDance.linksMove)
	ld b,a
	inc a
	ret z

; stop check if all 3 dancer moves were performed
	ld a,(wTmpcfc0.subrosianDance.dancerMoveCounter)
	cpa $03
	ret z

; If linksMove did not match the desired move, then lose
	ld hl,wTmpcfc0.subrosianDance.dancerMoveCounter
	inc (hl)
	ld hl,wTmpcfc0.subrosianDance.move1 ;$cfc8
	rst_addAToHl
	ld a,(hl)
	cp b
	ret nz

; Reset linksMove after each move
	ld a,$ff
	ld (wTmpcfc0.subrosianDance.linksMove),a
	ret

@makeLeaderJump: ;func_5eb9:
	ld a,$02
	call interactionSetAnimation
	ld bc,$fe80
	jp objectSetSpeedZ

@getRandomMove: ;func_5ec4:
	call getRandomNumber
	and $0f
	ld bc,@moveDistribution
	call addAToBc
	ld a,(bc)
	ret

@moveDistribution:
	.db $00 $00 $00 $00
	.db $00 $00 $00 $00
	.db $01 $01 $01 $01
	.db $02 $02 $02 $02

@performMoveFirstTime: ;func_5ee1:
	call @loadMoveSoundAndAnimation
	ld a,e
	call interactionSetAnimation
	jr +

@performMoveSecondTime: ;func_5eea:
	call @loadMoveSoundAndAnimation
	ldh a,(<hFF8B)
	call @setcfc0VarsForDancers
+
	ld hl,wTmpcfc0.subrosianDance.leaderMoveCounter
	inc (hl)
	ld e,Interaction.counter1
	ld a,(wTmpcfc0.subrosianDance.dancerSetCounter1)
	ld (de),a
	ret

@loadMoveSoundAndAnimation: ;func_5efd:
	ld a,(wTmpcfc0.subrosianDance.leaderMoveCounter)
	ld hl,wTmpcfc0.subrosianDance.move1 ;$cfc8
	rst_addAToHl
	ld a,(hl)
	ldh (<hFF8B),a
	ld hl,@moveSoundAndAnimationData
	rst_addDoubleIndex
	ldi a,(hl)
	ld e,(hl)
	jp playSound

@setcfc0VarsForDancers: ;func_5f10:
	rst_jumpTable
	.dw @subid1@moveClockwise
	.dw @subid1@moveCounterclockwise
	.dw @subid1@makePose

; B0: sound
; B1: animation
@moveSoundAndAnimationData: ;table_5f17:
	.db SND_DANCE_MOVE,    $05
	.db SND_SEEDSHOOTER,   $06
	.db SND_GORON_DANCE_B, $04

; Animates Leader and ?
@func_5f1d:
	ld c,$28
	call objectUpdateSpeedZ_paramC
	call interactionAnimate
; if $00 or $ff, just decrease the counter
; if anything else, set animParameter to $00
; and add original value in animParameter to xh
	ld h,d
	ld l,Interaction.animParameter
	ld a,(hl)
	cpa $00
	jr z,+
	inc a
	jr z,+
	dec a
	ld (hl),$00
	ld l,Interaction.xh
	add (hl)
	ld (hl),a
+
	ld l,Interaction.counter1
	ld a,(hl)
	cpa $00
	ret z
	dec (hl)
	ret

; dancer
; Interaction.xh is an index on the NPC's text
@subid2:
	ld e,Interaction.state
	ld a,(de)
	rst_jumpTable
	.dw @@state0
	.dw @@state1
	.dw @@state2
	.dw @@state3
	.dw @@state4
	.dw @@state5
	.dw interactionAnimate

@@state0:
	call @subid1@initialize
	ld e,Interaction.xh
	ld a,(de)
	ld hl,@@dancerNpcText
	rst_addAToHl
	ld e,Interaction.textID
	ld a,(hl)
	ld (de),a
	ld a,>TX_0100
	inc e ; [textID+1]
	ld (de),a
	ld h,d
	ld l,Interaction.var3b
	ld (hl),$01
	ld l,Interaction.yh
	ld a,(hl)
	call setShortPosition
	ld hl,mainScripts.danceLeaderScript_showLoadedText
	jp interactionSetScript

@@dancerNpcText: ;table_5f72:
	.db <TX_010b, <TX_010c, <TX_010d
	.db <TX_010e, <TX_010f, <TX_0110
	.db <TX_0111, <TX_0112, <TX_0113

; Act as NPC until Leader wants to start
@@state1:
	ld a,(wTmpcfc0.subrosianDance.leaderSubstate)
	or a
	jr nz,+
	call interactionRunScript
	jp npcFaceLinkAndAnimate
+
	ld e,Interaction.state
	ld a,$02
	ld (de),a
	ld a,$02
	jp interactionSetAnimation

@@state2:
	call @checkCollisionWithLink
	jr c,@@danceOver

	call interactionAnimate
	ld a,(wTmpcfc0.subrosianDance.danceOver)
	cpa $00
	jr nz,@@danceOver

; waiting for Leader to finish his set
	ld h,d
	ld l,Interaction.var3b
	ld a,(wTmpcfc0.subrosianDance.leaderSubstate)
	cp (hl)
	ret z

	ld (hl),a
	ld a,(wTmpcfc0.subrosianDance.dancerSetState)
	ld l,Interaction.state;$44
	ld (hl),a
	cpa $04
	call z,@@setDancersDirection

	lda $00
	ld e,Interaction.var38
	ld (de),a
	ret

; sets state to 6, which stops
; dancing logic except for npc animation
@@danceOver: ;func_5fb8:
	ld a,$02
	call interactionSetAnimation
	ld e,Interaction.state
	ld a,$06
	ld (de),a
	ret
	
@@setDancersDirection: ;func_5fc3:
	call objectGetShortPosition
	ld c,a
	ld hl,@@movementTable
-
	ldi a,(hl)
	cp c
	jr z,+
	inc hl
	jr -
+
; found dancer's position, now pick the right direction
; $01 for clockwise
; $ff for counterclockwise
	ld a,(wTmpcfc0.subrosianDance.dancerSetDirection)
	bit 7,a
	jr nz,+
	ld a,(hl)
	jr ++
+
	ld a,(hl)
	swap a
++
	and $0f
	ld e,Interaction.direction
	ld (de),a
	ldh (<hFF8B),a
	call interactionSetAnimation
	ldh a,(<hFF8B)
	swap a
	rrca
	ld e,Interaction.angle
	ld (de),a
	ret

; b0: xy position of dancer
; b1: direction and animation
;	upper nibble: going counterclockwise
;	lower nibble: going clockwise
@@movementTable ;table_5ff1:
	.db $11, (8<<DIR_DOWN | DIR_RIGHT)
	.db $21, (8<<DIR_DOWN | DIR_UP)
	.db $31, (8<<DIR_DOWN | DIR_UP)
	.db $41, (8<<DIR_DOWN | DIR_UP)
	.db $51, (8<<DIR_DOWN | DIR_UP)
	.db $61, (8<<DIR_RIGHT | DIR_UP)
	.db $62, (8<<DIR_RIGHT | DIR_LEFT)
	.db $63, (8<<DIR_RIGHT | DIR_LEFT)
	.db $64, (8<<DIR_RIGHT | DIR_LEFT)
	.db $65, (8<<DIR_RIGHT | DIR_LEFT)
	.db $66, (8<<DIR_UP | DIR_LEFT)
	.db $56, (8<<DIR_UP | DIR_DOWN)
	.db $46, (8<<DIR_UP | DIR_DOWN)
	.db $36, (8<<DIR_UP | DIR_DOWN)
	.db $26, (8<<DIR_UP | DIR_DOWN)
	.db $16, (8<<DIR_LEFT | DIR_DOWN)
	.db $15, (8<<DIR_LEFT | DIR_DOWN)
	.db $14, (8<<DIR_LEFT | DIR_DOWN)
	.db $13, (8<<DIR_LEFT | DIR_DOWN)
	.db $12, (8<<DIR_LEFT | DIR_DOWN)

@@state3:
	ld a,$02
	ld (de),a
	ld a,$02
	call interactionSetAnimation
	jr @decDancerIndex

; moving clockwise or counterclockwise
@@state4:
	call @moveDancer
	ret c
	ld l,Interaction.state
	ld (hl),$02
	jr @decDancerIndex

; making pose
@@state5:
	ld a,$02
	ld (de),a
	ld a,$04
	call interactionSetAnimation
	jr @decDancerIndex

@decDancerIndex: ;func_6037:
	ld hl,wTmpcfc0.subrosianDance.dancerIndex
	ld a,(hl)
	or a
	ret z
	dec (hl)
	ret

@moveDancer: ;func_603f:
; saves original position
; in var39 and var3a
; before moving the dancer
	ld h,d
	ld e,Interaction.yh
	ld l,Interaction.var39
	ld a,(de)
	ldi (hl),a
	ld e,Interaction.xh
	ld a,(de)
	ld (hl),a ; [var3a]

	ld a,(wTmpcfc0.subrosianDance.dancerSetSpeed)
	ld e,Interaction.speed
	ld (de),a
	call objectApplySpeed

	call @performBoundaryChecks
	jr @centerIfMovedTooFar

@performBoundaryChecks: ;func_6058:
	ld h,d
	ld l,Interaction.yh
	call @checkYOrX
	ld h,d
	ld l,Interaction.xh

@checkYOrX: ;func_6061:
; Checks that dancer doesn't go further up than $18
; and further left than $18
	ld a,$17
	cp (hl)
	inc a
	jr nc,+
; Does the same for further down $68
; and further right $68
	ld a,$68
	cp (hl)
	ret nc
+
	ld (hl),a
; if dancer reached the edge,
; then use counter/clockwise direction to
; find new direction
	ld a,(wTmpcfc0.subrosianDance.dancerSetDirection)
	ld l,Interaction.direction
	add (hl)
	and $03
	ldi (hl),a
	ld b,a
	swap a
	rrca
	ld (hl),a ; [angle]
	ld a,b
	jp interactionSetAnimation

; center the dancer if they moved too far
@centerIfMovedTooFar: ;func_607e:
; Using the original positions,
; this checks if the dancer moved
; collectively more than $10
; from its original yh,xh position.
; In practice, only one variable change (yh or xh)
; should be non-zero, since this is
; called per move.
	ld e,Interaction.yh
	ld a,(de)
	ld b,a
	ld e,Interaction.var39
	ld a,(de)
	sub b
	jr nc,+
; $100 - a
	cpl
	inc a
+
	ld c,a
	ld e,Interaction.xh
	ld a,(de)
	ld b,a
	ld e,Interaction.var3a
	ld a,(de)
	sub b
	jr nc,+
; $100 - a
	cpl
	inc a
+
	add c
	ld b,a
	ld e,Interaction.var38
	ld a,(de)
	add b
	ld (de),a
	cp $10
	ret c
	jp objectCenterOnTile

@checkCollisionWithLink: ;func_60a4:
	call objectCheckCollidedWithLink
	ret nc
	ld a,$01
	ld (wTmpcfc0.subrosianDance.dancerCollidedWithLink),a
	ret

; tutorial blurb
@subid3:
	ld e,Interaction.state
	ld a,(de)
	or a
	jr nz,+
	ld a,$01
	ld (de),a
	ld e,Interaction.enabled
	ld a,$81
	ld (de),a
	call interactionInitGraphics
+
	ld a,(wTmpcfc0.subrosianDance.tutorialState)
	ld b,a
	cpa $00
	jp z,objectSetInvisible
	call objectSetVisible80
	ld a,b
; leader's script will set tutorialState to $ff
; when the tutorial is over
	cp $ff 
	jp z,interactionDelete
; a,b == tutorial state
	add a
	add b
	ld hl,@table_60e2
	rst_addAToHl
	ldi a,(hl)
	ld e,Interaction.yh
	ld (de),a
	ld e,Interaction.xh
	ldi a,(hl)
	ld (de),a
	ld a,(hl)
	jp interactionSetAnimation

; b0: yh
; b1: xh
; b2: animation
@table_60e2:
	.db $30 $58 $07 ; right
	.db $30 $58 $07 ; right
	.db $30 $38 $08 ; left
	.db $30 $58 $09 ; pose
*/
