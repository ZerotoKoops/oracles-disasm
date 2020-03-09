; Note: the tiles listed here may not apply for all areas.
; TODO: Rename "up/down/left/right" to "north/south/east/west" (the distinction between
; "up" and "north" is useful)
; TODO: Figure out differences between ages and seasons, and categorize better based on
; area type (outdoors / indoors / cave / dungeon).

; Tiles in normal areas

.define TILEINDEX_00			$00 ; Out-of-bounds tile (also used by vine sprout?)
.define TILEINDEX_GRAVE_STATIONARY	$02 ; Overworld only
.define TILEINDEX_UNLIT_TORCH		$08
.define TILEINDEX_LIT_TORCH		$09
.define TILEINDEX_OVERWORLD_SWITCH_OFF	$9e ; Overworld oldy
.define TILEINDEX_OVERWORLD_SWITCH_ON	$9f ; Overworld oldy
.define TILEINDEX_MOVING_POT		$10
.define TILEINDEX_OVERWORLD_DUG_DIRT	$1c ; Overworld only
.define TILEINDEX_HORIZONTAL_BRIDGE_TOP		$1d ; Overworld only
.define TILEINDEX_HORIZONTAL_BRIDGE_BOTTOM	$1e ; Overworld only
.define TILEINDEX_OVERWORLD_STANDARD_GROUND	$3a ; Overworld only
.define TILEINDEX_WARP_HOLE		$48 ; Dungeons/indoors; activates a warp to another room
.define TILEINDEX_CONVEYOR_UP		$54
.define TILEINDEX_CONVEYOR_RIGHT	$55
.define TILEINDEX_CONVEYOR_DOWN		$56
.define TILEINDEX_CONVEYOR_LEFT		$57
.define TILEINDEX_TRACK_TL		$59
.define TILEINDEX_TRACK_BR		$5a
.define TILEINDEX_TRACK_BL		$5b
.define TILEINDEX_TRACK_TR		$5c
.define TILEINDEX_TRACK_HORIZONTAL	$5d
.define TILEINDEX_TRACK_VERTICAL	$5e
.define TILEINDEX_MINECART_PLATFORM	$5f
.define TILEINDEX_MYSTICAL_TREE_TL	$6e
.define TILEINDEX_MINECART_DOOR_UP	$7c
.define TILEINDEX_MINECART_DOOR_RIGHT	$7d
.define TILEINDEX_MINECART_DOOR_DOWN	$7e
.define TILEINDEX_MINECART_DOOR_LEFT	$7f
.define TILEINDEX_RED_FLOOR		$9d
.define TILEINDEX_YELLOW_FLOOR		$9e
.define TILEINDEX_BLUE_FLOOR		$9f
.define TILEINDEX_OVERWORLD_LIT_TORCH	$a1 ; overworld only (might only be used in seasons?)
.define TILEINDEX_OVERWORLD_ROCK	$c0 ; outdoors only
.define TILEINDEX_OVERWORLD_BUSH	$c5 ; outdoors only
.define TILEINDEX_STAIRS		$d0 ; overworld only
.define TILEINDEX_VINE_TOP		$d4
.define TILEINDEX_VINE_MIDDLE		$d5
.define TILEINDEX_VINE_BOTTOM		$d6
.define TILEINDEX_PORTAL_SPOT		$d7
.define TILEINDEX_GRAVE_HIDING_DOOR	$d9
.define TILEINDEX_SOMARIA_BLOCK		$da
.define TILEINDEX_SWITCH_DIAMOND	$db
.define TILEINDEX_OVERWORLD_DOWNSTAIRCASE	$dc ; overworld only
.define TILEINDEX_CURRENT_UP		$e0
.define TILEINDEX_CURRENT_DOWN		$e1
.define TILEINDEX_CURRENT_LEFT		$e2
.define TILEINDEX_CURRENT_RIGHT		$e3
.define TILEINDEX_OVERWORLD_LAVA_1	$e4 ; overworld only
.define TILEINDEX_WHIRLPOOL		$e9
.define TILEINDEX_DUNGEON_DOOR_1	$ee ; overworld only
.define TILEINDEX_DUNGEON_DOOR_2	$ef ; overworld only
.define TILEINDEX_CHEST_OPENED		$f0
.define TILEINDEX_CHEST			$f1
.define TILEINDEX_SIGN			$f2
.define TILEINDEX_HOLE			$f3
.define TILEINDEX_SOFT_SOIL_PLANTED	$f5
.define TILEINDEX_GRASS			$f8
.define TILEINDEX_FD			$fd ; Ricky checks this? (Considered water?)
.define TILEINDEX_WATERFALL_BOTTOM	$fe
.define TILEINDEX_WATERFALL		$ff

