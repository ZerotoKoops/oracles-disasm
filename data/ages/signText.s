; Data format:
;
;   b0: Position ($YX)
;   b1: Room index
;   b2: Text to show (always TX_2eXX)

signTextGroupTable:
	.dw signTextGroup0Data
	.dw signTextGroup1Data
	.dw signTextGroup2Data
	.dw signTextGroup3Data
	.dw signTextGroup4Data
	.dw signTextGroup5Data
	.dw signTextGroup6Data
	.dw signTextGroup7Data

;YX, Room, Text with High byte of $2e
signTextGroup0Data:
	.db $53, <ROOM_AGES_024, <TX_2e01 ; Link's house
	.db $37, <ROOM_AGES_014, <TX_2e02 ; directions,east in village
	.db $41, <ROOM_AGES_015, <TX_2e04 ; directions,back to village
	.db $26, <ROOM_AGES_012, <TX_2e0c ; directions,west to village
	.db $41, <ROOM_AGES_022, <TX_2e0d ; directions,to falls
	.db $21, <ROOM_AGES_001, <TX_2e0e ; D1 entrance (present)
	.db $46, <ROOM_AGES_043, <TX_2e0f ; to mountains (& $10 to desert)
	.db $57, <ROOM_AGES_075, <TX_2e09 ; To deeper woods, six spirits
	.db $13, <ROOM_AGES_036, <TX_2e0a ; To hedges, sword on snow
	.db $48, <ROOM_AGES_084, <TX_2e14 ; Summer roof
	.db $48, <ROOM_AGES_085, <TX_2e15 ; Autumn roof
	.db $48, <ROOM_AGES_086, <TX_2e16 ; Winter roof
	.db $48, <ROOM_AGES_087, <TX_2e17 ; Spring roof
	.db $26, <ROOM_AGES_033, <TX_2e1a ; hint about bombable wall
	.db $35, $2a, <TX_2e25
	.db $00

signTextGroup1Data:
	.db $14, <ROOM_AGES_110, <TX_2e07 ; Ruptured Mine 1
	.db $28, <ROOM_AGES_102, <TX_2e08 ; Ruptured Mine 2
	.db $51, <ROOM_AGES_112, <TX_2e18 ; Gale seed tree house
	.db $48, <ROOM_AGES_130, <TX_2e13 ; Syrup's House
	.db $31, <ROOM_AGES_172, <TX_2e0b ; right of tree, near Labrynth entrance
	.db $51, <ROOM_AGES_111, <TX_2e12 ; fairy fountain
	.db $00

signTextGroup2Data:
	.db $53, <ROOM_AGES_224, <TX_2e01 ; Link's house
	.db $37, <ROOM_AGES_214, <TX_2e1b ; Credits
	.db $43, <ROOM_AGES_23d, <TX_2e1c ; Goron cave
	.db $00

signTextGroup3Data:
	.db $15 $78 $05
	.db $14 $49 $06
	.db $35, <ROOM_AGES_01c, <TX_2e1b ; Credits
	.db $00

signTextGroup4Data:
	;.db $67 $7e $11
	.db $72, <ROOM_AGES_447, <TX_2e11 ; Slingshot hint
	.db $8c, <ROOM_AGES_471, <TX_2e21 ; Armos hint
	.db $62, <ROOM_AGES_441, <TX_2e22 ; Cane companion hint
	.db $77, <ROOM_AGES_43d, <TX_2e22 ; Cane companion hint
	.db $7c, <ROOM_AGES_422, <TX_2e23 ; Path hint in Grotto
	.db $31, <ROOM_AGES_46a, <TX_2e24 ; Soimaria Block hint
	.db $00

signTextGroup5Data:
	.db $77 $2c $03
	.db $53, <ROOM_AGES_5fc, <TX_2e19 ; return to plain

signTextGroup6Data:
signTextGroup7Data:
	.db $00
