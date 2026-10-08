; These are a bunch of scripts used by INTERAC_DUNGEON_SCRIPT.

dungeonScript_spawnChestOnTriggerBit0:
	stopifitemflagset
	checkflagset $00, wActiveTriggers
	scriptjump spawnChestAfterPuff


makuPathScript_spawnChestWhenActiveTriggersEq01:
;	stopifitemflagset
;	checkmemoryeq wActiveTriggers, $01

spawnChestAfterPuff:
	playsound SND_SOLVEPUZZLE
	createpuff
	wait 15
	settilehere TILEINDEX_CHEST
	scriptend

makuPathScript_spawnDownStairsWhenEnemiesKilled:
;	stopifroomflag80set
;	wait 30
;	checknoenemies
;	playsound SND_SOLVEPUZZLE
;	orroomflag $80
;	createpuff
;	wait 15
;	settilehere $45
;	scriptend

makuPathScript_spawn30Rupees:
;	stopifitemflagset
;	spawnitem TREASURE_RUPEES, $0c
;	scriptend
lostLabrinthScript_keyFallsFromActiveTrigger:
	stopifitemflagset
	checkflagset 1, wActiveTriggers
	spawnitem TREASURE_SMALL_KEY, $01
	scriptend

lostLabrinthScript_openPortionOfWall:
	stopifroomflag80set
	checkflagset 1, wActiveTriggers
	disableinput
	wait 30
	shakescreen 100
	playsound SND_BIG_EXPLOSION
	wait 90
	playsound SND_SOLVEPUZZLE
	wait 30
	showtext TX_1214
	orroomflag ROOMFLAG_80
	enableinput
	asm15 scriptHelp.moonlitGrotto_enableControlAfterBreakingCrystal
	scriptend

lostLabrinthScript_givePastMap:
	checkflagset $0b,wDungeonMaps
	asm15 scriptHelp.lostLabrinthScript_givePastMap
	scriptend

lostLabrinthScript_givePresentCompass:
	checkflagset $02,wDungeonCompasses
	asm15 scriptHelp.lostLabrinthScript_givePresentCompass
	scriptend



makuPathScript_keyFallsFromCeilingWhen1TorchLit:
;	stopifitemflagset
;	checkmemoryeq wNumTorchesLit, $01
;	spawnitem TREASURE_SMALL_KEY, $01
;	scriptend

makuPathScript_spawnUpStairsWhen2TorchesLit:
;	stopifitemflagset
;	checkmemoryeq wNumTorchesLit, $02
;	orroomflag $80
;	playsound SND_SOLVEPUZZLE
;	createpuff
;	wait 15
;	settilehere $46
;	scriptend


; Spawn the moving platform in the room with 2 buttons when the right one is pressed.
spiritsGraveScript_spawnMovingPlatform:
	checkflagset 1, wActiveTriggers
	setcoords $48, $78
	asm15 objectCreatePuff
	setcoords $58, $78
	asm15 objectCreatePuff
	setcoords $68, $78
	asm15 objectCreatePuff
	wait 30
	spawninteraction INTERAC_MOVING_PLATFORM, $0a, $58, $78
	playsound SND_SOLVEPUZZLE
	scriptend

cornersCaveScript_spawnMovingPlatform:
	jumpifroomflagset ROOMFLAG_40, _spawnPlatform
	checkflagset 4, wActiveTriggers
	orroomflag ROOMFLAG_40
_spawnPlatform:
	settileat $6a TILEINDEX_PRESSED_BUTTON
	setcoords $68 $78
	asm15 objectCreatePuff
	setcoords $68 $88
	asm15 objectCreatePuff
	wait 30
	spawninteraction INTERAC_MOVING_PLATFORM, $03, $68, $80
	playsound SND_SOLVEPUZZLE
	scriptend

cornersCaveScript_minecartRoom:
/*
	stopifroomflag80set
	setcollisionradii $06 $06
	checkcollidedwithlink_ignorez

	settileat $36 $5e
	settileat $76 $5e
	checknoenemies
	playsound SND_SOLVEPUZZLE

	orroomflag ROOMFLAG_80
	settileat $76 $5c
	scriptend
*/
;	checkflagset $01, wActiveTriggers
;	setcoords $48, $78
;	asm15 objectCreatePuff
;	setcoords $58, $78
;	asm15 objectCreatePuff
;	wait 30
;	spawninteraction INTERAC_MOVING_PLATFORM, $09, $50, $78
;	playsound SND_SOLVEPUZZLE
;	scriptend

cornersCaveScript_bossRoom:
	jumpifroomflagset ROOMFLAG_80 @setTiles
	checkobjectbyteeq Enemy.state $0e	;end of fight, stunned
@setTiles:
	setcoords $38 $78
	createpuff
	settilehere TILEINDEX_STANDARD_FLOOR
	setcoords $58 $38
	createpuff
	settilehere TILEINDEX_STANDARD_FLOOR
	setcoords $78 $78
	createpuff
	settilehere TILEINDEX_STANDARD_FLOOR
	setcoords $58 $b8
	createpuff
	settilehere TILEINDEX_STANDARD_FLOOR
	scriptend