.define TILEINDEX_DRIED_LAVA		$01 ; dungeons only(?)
.define TILEINDEX_RESPAWNING_BUSH_CUT	$02 ; dungeons, indoor areas
.define TILEINDEX_RESPAWNING_BUSH_REGEN	$03 ; dungeons, indoor areas
.define TILEINDEX_RESPAWNING_BUSH_READY	$04 ; dungeons, indoor areas
.define TILEINDEX_DUNGEON_SWITCH_OFF	$0a ; dungeons, indoor areas
.define TILEINDEX_DUNGEON_SWITCH_ON	$0b ; dungeons, indoor areas
.define TILEINDEX_BUTTON		$0c ; dungeons, indoor areas
.define TILEINDEX_PRESSED_BUTTON	$0d ; dungeons, indoor areas
.define TILEINDEX_RAISABLE_FLOOR_1	$0e ; collision modes 1,2,5
.define TILEINDEX_RAISABLE_FLOOR_2	$0f ; collision modes 1,2,5
.define TILEINDEX_DUNGEON_POT		$10 ; dungeons, indoors
.define TILEINDEX_PUSHABLE_BLOCK	$1d ; dungeons, indoors only
.define TILEINDEX_DUNGEON_BUSH		$20 ; dungeons, indoors only
.define TILEINDEX_PUSHABLE_STATUE	$2a ; dungeons only
.define TILEINDEX_RED_PUSHABLE_BLOCK	$2c ; dungeons only
.define TILEINDEX_YELLOW_PUSHABLE_BLOCK	$2d ; dungeons only
.define TILEINDEX_BLUE_PUSHABLE_BLOCK	$2e ; dungeons only
.define TILEINDEX_INDOOR_UPSTAIRCASE	$44 ; dungeons, indoors only
.define TILEINDEX_INDOOR_DOWNSTAIRCASE	$45 ; dungeons, indoors only
.define TILEINDEX_DUNGEON_DUG_DIRT	$4c ; dungeons, indoors only
.define TILEINDEX_CRACKED_FLOOR		$4d ; dungeons, indoors only
.define TILEINDEX_SOUTH_STAIRS		$50 ; dungeons, indoors only
.define TILEINDEX_WEST_STAIRS		$51 ; dungeons, indoors only
.define TILEINDEX_NORTH_STAIRS		$52 ; dungeons, indoors only
.define TILEINDEX_EAST_STAIRS		$53 ; dungeons, indoors only
.define TILEINDEX_SPIKES		$60 ; dungeons, indoors only

; This tile and 3 after it ($61-$64) are assumed to all be lava tiles.
.define TILEINDEX_DUNGEON_LAVA_1	$61 ; dungeons only(?)

.define TILEINDEX_VERTICAL_BRIDGE	$6a ; dungeons/indoors only
.define TILEINDEX_VERTICAL_BRIDGE_DOWN	$6b ; dungeons/indoors only (bridge with top half missing)
.define TILEINDEX_VERTICAL_BRIDGE_UP	$6c ; dungeons/indoors only (bridge with lower half missing)
.define TILEINDEX_HORIZONTAL_BRIDGE	$6d ; dungeons/indoors only
.define TILEINDEX_HORIZONTAL_BRIDGE_LEFT	$6e ; dungeons/indoors only
.define TILEINDEX_HORIZONTAL_BRIDGE_RIGHT	$6f ; dungeons/indoors only
.define TILEINDEX_STANDARD_FLOOR	$a0 ; Keyblocks and such will turn into this tile
.define TILEINDEX_DUNGEON_a3		$a3 ; dungeons, indoors only
.define TILEINDEX_RED_TOGGLE_FLOOR	$ad ; dungeons only
.define TILEINDEX_YELLOW_TOGGLE_FLOOR	$ae ; dungeons only
.define TILEINDEX_BLUE_TOGGLE_FLOOR	$af ; dungeons only

; Used by INTERACID_LEVER_LAVA_FILLER. (Range of $0c tiles starting from $c3 is assumed to be of
; this type.)
.define TILEINDEX_LAVA_SOURCE_UP_LEFT		$c3 ; dungeons only
.define TILEINDEX_LAVA_SOURCE_DOWN_LEFT		$c6 ; dungeons only
.define TILEINDEX_LAVA_SOURCE_UP_LEFT_EMPTY	$c9 ; dungeons only
.define TILEINDEX_LAVA_SOURCE_DOWN_LEFT_EMPTY	$cc ; dungeons only

.define TILEINDEX_EYE_STATUE		$ee ; dungeon only (eyeballs spawn on these)
.define TILEINDEX_BLANK_HOLE		$f4 ; dungeons / indoors only

; $d4-$d7 are filled slate tiles in ages D8
.define TILEINDEX_FILLED_SLATE_1	$d4

.define TILEINDEX_INDOOR_DOOR		$af ; indoors only

.ifdef ROM_AGES
	.define TILEINDEX_RAISED_FLOOR_1	$0e
	.define TILEINDEX_LOWERED_FLOOR_1	$0f
	.define TILEINDEX_RAISED_FLOOR_2	$28
	.define TILEINDEX_LOWERED_FLOOR_2	$29

	.define TILEINDEX_GASHA_TREE_TL		$4e
	.define TILEINDEX_SOFT_SOIL		$d2

	; Fish can swim in any tile from TILEINDEX_PUDDLE to TILEINDEX_FD
	.define TILEINDEX_PUDDLE		$f9
	.define TILEINDEX_WATER			$fa

.else ; ROM_SEASONS
	.define TILEINDEX_STUMP		$20

	.define TILEINDEX_GASHA_TREE_TL		$75
	.define TILEINDEX_SOFT_SOIL		$e0
	.define TILEINDEX_OPEN_CAVE_DOOR	$e8 ; overworld / subrosia

	; For seasons, $f8-$f9 count as grass, $fa-$fc count as puddles
	.define TILEINDEX_PUDDLE	$fa
	.define TILEINDEX_WATER		$fd
.endif

.define TILEINDEX_DEEP_WATER		$fc

; Tiles in sidescrolling areas
.define TILEINDEX_SS_EMPTY		$01
.define TILEINDEX_SS_SPIKE		$02
.define TILEINDEX_SS_LADDER		$18
.define TILEINDEX_SS_52			$52

