m_section_free chestData NAMESPACE chestData

; m_ChestData macro takes 3 parameters:
;   1: Y/X position of chest (byte); an opened chest tile will be placed here when the room is
;      loaded, if ROOMFLAG_ITEM has been set in that room.
;   2: Low byte of room index
;   3: Treasure object to get from the chest (see "data/{game}/treasureObjectData.s")

chestDataGroupTable:
	.dw chestGroup0Data
	.dw chestGroup1Data
	.dw chestGroup2Data
	.dw chestGroup3Data
	.dw chestGroup4Data
	.dw chestGroup5Data
	.dw chestGroup6Data
	.dw chestGroup7Data

chestGroup0Data:
	m_ChestData $18, $4f, TREASURE_OBJECT_POTION_01
	m_ChestData $27 $27 $280a
	m_ChestData $12 $08 $2e02
	m_ChestData $53 $60 $4b00
	m_ChestData $31 $61 $4b00
	m_ChestData $12 $70 $4b00
	m_ChestData $43 $40 $4b00
	m_ChestData $27 $51 $4b00
	m_ChestData $51 $49 $2804
	m_ChestData $36 $84 $2805
	m_ChestData $35, <ROOM_AGES_091, $2d21
	.db $ff

chestGroup1Data:
	m_ChestData $18, $1f, TREASURE_OBJECT_POTION_01
	.db $ff

chestGroup2Data:
	m_ChestData $15, $f7, TREASURE_OBJECT_POTION_01
	m_ChestData $14, $1d, TREASURE_OBJECT_BIGGORON_SWORD_01
	m_ChestData $15 $2a $2b01
	m_ChestData $12 $29 $4b00
	m_ChestData $14 $af $2b01
	m_ChestData $45 $be $280d
	m_ChestData $22 $fc $2806
	m_ChestData $15 $ce $3401
	m_ChestData $34 $ec $2d19
	m_ChestData $34 $f4 $2d19
	m_ChestData $14, <ROOM_AGES_2c0, $3401
	.db $ff

chestGroup3Data:
	m_ChestData $35, $e8, TREASURE_OBJECT_POTION_01
	m_ChestData $35 $0d $1500
	m_ChestData $14 $1a TREASURE_OBJECT_BOMB_UPGRADE_01
	m_ChestData $14 $48 $2818
	m_ChestData $18 $2b $2804
	m_ChestData $24 $3b $3a00
	m_ChestData $35, <ROOM_AGES_3ff, TREASURE_OBJECT_POTION_01
	.db $ff

chestGroup4Data:
	m_ChestData $6d $63 $3003
	m_ChestData $81 $37 $2b01
	m_ChestData $1d $76 $4b00
	m_ChestData $52 $7a $3302
	m_ChestData $11 $75 $3202
	m_ChestData $27 $7b $4b00
	m_ChestData $55 $73 $3103
	m_ChestData $33 $6c $3003
	m_ChestData $1a $16 $3003
	m_ChestData $35 $20 $3302
	m_ChestData $76 $1b $2b01
	m_ChestData $57 ,<ROOM_AGES_412, $3003
	m_ChestData $63 $1d $3103
	m_ChestData $17 $23 $3003
	m_ChestData $47 $22 $3003
	m_ChestData $87 $3e $3302
	m_ChestData $57 $67 $3202
	m_ChestData $58 $45 $3003
	m_ChestData $46 $5c $3003
	m_ChestData $55 $6a $4502
	m_ChestData $57 $4f $3103
	m_ChestData $3b $7e $2b01
	m_ChestData $52 $34 $4300
	m_ChestData $1d $5d $0300
	m_ChestData $57 $4b $4105
	m_ChestData $31 $3d $3003
	m_ChestData $27 $11 $4100
	m_ChestData $57, <ROOM_AGES_408, $3003
	m_ChestData $72 $15 $3202
	m_ChestData $47 $30 $0400
	m_ChestData $87 $40 $3302
	m_ChestData $3d $41 $3003
	m_ChestData $69 $56 $3202
	m_ChestData $57 $60 $2805
	.db $ff

chestGroup5Data:
	m_ChestData $24 $08 $2b01
	m_ChestData $24 $fe $2804
	m_ChestData $12 $fd $3b00
	m_ChestData $8a $fc $2b01
	m_ChestData $11 $67 $2b01
	m_ChestData $75 $cf $3901
	m_ChestData $42 $12 $2b01
	m_ChestData $43 $24 $280b
	m_ChestData $58 $3e $3003
	m_ChestData $2b $61 $280a
	m_ChestData $17 $37 $3103
	m_ChestData $17 $13 $3003
	m_ChestData $37 $2f $3302
	m_ChestData $12 $2b $3003
	m_ChestData $82 $33 $3202
	m_ChestData $17 $57 $3103
	m_ChestData $8d $69 $3302
	m_ChestData $6b $51 $3003
	m_ChestData $17 $60 TREASURE_OBJECT_BOOMERANG_03
	m_ChestData $12 $63 $3003
	m_ChestData $6c $66 $2809
	m_ChestData $2a $56 $3001
	m_ChestData $72 $52 $3202
	m_ChestData $27 $b7 $0507
	m_ChestData $3b, <ROOM_AGES_5bc $3202
	m_ChestData $5b $d4 $3302
	m_ChestData $27 $be $3003
	m_ChestData $3d $bd $3003
	m_ChestData $57 $b0 $3003
	m_ChestData $17 $2c TREASURE_OBJECT_FEATHER_04
	m_ChestData $57, <ROOM_AGES_545 $3401
	m_ChestData $41 $6c $3003
	m_ChestData $6c $72 $3003
	m_ChestData $27 $b5 $0104
	m_ChestData $1c $b9 $3103
	m_ChestData $15 $ee $3401
	m_ChestData $15 $dd $0300
	m_ChestData $81, <ROOM_AGES_5c0 $2804
	m_ChestData $24, <ROOM_AGES_5c0 $2804
	m_ChestData $83 $e1 $2805
	m_ChestData $22 $e0 $3401
chestGroup6Data:
	m_ChestData $00, $10, TREASURE_OBJECT_BRACELET_00
	.db $ff

chestGroup7Data:
	m_ChestData $8a, $fc, TREASURE_OBJECT_HEART_PIECE_01
	.db $ff

.ends