spiritsGraveScript_spawnBracelet:
	stopifitemflagset
	spawnitem TREASURE_BRACELET, $00
	scriptend

spiritsGraveScript_respawnPots:
	checkflagset 7, wActiveTriggers
	disableinput
	wait 30
	asm15 scriptHelp.spiritsGraveScript_respawnPots
	enableinput
	wait 255
	scriptjump spiritsGraveScript_respawnPots
	scriptend

; Create the miniboss portal when it's killed.
dungeonScript_minibossDeath:
	stopifroomflag80set
	checknoenemies
	orroomflag $80
	wait 20
	spawninteraction INTERAC_MINIBOSS_PORTAL, $00, $00, $00
	scriptjump enableLinkAndMenu

seasonsShrineScript_minibossDeath:
	stopifroomflag80set
	checknoenemies
	asm15 scriptHelp.seasonsShrine_minibossDeath
	wait 20
	spawninteraction INTERAC_MINIBOSS_PORTAL, $00, $00, $00

enableLinkAndMenu:
	writememory wDisableLinkCollisionsAndMenu, $00
	scriptend

; Spawn a heart container when the boss is killed.
dungeonScript_bossDeath:
	jumpifroomflagset $80, ++
	checknoenemies
	orroomflag $80
++
	stopifitemflagset
	setcoords $58, $78

spawnHeartContainer2:
	asm15 scriptHelp.spawnBossItem
	scriptjump enableLinkAndMenu

wingDungeonScript_bossDeath:
;	jumpifroomflagset $80, @spawnHeart
;	checknoenemies
;	orroomflag $80

	; Create staircase tiles
;	setcoords $a8, $48
;	createpuff
;	settilehere $19
;	setcoords $a8, $a8
;	createpuff
;	settilehere $19

; @spawnHeart:
; 	stopifitemflagset
; 	setcoords $98, $78
; 	scriptjump spawnHeartContainer2


; Spawn stairs to the bracelet room when the two torches are lit.
spiritsGraveScript_stairsToBraceletRoom:
	stopifroomflag40set
; lightable torches already spawned
	checkmemoryeq wNumTorchesLit, $04
	playsound SND_SOLVEPUZZLE
	disableinput
	wait 60
	asm15 setCameraFocusedObject
	wait 45
	asm15 objectCreatePuff
	settilehere TILEINDEX_INDOOR_UPSTAIRCASE
	wait 30
	setcoords $88, $28
	wait 90
	asm15 objectCreatePuff
	settilehere TILEINDEX_INDOOR_UPSTAIRCASE
	wait 60
	asm15 setCameraFocusedObjectToLink
	orroomflag ROOMFLAG_40
	asm15 scriptHelp.tokayTempleSetRoomflag40
	enableinput
	scriptend

tokayTempleScript_gloveRoom:
	stopifitemflagset
	checkmemoryeq wActiveTriggers, $0f
	playsound SND_SOLVEPUZZLE
	spawnitem TREASURE_BRACELET $05
	scriptend

wingDungeonScript_spawnFeather:
;	stopifitemflagset
;	spawnitem TREASURE_FEATHER, $00
;	scriptend

spawn80Rupees:
	stopifitemflagset
	spawnitem TREASURE_RUPEES, $19
	scriptend

spawnHeartPiece:
	stopifitemflagset
	jumpifobjectbyteeq Interaction.var03 $01 spawnHeartContainer
	spawnitem TREASURE_HEART_PIECE, $00
	scriptend

spawnHeartContainer:
	spawnitem TREASURE_HEART_CONTAINER, $00
	scriptend

swordAndShieldMazeScript_armosBlockingStairs:
	stopifroomflag80set
	writeobjectbyte Interaction.direction, 150

@checkIfWillMove:
	asm15 scriptHelp.D8armosCheckIfWillMove
	jumptable_objectbyte Interaction.angle		;$49
	.dw @checkIfWillMove
	.dw stubScript


moonlitGrottoScript_spawnChestWhen2TorchesLit:
;	stopifitemflagset
;	checkmemoryeq wNumTorchesLit, $02
;	scriptjump _spawnChestAfterPuff

;the room with the torches, after entrance in spring
seasonsShrineScript_stairsToWinter:
	jumpifroomflagset $80 @spawnDungeonStuffInteraction
	asm15 scriptHelp.makeTorchesLightable
	checkmemoryeq wNumTorchesLit, $02
	asm15 scriptHelp.seasonsShrineScriptHelper_stairsToWinter
@spawnDungeonStuffInteraction:
	settileat $55 $09
	settileat $59 $09
	spawninteraction $12 $04 $00 $00
	scriptend

seasonsShrineScript_bossKeyRoom:
	stopifitemflagset
	checkmemoryeq wActiveTriggers, $f0
	playsound SND_SOLVEPUZZLE
	createpuff
	settilehere $f1
	scriptend

seasonsShrineScript_bossKeyRoom2:
	stopifitemflagset
	asm15 scriptHelp.makeTorchesLightable
	checkmemoryeq wNumTorchesLit, $01
	jumpifroomflagset ROOMFLAG_40 @checkSecondTorch

@checkFirstTorch:
	asm15 scriptHelp.seasonsShrineScript_bossKeyRoom2_bridge1
	orroomflag ROOMFLAG_40
	checkmemoryeq wNumTorchesLit, $02

@checkSecondTorch:
	asm15 scriptHelp.seasonsShrineScript_bossKeyRoom2_bridge2
	orroomflag ROOMFLAG_80
	scriptend





; The room with the moving platform and an orb to hit
skullDungeonScript_spawnChestWhenOrb0Hit:
	stopifitemflagset
	checkflagset $00, wToggleBlocksState
	scriptjump spawnChestAfterPuff

; The room with an orb that's being blocked by a moldorm
skullDungeonScript_spawnChestWhenOrb1Hit:
	stopifitemflagset
	checkflagset $01, wToggleBlocksState
	scriptjump spawnChestAfterPuff


; The room with 3 eyeball-statue things that need to be hit with a seed shooter
crownDungeonScript_spawnChestWhen3TriggersActive:
;	stopifitemflagset
;	checkmemoryeq wActiveTriggers, $07
;	scriptjump spawnChestAfterPuff


mermaidsCaveScript_spawnBridgeWhenOrbHit:
;	stopifroomflag40set
;	checkflagset $00, wToggleBlocksState
;	asm15 scriptHelp.mermaidsCave_spawnBridge_room38
;	scriptend

mermaidsCaveScript_updateTrigger2BasedOnTriggers0And1:
;	wait 1
;	asm15 scriptHelp.setTrigger2IfTriggers0And1Set
;	scriptjump mermaidsCaveScript_updateTrigger2BasedOnTriggers0And1


; Creates a stair tile facing south when trigger 0 is activated
ancientTombScript_spawnSouthStairsWhenTrigger0Active:
;	stopifroomflag40set
;	checkmemoryeq wActiveTriggers, $01
;	settilehere $50

ancientTombScript_finishMakingStairs:
;	orroomflag $40
;	asm15 objectCreatePuff
;	playsound SND_SOLVEPUZZLE
;	scriptend

; Creates a stair tile facing north when trigger 0 is activated
ancientTombScript_spawnNorthStairsWhenTrigger0Active:
;	stopifroomflag40set
;	checkmemoryeq wActiveTriggers, $01
;	settilehere $52
;	scriptjump ancientTombScript_finishMakingStairs


ancientTombScript_retractWallWhenTrigger0Active:
	stopifroomflag40set
	checkflagset 0, wActiveTriggers
	disableinput
	wait 30
	asm15 scriptHelp.ancientTomb_startWallRetractionCutscene
	scriptend


ancientTombScript_spawnDownStairsWhenEnemiesKilled:
;	stopifroomflag80set
;	wait 30
;	checknoenemies
;	playsound SND_SOLVEPUZZLE
;	asm15 objectCreatePuff
;	settilehere $45
;	orroomflag $80
;	scriptend


ancientTombScript_spawnVerticalBridgeWhenTorchLit:
;	checkmemoryeq wNumTorchesLit, $01
;	settilehere $6a
;	playsound SND_SOLVEPUZZLE
;	createpuff
;	scriptend



herosCaveScript_spawnChestWhen4TriggersActive:
;	stopifitemflagset
;	checkmemoryeq wActiveTriggers, $0f
;	scriptjump spawnChestAfterPuff

herosCaveScript_spawnBridgeWhenTriggerPressed:
;	stopifroomflag40set
;	checkflagset $01, wActiveTriggers
;	asm15 scriptHelp.herosCave_spawnBridge_roomc9
;	scriptend

herosCaveScript_spawnNorthStairsWhenEnemiesKilled:
;	stopifitemflagset
;	checknoenemies
;	settilehere $52
;	playsound SND_SOLVEPUZZLE
;	scriptend



moonlitGrottoScript_brokeCrystal:
	disableinput
	wait 30
	playsound SNDCTRL_STOPSFX
	shakescreen 180
	playsound SND_RUMBLE2
	wait 180
	showtext TX_1200
	orroomflag $40
	setstate $ff

moonlitGrottoScript_brokeAllCrystals:
	wait 30
	shakescreen 100
	playsound SND_BIG_EXPLOSION
	wait 90
	playsound SND_SOLVEPUZZLE
	wait 30
	showtext TX_1201
	setglobalflag GLOBALFLAG_D3_CRYSTALS
	enableinput
	asm15 scriptHelp.moonlitGrotto_enableControlAfterBreakingCrystal
	scriptend
