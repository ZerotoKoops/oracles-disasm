; The data in this file specifies which rooms contain warps. For the destination, they have a
; "destination index" which refers to data in "data/{game}/warpDestinations.s".
;
; There are a couple of macros used here. For m_StandardWarp:
;
;   Param 1: half-byte
;     If 0, warp applies to the whole screen. Otherwise it's a "screen-edge" warp applying to one of
;     the four corners of the screen, depending which bits are set.
;     bit 0 = top-left, bit 1 = top-right, bit 2 = bottom-left, bit 3 = bottom-right.
;
;   Param 2: byte
;     The room index this warp source is in. (The group is implicitly known already based on which
;     table it's in.)
;
;   Param 3: byte
;     Warp Dest Index. Along with the Warp Dest Group, this is an index for the warp destination to
;     use (data/{game}/warpDestinations.s).
;
;   Param 4: half-byte
;     Warp Dest Group. Determines the map group to be warped to. Goes with Warp Dest Index above.
;
;   Param 5: half-byte
;     Transition source type. See constants/common/transitions.s.
;
; For m_PointerWarp, 1st param is the room index, 2nd param is a pointer to data for that room. Used
; for rooms with multiple warps.
;
; For m_PositionWarp, it's basically the same as m_StandardWarp, except it's missing the 1st
; parameter, and the 2nd parameter becomes the YX position instead of the room index. This can only
; be used in conjunction with m_PointerWarp (it points to the list of m_PositionWarp entries).
;
; There are three ways to end the warp lists:
;
;   m_WarpListEndWithDefault specifies that if no warp was found, the last entry is used as a default.
;
;   m_WarpListEndNoDefault specifies that if no warp was found, some fallback code should be run
;   instead. This fallback code only exists in Ages, which can handle staircases in dungeons without
;   any warp data being explicitly defined for them.
;
;   m_WarpListFallThrough doesn't actually end the list. It's used in places where the devs appear
;   to have forgotten to use their equivalent of one of the two end commands above.

warpSourcesTable:
	.dw group0WarpSources
	.dw group1WarpSources
	.dw group2WarpSources
	.dw group3WarpSources
	.dw group4WarpSources
	.dw group5WarpSources
	.dw group6WarpSources
	.dw group7WarpSources

group0WarpSources:
	m_StandardWarp $1 $48 $07 $0 $3
	m_StandardWarp $2 $48 $07 $0 $3
	m_PointerWarp     $48 warpSource4ab5
	m_PointerWarp     $8d warpSource4ac5
	m_StandardWarp $0 $ba $04 $4 $4
	m_PointerWarp     $0a warpSource4a79
	m_StandardWarp $0 $02 $01 $2 $4
	m_StandardWarp $0 $14 $36 $3 $4
	m_PointerWarp     $09 warpSource4a69
	m_PointerWarp     $0b warpSource4a81
	m_StandardWarp $0 $0c $09 $3 $4
	m_PointerWarp     $1b warpSource4a95
	m_PointerWarp     $1c warpSource4a9d
	m_PointerWarp     $1d warpSource4aa5
	m_StandardWarp $0 $37 $55 $3 $4
	m_PointerWarp     $3d warpSource4aad
	m_StandardWarp $0 $4d $09 $2 $4
	m_StandardWarp $0 $55 $1f $5 $2
	m_StandardWarp $0 $58 $3b $2 $4
	m_StandardWarp $0 $5d $37 $3 $4
	m_StandardWarp $0 $66 $49 $3 $4
	m_PointerWarp     $68 warpSource4abd
	m_StandardWarp $0 $79 $18 $2 $4
	m_StandardWarp $0 $7c $05 $2 $4
	m_StandardWarp $0 $89 $17 $2 $4
	m_StandardWarp $0 $a3 $38 $3 $4
	m_StandardWarp $0 $bd $31 $2 $4
	m_StandardWarp $0 $c5 $27 $3 $4
	m_StandardWarp $0 $cd $29 $2 $4
	m_StandardWarp $0 $da $3a $3 $4
	m_StandardWarp $0 $dd $08 $2 $4
	m_StandardWarp $0 $e0 $14 $2 $4
	m_PointerWarp     $e1 warpSource4acd
	m_StandardWarp $0 $e2 $13 $2 $4
	m_StandardWarp $0 $f1 $3d $5 $4
	m_PointerWarp     $0d warpSource4a8d
	m_StandardWarp $0 $28 $5a $3 $8
	m_StandardWarp $0 $2b $4e $5 $4
	m_StandardWarp $0 $3c $05 $1 $4
	m_StandardWarp $0 $5b $28 $5 $4
	m_StandardWarp $0 $a0 $33 $5 $4
	m_StandardWarp $0 $a5 $3e $5 $4
	m_StandardWarp $0 $24 $43 $3 $4
	m_StandardWarp $0 $44 $47 $3 $4
	m_StandardWarp $0 $56 $54 $5 $4
	m_StandardWarp $0 $03 $69 $5 $4
	m_StandardWarp $0 $00 $39 $2 $2
	m_PointerWarp     $ff warpSource4a65
	m_PointerWarp     $15 warpSource49f5
	m_PointerWarp     $13 warpSource4a59
	m_PointerWarp     $78 warpSource4a51
	m_PointerWarp     $08 warpSource4a4d
	m_StandardWarp $0 $01 $05 $4 $4
	m_StandardWarp $0 $23 $0c $2 $4
	m_StandardWarp $0 $84 $04 $5 $2
	m_StandardWarp $0 $87 $29 $5 $2
	m_StandardWarp $0 $85 $2d $5 $2
	m_StandardWarp $0 $86 $3c $5 $2
	m_PointerWarp     $30 warpSource4a45
	m_PointerWarp     $70 warpSource4a39
	m_PointerWarp     $40 warpSource4a2d
	m_PointerWarp     $3a warpSource4a25
	m_PointerWarp     $60 warpSource4a1d
	m_StandardWarp $0 $63 $15 $2 $4
	m_PointerWarp     $52 warpSource49e5
	m_StandardWarp $0 $73 $5a $4 $2
	m_StandardWarp $0 $33 $5d $4 $4
	m_StandardWarp $0 $20 $5e $4 $2
	m_PointerWarp     $29 warpSource4a11
	m_StandardWarp $0 $12 $5b $4 $2
	m_PointerWarp  $34 group0Room34WarpSources
	m_PointerWarp     $46 warpSource4a09
	m_StandardWarp $0 $88 $85 $5 $4
	m_PointerWarp     $47 warpSource49ed
	m_StandardWarp $0 $76 $7b $5 $2
	m_StandardWarp $0 $35 $5d $3 $4
	m_StandardWarp $0 $17 $4b $3 $4
	m_StandardWarp $0 $27 $35 $5 $2
	m_StandardWarp $0 $07 $05 $5 $4
	m_StandardWarp $0 $16 $1d $5 $2
	m_PointerWarp     $74 warpSource49fd
	m_StandardWarp $0 $65 $53 $5 $2
	m_StandardWarp $0 $51 $58 $2 $4
	m_StandardWarp $0 $10 $1e $2 $4
	m_StandardWarp $0 $05 $5e $3 $2
	m_WarpListEndNoDefault
group0Room34WarpSources:
	m_PositionWarp $11 $7c $5 $4
	m_PositionWarp $35 $8a $0 $4
	m_WarpListEndNoDefault

warpSource49e5:
	m_PositionWarp $33 $3e $2 $4
	m_PositionWarp $07 $54 $2 $4
	m_WarpListEndWithDefault

warpSource49ed:
	m_PositionWarp $07 $58 $3 $4
	m_PositionWarp $56 $7a $5 $2
	m_WarpListEndWithDefault

warpSource49f5:
	m_PositionWarp $11 $37 $5 $4
	m_PositionWarp $02 $56 $3 $4
	m_WarpListEndWithDefault

warpSource49fd:
	m_PositionWarp $25 $34 $3 $4
	m_PositionWarp $13 $54 $3 $4
	m_PositionWarp $31 $20 $5 $4
	m_WarpListEndWithDefault

warpSource4a09:
	m_PositionWarp $67 $84 $5 $2
	m_PositionWarp $02 $3b $3 $4
	m_WarpListEndWithDefault

warpSource4a11:
	m_PositionWarp $52 $51 $2 $8
	m_PositionWarp $25 $1c $5 $4
	m_PositionWarp $26 $1b $5 $4
	m_WarpListEndWithDefault

warpSource4a1d:
	m_PositionWarp $57 $50 $2 $4
	m_PositionWarp $24 $15 $3 $4
	m_WarpListEndWithDefault

warpSource4a25:
	m_PositionWarp $68 $78 $0 $8
	m_PositionWarp $23 $35 $3 $4
	m_WarpListEndWithDefault

warpSource4a2d:
	m_PositionWarp $56 $7a $0 $8
	m_PositionWarp $17 $09 $4 $4
	m_PositionWarp $16 $4e $4 $4
	m_WarpListEndWithDefault

warpSource4a39:
	m_PositionWarp $46 $0a $4 $4
	m_PositionWarp $43 $43 $4 $4
	m_PositionWarp $18 $2e $7 $2
	m_WarpListEndWithDefault

warpSource4a45:
	m_PositionWarp $47 $2d $2 $4
	m_PositionWarp $31 $4f $4 $2
	m_WarpListEndWithDefault

warpSource4a4d:
	m_PositionWarp $27 $5b $3 $8
	m_WarpListEndWithDefault

warpSource4a51:
	m_PositionWarp $51 $2f $5 $2
	m_PositionWarp $58 $69 $0 $8
	m_WarpListEndWithDefault

warpSource4a59:
	m_PositionWarp $33 $0b $2 $4
	m_PositionWarp $15 $33 $2 $2
	m_PositionWarp $37 $00 $2 $4
	m_WarpListEndWithDefault

warpSource4a65:
	m_PositionWarp $00 $00 $0 $0
	m_WarpListFallThrough

warpSource4a69:
	m_PositionWarp $44 $19 $2 $4
	m_PositionWarp $46 $1a $2 $4
	m_PositionWarp $37 $46 $5 $4
	m_PositionWarp $43 $00 $7 $4
	m_WarpListEndWithDefault

warpSource4a79:
	m_PositionWarp $12 $23 $2 $4
	m_PositionWarp $18 $06 $4 $4
	m_WarpListEndWithDefault

warpSource4a81:
	m_PositionWarp $27 $40 $2 $4
	m_PositionWarp $43 $43 $2 $4
	m_PositionWarp $41 $47 $5 $4
	m_WarpListEndWithDefault

warpSource4a8d:
	m_PositionWarp $42 $58 $5 $4
	m_PositionWarp $45 $59 $5 $4
	m_WarpListEndWithDefault

warpSource4a95:
	m_PositionWarp $08 $45 $2 $4
	m_PositionWarp $36 $0d $3 $4
	m_WarpListEndWithDefault

warpSource4a9d:
	m_PositionWarp $43 $04 $3 $4
	m_PositionWarp $37 $12 $3 $4
	m_WarpListEndWithDefault

warpSource4aa5:
	m_PositionWarp $13 $45 $5 $4
	m_PositionWarp $27 $11 $3 $4
	m_WarpListEndWithDefault

warpSource4aad:
	m_PositionWarp $27 $48 $2 $4
	m_PositionWarp $13 $10 $3 $4
	m_WarpListEndWithDefault

warpSource4ab5:
	m_PositionWarp $21 $00 $4 $4
	m_PositionWarp $28 $07 $4 $4
	m_WarpListEndWithDefault

warpSource4abd:
	m_PositionWarp $18 $65 $0 $8
	m_PositionWarp $11 $03 $3 $4
	m_WarpListFallThrough

warpSource4ac5:
	m_PositionWarp $26 $02 $4 $4
	m_PositionWarp $61 $66 $5 $4
	m_WarpListEndWithDefault

warpSource4acd:
	m_PositionWarp $26 $10 $2 $4
	m_PositionWarp $53 $11 $2 $4
	m_WarpListEndWithDefault

group1WarpSources:
	m_StandardWarp $0 $48 $01 $4 $4
	m_StandardWarp $0 $83 $03 $4 $4
	m_StandardWarp $0 $5c $02 $5 $4
	m_StandardWarp $1 $48 $04 $1 $3
	m_StandardWarp $2 $48 $04 $1 $3
	m_StandardWarp $0 $0e $00 $5 $4
	m_StandardWarp $4 $0e $2a $0 $3
	m_StandardWarp $0 $02 $51 $4 $4
	m_StandardWarp $0 $05 $3f $5 $4
	m_StandardWarp $0 $06 $41 $5 $4
	m_StandardWarp $0 $07 $43 $5 $4
	m_StandardWarp $0 $09 $62 $5 $4
	m_PointerWarp     $0b warpSource4c41
	m_StandardWarp $0 $0c $0b $3 $4
	m_StandardWarp $0 $0d $47 $2 $4
	m_StandardWarp $0 $04 $14 $3 $4
	m_PointerWarp     $12 warpSource4c19
	m_StandardWarp $0 $13 $67 $5 $4
	m_StandardWarp $0 $14 $16 $3 $4
	m_StandardWarp $0 $18 $55 $5 $4
	m_StandardWarp $0 $1c $07 $3 $4
	m_StandardWarp $0 $1d $31 $3 $4
	m_StandardWarp $0 $23 $3a $5 $2
	m_StandardWarp $0 $28 $57 $3 $8
	m_StandardWarp $0 $2b $4c $5 $4
	m_StandardWarp $0 $2d $42 $2 $4
	m_StandardWarp $0 $39 $28 $0 $8
	m_PointerWarp     $3c warpSource4c49
	m_StandardWarp $0 $3d $4b $2 $4
	m_StandardWarp $0 $43 $20 $3 $4
	m_StandardWarp $0 $45 $3f $3 $4
	m_StandardWarp $0 $4d $33 $3 $4
	m_StandardWarp $0 $51 $56 $4 $2
	m_StandardWarp $0 $55 $07 $2 $4
	m_StandardWarp $0 $56 $3d $2 $4
	m_StandardWarp $0 $57 $06 $2 $4
	m_PointerWarp     $58 warpSource4c55
	m_StandardWarp $0 $5a $3f $2 $4
	m_StandardWarp $0 $66 $3d $3 $4
	m_PointerWarp     $70 warpSource4c65
	m_StandardWarp $0 $71 $1e $5 $4
	m_StandardWarp $0 $74 $1a $5 $4
	m_StandardWarp $0 $79 $02 $2 $4
	m_StandardWarp $0 $91 $19 $5 $4
	m_StandardWarp $0 $a3 $39 $3 $4
	m_StandardWarp $0 $a5 $57 $5 $4
	m_PointerWarp     $a7 warpSource4c5d
	m_StandardWarp $0 $ad $30 $2 $4
	m_StandardWarp $0 $ba $6b $5 $4
	m_StandardWarp $0 $bb $5b $5 $4
	m_StandardWarp $0 $bc $36 $5 $4
	m_StandardWarp $0 $bd $2c $2 $4
	m_StandardWarp $0 $c5 $28 $3 $4
	m_StandardWarp $0 $cb $34 $5 $4
	m_PointerWarp     $cd warpSource4c6d
	m_StandardWarp $0 $d9 $51 $5 $4
	m_StandardWarp $0 $da $38 $5 $4
	m_StandardWarp $0 $db $39 $5 $4
	m_StandardWarp $0 $dd $6a $5 $4
	m_StandardWarp $0 $27 $48 $1 $2
	m_StandardWarp $0 $e2 $19 $1 $2
	m_StandardWarp $0 $e0 $42 $5 $2
	m_PointerWarp     $78 warpSource4c39
	m_PointerWarp     $68 warpSource4c31
	m_StandardWarp $0 $08 $59 $3 $8
	m_PointerWarp  $50 group1Room50WarpSources
	m_PointerWarp     $62 warpSource4c29
	m_PointerWarp     $33 warpSource4c25
	m_PointerWarp  $30 group1Room30WarpSources
	m_PointerWarp     $20 warpSource4c21
	m_StandardWarp $0 $73 $54 $4 $4
	m_StandardWarp $0 $63 $55 $4 $2
	m_PointerWarp     $40 warpSource4c0d
	m_StandardWarp $0 $10 $60 $4 $2
	m_StandardWarp $0 $03 $64 $4 $2
	m_StandardWarp $0 $31 $22 $3 $4
	m_StandardWarp $0 $5d $32 $2 $4
	m_WarpListEndNoDefault
group1Room50WarpSources:
	m_PositionWarp $06 $37 $2 $4
	m_PositionWarp $01 $5c $2 $4
	m_PositionWarp $02 $5d $2 $4
	m_WarpListEndNoDefault
group1Room30WarpSources:
	m_PositionWarp $37 $5f $3 $4
	m_PositionWarp $31 $5b $2 TRANSITION_SRC_FALL
	m_WarpListEndNoDefault

warpSource4c0d:
	m_PositionWarp $17 $40 $4 $4
	m_PositionWarp $12 $3c $2 $4
	m_PositionWarp $11 $38 $2 $4
	m_WarpListEndWithDefault

warpSource4c19:
	m_PositionWarp $55 $4e $2 $4
	m_PositionWarp $45 $4f $2 $4
	m_WarpListEndWithDefault

warpSource4c21:
	m_PositionWarp $14 $50 $4 $4
	m_WarpListEndWithDefault

warpSource4c25:
	m_PositionWarp $14 $5c $4 $4
	m_WarpListFallThrough

warpSource4c29:
	m_PositionWarp $32 $52 $4 $2
	m_PositionWarp $67 $53 $4 $2
	m_WarpListEndWithDefault

warpSource4c31:
	m_PositionWarp $18 $86 $0 $8
	m_PositionWarp $11 $4c $3 $4
	m_WarpListEndWithDefault

warpSource4c39:
	m_PositionWarp $51 $81 $5 $2
	m_PositionWarp $35 $0c $1 $8
	m_WarpListEndWithDefault

warpSource4c41:
	m_PositionWarp $41 $63 $5 $4
	m_PositionWarp $27 $41 $2 $4
	m_WarpListEndWithDefault

warpSource4c49:
	m_PositionWarp $33 $00 $3 $4
	m_PositionWarp $34 $01 $3 $4
	m_PositionWarp $35 $02 $3 $4
	m_WarpListEndWithDefault

warpSource4c55:
	m_PositionWarp $32 $36 $2 $4
	m_PositionWarp $35 $41 $3 $4
	m_WarpListEndWithDefault

warpSource4c5d:
	m_PositionWarp $24 $03 $2 $4
	m_PositionWarp $26 $04 $2 $4
	m_WarpListEndWithDefault

warpSource4c65:
	m_PositionWarp $43 $45 $4 $4
	m_PositionWarp $07 $53 $2 $4
	m_WarpListEndWithDefault

warpSource4c6d:
	m_PositionWarp $34 $2e $2 $4
	m_PositionWarp $21 $27 $2 $4
	m_WarpListEndWithDefault

group2WarpSources:
	m_StandardWarp $0 $90 $01 $5 $4
	m_StandardWarp $4 $0e $33 $0 $3
	m_StandardWarp $4 $0f $02 $1 $3
	m_StandardWarp $4 $1e $38 $1 $3
	m_StandardWarp $4 $1f $39 $1 $3
	m_StandardWarp $0 $2e $3d $0 $4
	m_StandardWarp $4 $2f $29 $1 $3
	m_StandardWarp $8 $3e $27 $1 $3
	m_StandardWarp $4 $3f $47 $0 $3
	m_StandardWarp $0 $4e $30 $0 $2
	m_StandardWarp $4 $4f $25 $3 $3
	m_StandardWarp $8 $5e $3a $0 $3
	m_StandardWarp $0 $5e $0e $2 $2
	m_PointerWarp     $5f warpSource4df5
	m_StandardWarp $4 $6e $4a $0 $3
	m_StandardWarp $4 $6f $49 $0 $3
	m_StandardWarp $0 $7e $0f $2 $2
	m_StandardWarp $4 $7f $4f $1 $3
	m_StandardWarp $4 $8e $48 $0 $3
	m_StandardWarp $4 $8f $26 $1 $3
	m_StandardWarp $0 $8f $52 $5 $2
	m_StandardWarp $4 $9e $3e $0 $3
	m_StandardWarp $0 $9e $3c $0 $4
	m_StandardWarp $0 $9f $1d $2 $2
	m_StandardWarp $4 $9f $0e $0 $3
	m_StandardWarp $0 $a1 $5d $5 $4
	m_PointerWarp     $ae warpSource4e01
	m_StandardWarp $4 $af $7b $0 $2
	m_PointerWarp     $af warpSource4df1
	m_StandardWarp $0 $b7 $32 $3 $4
	m_StandardWarp $0 $ba $40 $3 $4
	m_StandardWarp $0 $be $03 $7 $2
	m_StandardWarp $4 $bf $12 $0 $3
	m_PointerWarp     $bf warpSource4dd9
	m_StandardWarp $0 $c0 $23 $3 $4
	m_StandardWarp $0 $c1 $2b $3 $4
	m_PointerWarp     $ce warpSource4e09
	m_StandardWarp $4 $cf $45 $0 $3
	m_PointerWarp     $d0 warpSource4e11
	m_StandardWarp $4 $de $3e $1 $3
	m_StandardWarp $4 $df $0b $0 $3
	m_StandardWarp $4 $e3 $41 $1 $3
	m_StandardWarp $0 $e3 $28 $2 $2
	m_StandardWarp $4 $e4 $3a $1 $3
	m_StandardWarp $4 $e5 $43 $0 $3
	m_StandardWarp $8 $e6 $31 $0 $3
	m_StandardWarp $4 $e7 $38 $0 $3
	m_PointerWarp     $e8 warpSource4e19
	m_StandardWarp $4 $e9 $2a $1 $3
	m_StandardWarp $4 $ea $2e $0 $3
	m_StandardWarp $4 $eb $2f $0 $3
	m_StandardWarp $4 $ec $21 $0 $3
	m_StandardWarp $4 $ee $35 $0 $3
	m_StandardWarp $4 $f3 $28 $1 $3
	m_StandardWarp $4 $f4 $24 $0 $3
	m_StandardWarp $4 $f5 $2c $1 $3
	m_StandardWarp $4 $f6 $15 $0 $3
	m_StandardWarp $4 $f7 $0f $1 $3
	m_StandardWarp $4 $f8 $1c $1 $3
	m_StandardWarp $4 $f9 $14 $0 $3
	m_StandardWarp $0 $fa $46 $2 $2
	m_StandardWarp $0 $fb $44 $2 $2
	m_StandardWarp $4 $fb $1c $0 $3
	m_StandardWarp $4 $fc $11 $1 $3
	m_StandardWarp $8 $fd $2c $0 $3
	m_StandardWarp $0 $fd $49 $5 $2
	m_StandardWarp $8 $ff $20 $1 $3
	m_StandardWarp $0 $ff $4b $5 $2
	m_StandardWarp $4 $08 $6b $0 $3
	m_StandardWarp $4 $18 $64 $0 $3
	m_StandardWarp $4 $28 $72 $0 $3
	m_StandardWarp $4 $19 $7c $0 $3
	m_PointerWarp     $19 warpSource4ded
	m_StandardWarp $4 $29 $7d $0 $3
	m_PointerWarp     $29 warpSource4de9
	m_StandardWarp $4 $0a $49 $1 $3
	m_StandardWarp $3 $0a $4a $1 $3
	m_StandardWarp $4 $1a $37 $0 $3
	m_PointerWarp     $1a warpSource4de1
	m_StandardWarp $4 $2a $01 $1 $3
	m_StandardWarp $0 $0c $55 $2 $2
	m_StandardWarp $0 $0b $57 $2 $2
	m_StandardWarp $4 $0d $89 $0 $3
	m_StandardWarp $0 $0d $59 $2 $2
	m_StandardWarp $4 $4a $71 $0 $3
	m_StandardWarp $4 $2b $4d $1 $3
	m_StandardWarp $8 $2c $4c $1 $3
	m_StandardWarp $c $1c $4e $1 $3
	m_StandardWarp $0 $24 $3c $3 $4
	m_StandardWarp $0 $3d $50 $1 TRANSITION_SRC_FADEOUT
	m_WarpListEndNoDefault

warpSource4dd9:
	m_PositionWarp $15 $33 $7 $2
	m_PositionWarp $61 $56 $2 $2
	m_WarpListEndWithDefault

warpSource4de1:
	m_PositionWarp $16 $73 $0 $8
	m_PositionWarp $13 $0f $4 $2
	m_WarpListEndWithDefault

warpSource4de9:
	m_PositionWarp $28 $59 $4 $2
	m_WarpListEndWithDefault

warpSource4ded:
	m_PositionWarp $25 $58 $4 $2
	m_WarpListEndWithDefault

warpSource4df1:
	m_PositionWarp $61 $3a $2 $2
	m_WarpListEndWithDefault

warpSource4df5:
	m_PositionWarp $32 $0d $2 $2
	m_PositionWarp $12 $12 $2 $2
	m_PositionWarp $21 $66 $0 $2
	m_WarpListEndWithDefault

warpSource4e01:
	m_PositionWarp $15 $1b $2 $2
	m_PositionWarp $61 $1f $2 $2
	m_WarpListEndWithDefault

warpSource4e09:
	m_PositionWarp $11 $42 $1 $4
	m_PositionWarp $18 $2f $2 $2
	m_WarpListEndWithDefault

warpSource4e11:
	m_PositionWarp $22 $2d $3 $4
	m_PositionWarp $25 $2e $3 $4
	m_WarpListEndWithDefault

warpSource4e19:
	m_PositionWarp $61 $64 $5 $2
	m_PositionWarp $68 $65 $5 $2
	m_WarpListFallThrough

group3WarpSources:
	m_StandardWarp $0 $0f $06 $5 $4
	m_StandardWarp $4 $0f $1f $1 $3
	m_StandardWarp $8 $0f $1f $1 $3
	m_StandardWarp $4 $1e $1d $0 $3
	m_PointerWarp     $1e warpSource4fd9
	m_StandardWarp $4 $1f $16 $1 $3
	m_StandardWarp $0 $1f $4a $5 $2
	m_StandardWarp $4 $2e $16 $0 $3
	m_StandardWarp $0 $2e $4f $5 $2
	m_StandardWarp $4 $2f $10 $1 $3
	m_StandardWarp $0 $2f $4d $5 $2
	m_StandardWarp $4 $3f $1b $0 $3
	m_PointerWarp     $4e warpSource4fe1
	m_StandardWarp $4 $4f $2b $0 $3
	m_StandardWarp $4 $5e $20 $0 $3
	m_StandardWarp $4 $5f $1e $0 $3
	m_StandardWarp $4 $6e $08 $1 $3
	m_StandardWarp $4 $6f $09 $1 $3
	m_StandardWarp $4 $7e $12 $1 $3
	m_StandardWarp $8 $7f $14 $1 $3
	m_StandardWarp $0 $8c $08 $7 $4
	m_StandardWarp $4 $8e $09 $0 $3
	m_PointerWarp     $8f warpSource4f91
	m_StandardWarp $4 $9e $29 $0 $3
	m_StandardWarp $0 $9e $1c $3 $2
	m_PointerWarp     $9f warpSource4fe9
	m_StandardWarp $0 $a1 $60 $5 $4
	m_StandardWarp $0 $ae $1d $3 $2
	m_StandardWarp $4 $af $23 $1 $3
	m_StandardWarp $0 $be $50 $5 $2
	m_StandardWarp $4 $be $18 $1 $3
	m_StandardWarp $4 $bf $25 $2 $3
	m_StandardWarp $0 $c1 $2c $3 $4
	m_StandardWarp $0 $c5 $0a $2 $4
	m_StandardWarp $0 $c7 $42 $3 $4
	m_StandardWarp $4 $ce $44 $0 $3
	m_StandardWarp $4 $cf $3f $1 $3
	m_PointerWarp     $d0 warpSource4ff1
	m_StandardWarp $4 $de $26 $2 $3
	m_StandardWarp $4 $df $24 $3 $3
	m_StandardWarp $4 $e3 $2a $2 $3
	m_StandardWarp $4 $e4 $2b $2 $3
	m_StandardWarp $4 $e5 $29 $3 $3
	m_StandardWarp $4 $e6 $2a $3 $3
	m_StandardWarp $4 $e7 $17 $1 $3
	m_StandardWarp $4 $e8 $20 $2 $3
	m_StandardWarp $0 $e9 $25 $1 $4
	m_StandardWarp $4 $ea $0a $0 $3
	m_StandardWarp $4 $eb $0c $0 $3
	m_StandardWarp $8 $ec $0d $0 $3
	m_StandardWarp $4 $ed $3d $1 $3
	m_PointerWarp     $ed warpSource4fa5
	m_StandardWarp $4 $ee $41 $0 $3
	m_StandardWarp $4 $ef $36 $1 $3
	m_StandardWarp $4 $f6 $46 $1 $3
	m_StandardWarp $4 $f7 $32 $0 $3
	m_StandardWarp $4 $f8 $34 $0 $3
	m_StandardWarp $4 $fa $2d $1 $3
	m_StandardWarp $4 $fb $2d $0 $3
	m_StandardWarp $4 $fc $24 $1 $3
	m_StandardWarp $4 $fd $21 $2 $3
	m_StandardWarp $4 $fe $88 $0 $3
	m_StandardWarp $4 $ff $26 $3 $3
	m_StandardWarp $4 $08 $4d $0 $3
	m_PointerWarp     $08 warpSource4fc1
	m_StandardWarp $4 $18 $08 $0 $3
	m_PointerWarp     $18 warpSource4fd1
	m_StandardWarp $4 $38 $50 $0 $3
	m_StandardWarp $0 $28 $45 $3 $2
	m_StandardWarp $0 $48 $52 $0 $2
	m_StandardWarp $8 $0a $22 $0 $3
	m_PointerWarp     $0a warpSource4fcd
	m_PointerWarp     $09 warpSource4fc5
	m_StandardWarp $4 $19 $58 $0 $3
	m_StandardWarp $4 $39 $5d $0 $3
	m_StandardWarp $0 $29 $60 $0 $2
	m_StandardWarp $3 $58 $4d $3 $3
	m_StandardWarp $0 $49 $3e $3 $8
	m_StandardWarp $c $59 $4e $3 $3
	m_StandardWarp $0 $68 $51 $3 $8
	m_PointerWarp     $78 warpSource4fb9
	m_StandardWarp $4 $1a $6a $0 $3
	m_PointerWarp     $1a warpSource4fb5
	m_StandardWarp $4 $69 $68 $0 $3
	m_PointerWarp     $69 warpSource4fad
	m_StandardWarp $8 $79 $67 $0 $3
	m_PointerWarp     $79 warpSource4fa9
	m_PointerWarp     $1b warpSource4f9d
	m_StandardWarp $4 $0c $84 $0 $3
	m_PointerWarp     $0c warpSource4f99
	m_StandardWarp $0 $1d $8d $0 $2
	m_StandardWarp $04 $1c $5a $2 TRANSITION_SRC_LEAVESCREEN
	m_StandardWarp $0 $7a $60 $3 TRANSITION_SRC_FADEOUT
	m_StandardWarp $0 $8a $13 $3 TRANSITION_SRC_FADEOUT
	m_WarpListEndNoDefault

warpSource4f91:
	m_PositionWarp $68 $65 $4 $2
	m_PositionWarp $61 $27 $0 $8
	m_WarpListEndWithDefault

warpSource4f99:
	m_PositionWarp $02 $5c $3 $2
	m_WarpListEndWithDefault

warpSource4f9d:
	m_PositionWarp $57 $75 $0 $2
	m_PositionWarp $23 $79 $0 $2
	m_WarpListEndWithDefault

warpSource4fa5:
	m_PositionWarp $68 $5f $4 $2
	m_WarpListEndWithDefault

warpSource4fa9:
	m_PositionWarp $18 $6d $0 $8
	m_WarpListEndWithDefault

warpSource4fad:
	m_PositionWarp $18 $32 $7 $2
	m_PositionWarp $48 $6c $0 $8
	m_WarpListEndWithDefault

warpSource4fb5:
	m_PositionWarp $61 $52 $3 $8
	m_WarpListEndWithDefault

warpSource4fb9:
	m_PositionWarp $65 $7f $5 $2
	m_PositionWarp $14 $50 $3 $8
	m_WarpListEndWithDefault

warpSource4fc1:
	m_PositionWarp $21 $44 $3 $8
	m_WarpListEndWithDefault

warpSource4fc5:
	m_PositionWarp $07 $18 $3 $2
	m_PositionWarp $62 $32 $5 $2
	m_WarpListEndWithDefault

warpSource4fcd:
	m_PositionWarp $21 $12 $7 $2
	m_WarpListEndWithDefault

warpSource4fd1:
	m_PositionWarp $03 $46 $3 $2
	m_PositionWarp $17 $53 $3 $8
	m_WarpListEndWithDefault

warpSource4fd9:
	m_PositionWarp $12 $48 $5 $2
	m_PositionWarp $17 $0e $3 $2
	m_WarpListEndWithDefault

warpSource4fe1:
	m_PositionWarp $52 $06 $3 $2
	m_PositionWarp $27 $5a $5 $2
	m_WarpListEndWithDefault

warpSource4fe9:
	m_PositionWarp $11 $1f $3 $2
	m_PositionWarp $22 $1b $3 $2
	m_WarpListEndWithDefault

warpSource4ff1:
	m_PositionWarp $22 $2f $3 $4
	m_PositionWarp $25 $30 $3 $4
	m_WarpListFallThrough

group4WarpSources:
	m_StandardWarp $4 $24 $01 $0 $3
	m_StandardWarp $4 $66 $02 $0 $3
	m_StandardWarp $4 $91 $03 $0 $3
	m_StandardWarp $4 $bb $04 $0 $3
	m_StandardWarp $4 $ce $05 $0 $3
	m_StandardWarp $4 $04 $00 $0 $3
	m_StandardWarp $4 $0d $00 $1 $3
	m_StandardWarp $0 $09 $00 $6 $2
	m_StandardWarp $0 $07 $1d $1 $4
	m_StandardWarp $0 $01 $26 $0 $4
	m_StandardWarp $0 $1b $01 $6 $2
	m_StandardWarp $0 $86 $07 $6 $2
	m_StandardWarp $0 $99 $0f $6 $2
	m_StandardWarp $0 $9b $10 $6 $2
	m_StandardWarp $0 $a0 $0d $6 $2
	m_StandardWarp $0 $a2 $0a $6 $2
	m_StandardWarp $0 $a3 $0e $6 $2
	m_StandardWarp $0 $ad $0b $6 $2
	m_PointerWarp     $9c warpSource51c5
	m_PointerWarp     $a4 warpSource51cd
	m_StandardWarp $0 $c2 $11 $6 $2
	m_StandardWarp $0 $c3 $12 $6 $2
	m_StandardWarp $4 $d0 $46 $4 $3
	m_PointerWarp     $d0 warpSource5125
	m_PointerWarp     $d1 warpSource5161
	m_PointerWarp     $d2 warpSource51a1
	m_PointerWarp     $d3 warpSource51ad
	m_StandardWarp $4 $e6 $3b $0 $3
	m_StandardWarp $8 $e6 $3b $0 $3
	m_StandardWarp $0 $e6 $15 $7 $2
	m_StandardWarp $4 $e7 $33 $1 $3
	m_StandardWarp $8 $e7 $33 $1 $3
	m_StandardWarp $0 $ea $1d $4 $4
	m_StandardWarp $0 $eb $4d $4 $2
	m_PointerWarp     $f0 warpSource51bd
	m_StandardWarp $0 $f2 $4b $4 $2
	m_StandardWarp $0 $fb $4a $4 $2
	m_StandardWarp $0 $fd $47 $4 $2
	m_StandardWarp $4 $f3 $33 $1 $3
	m_StandardWarp $8 $f3 $33 $1 $3
	m_StandardWarp $4 $fe $49 $4 $3
	m_StandardWarp $0 $11 $39 $0 $4
	m_StandardWarp $4 $77 $77 $0 $3
	m_StandardWarp $4 $43 $7e $0 $3
	m_StandardWarp $4 $3b $7f $0 $3
	m_PointerWarp     $7c warpSource5121
	m_StandardWarp $8 $5e $03 $1 $3
	m_StandardWarp $4 $65 $1a $1 $3
	m_StandardWarp $4 $5d $1e $1 $3
	m_StandardWarp $4 $51 $2e $1 $3
	m_PointerWarp     $57 warpSource5119
	m_StandardWarp $0 $54 $32 $1 $2
	m_StandardWarp $0 $7a $81 $0 $2
	m_StandardWarp $0 $76 $4a $2 $2
	m_StandardWarp $0 $72 $4d $2 $2
	m_StandardWarp $4 $68 $3c $1 $3
	m_StandardWarp $4 $7d $0f $0 $3
	m_StandardWarp $4 $7e $82 $0 $3
	m_StandardWarp $0 $39 $83 $0 $2
	m_StandardWarp $0 $61 $40 $1 $2
	m_StandardWarp $4 $5a $4b $1 $3
	m_StandardWarp $0 $14 $04 $6 $2
	m_StandardWarp $0 $19 $02 $6 $2
	m_StandardWarp $0 $1a $03 $6 $2
	m_StandardWarp $0 $17 $05 $6 $2
	m_StandardWarp $0 $15 $06 $6 $2
	m_StandardWarp $0 $7f $52 $2 $2
	m_StandardWarp $0 $0e $74 $0 $2
	m_StandardWarp $0 $5f $0b $1 $2
	m_WarpListEndNoDefault

warpSource5119:
	m_PositionWarp $51 $2f $1 $2
	m_WarpListEndWithDefault

warpSource5121:
	m_PositionWarp $23 $80 $0 $2
	m_WarpListEndWithDefault

warpSource5125:
	m_PositionWarp $11 $2e $4 $2
	m_PositionWarp $17 $2f $4 $2
	m_PositionWarp $19 $30 $4 $2
	m_PositionWarp $1d $31 $4 $2
	m_PositionWarp $31 $32 $4 $2
	m_PositionWarp $35 $33 $4 $2
	m_PositionWarp $39 $34 $4 $2
	m_PositionWarp $51 $35 $4 $2
	m_PositionWarp $55 $36 $4 $2
	m_PositionWarp $59 $37 $4 $2
	m_PositionWarp $5d $38 $4 $2
	m_PositionWarp $71 $39 $4 $2
	m_PositionWarp $77 $3a $4 $2
	m_PositionWarp $91 $3b $4 $2
	m_PositionWarp $9d $3c $4 $2
	m_WarpListEndWithDefault

warpSource5161:
	m_PositionWarp $57 $3d $4 $2
	m_PositionWarp $11 $1e $4 $2
	m_PositionWarp $17 $1f $4 $2
	m_PositionWarp $19 $20 $4 $2
	m_PositionWarp $1d $21 $4 $2
	m_PositionWarp $31 $22 $4 $2
	m_PositionWarp $35 $23 $4 $2
	m_PositionWarp $39 $24 $4 $2
	m_PositionWarp $51 $25 $4 $2
	m_PositionWarp $55 $26 $4 $2
	m_PositionWarp $59 $27 $4 $2
	m_PositionWarp $5d $28 $4 $2
	m_PositionWarp $71 $29 $4 $2
	m_PositionWarp $77 $2a $4 $2
	m_PositionWarp $91 $2b $4 $2
	m_PositionWarp $9d $2c $4 $2
	m_WarpListEndWithDefault

warpSource51a1:
	m_PositionWarp $57 $2d $4 $2
	m_PositionWarp $8a $3f $4 $2
	m_PositionWarp $00 $41 $4 $2
	m_WarpListEndWithDefault

warpSource51ad:
	m_PositionWarp $07 $48 $4 $2
	m_PositionWarp $57 $3e $4 $2
	m_PositionWarp $22 $2d $4 $2
	m_PositionWarp $2c $41 $4 $2
	m_WarpListEndWithDefault

warpSource51bd:
	m_PositionWarp $77 $42 $4 $2
	m_PositionWarp $27 $4c $4 $4
	m_WarpListEndWithDefault

warpSource51c5:
	m_PositionWarp $87 $0c $6 $2
	m_WarpListEndNoDefault

warpSource51cd:
	m_PositionWarp $64 $09 $6 $2
	m_WarpListEndNoDefault

group5WarpSources:
	m_StandardWarp $4 $26 $06 $1 $3
	m_StandardWarp $0 $25 $0d $7 $2
	m_StandardWarp $0 $4b $11 $7 $2
	m_StandardWarp $0 $4d $13 $7 $2
	m_StandardWarp $0 $4e $14 $7 $2
	m_StandardWarp $4 $aa $4e $0 $3
	m_PointerWarp     $79 warpSource5431
	m_StandardWarp $0 $7e $1a $7 $2
	m_StandardWarp $0 $84 $19 $7 $2
	m_StandardWarp $0 $87 $18 $7 $2
	m_StandardWarp $0 $88 $17 $7 $2
	m_StandardWarp $0 $8a $1b $7 $2
	m_StandardWarp $0 $8c $16 $7 $2
	m_StandardWarp $0 $f1 $18 $5 $2
	m_StandardWarp $0 $f4 $2b $1 $2
	m_StandardWarp $0 $f5 $16 $5 $2
	m_StandardWarp $0 $b0 $35 $1 $4
	m_StandardWarp $0 $b5 $30 $1 $4
	m_StandardWarp $0 $be $0f $7 $2
	m_StandardWarp $4 $c0 $19 $0 $3
	m_PointerWarp     $c0 warpSource5419
	m_StandardWarp $0 $c1 $25 $5 $2
	m_StandardWarp $0 $c5 $56 $5 $2
	m_StandardWarp $0 $c6 $30 $5 $2
	m_StandardWarp $4 $c7 $40 $0 $3
	m_StandardWarp $4 $cd $44 $1 $3
	m_StandardWarp $8 $cd $45 $1 $3
	m_PointerWarp     $cd warpSource5421
	m_StandardWarp $8 $cf $25 $0 $3
	m_StandardWarp $0 $cf $4c $0 $4
	m_StandardWarp $4 $d0 $42 $0 $3
	m_StandardWarp $4 $d1 $0a $1 $3
	m_StandardWarp $0 $d1 $44 $5 $2
	m_StandardWarp $4 $d8 $1f $0 $3
	m_StandardWarp $4 $da $10 $0 $3
	m_StandardWarp $8 $db $13 $0 $3
	m_StandardWarp $0 $dc $05 $3 $2
	m_StandardWarp $0 $dd $49 $2 $2
	m_StandardWarp $0 $de $08 $3 $2
	m_StandardWarp $0 $df $4c $2 $2
	m_StandardWarp $4 $e0 $1b $1 $3
	m_StandardWarp $0 $e1 $0c $3 $2
	m_StandardWarp $4 $e2 $23 $0 $3
	m_StandardWarp $0 $e3 $0a $3 $2
	m_StandardWarp $4 $e5 $0d $1 $3
	m_StandardWarp $8 $e6 $0e $1 $3
	m_StandardWarp $0 $e8 $21 $3 $2
	m_StandardWarp $4 $e9 $43 $1 $3
	m_StandardWarp $0 $ea $16 $2 $2
	m_StandardWarp $4 $ea $21 $1 $3
	m_StandardWarp $8 $ea $22 $1 $3
	m_StandardWarp $4 $eb $15 $1 $3
	m_StandardWarp $0 $eb $31 $5 $2
	m_StandardWarp $4 $ec $37 $1 $3
	m_StandardWarp $0 $ed $3f $0 $4
	m_StandardWarp $4 $ee $17 $0 $3
	m_StandardWarp $8 $ee $18 $0 $3
	m_StandardWarp $0 $ee $0f $3 $2
	m_StandardWarp $0 $ab $5e $5 $2
	m_StandardWarp $4 $ac $1c $2 $3
	m_StandardWarp $0 $ac $5c $5 $2
	m_StandardWarp $0 $ad $61 $5 $2
	m_StandardWarp $4 $ae $1e $3 $3
	m_StandardWarp $0 $ae $5f $5 $2
	m_StandardWarp $4 $f6 $13 $1 $3
	m_PointerWarp     $f6 warpSource5429
	m_StandardWarp $0 $f7 $87 $0 $2
	m_StandardWarp $4 $f9 $3b $1 $3
	m_StandardWarp $0 $fb $07 $7 $2
	m_StandardWarp $4 $fc $4f $0 $3
	m_PointerWarp     $fc warpSource5411
	m_StandardWarp $4 $19 $53 $0 $3
	m_StandardWarp $4 $2a $54 $0 $3
	m_PointerWarp     $2a warpSource53b1
	m_StandardWarp $4 $35 $55 $0 $3
	m_PointerWarp     $35 warpSource540d
	m_StandardWarp $4 $40 $56 $0 $3
	m_PointerWarp     $40 warpSource53e9
	m_StandardWarp $4 $d3 $5b $0 $3
	m_StandardWarp $0 $d2 $0a $7 $2
	m_StandardWarp $4 $50 $1a $0 $3
	m_StandardWarp $0 $69 $10 $7 $2
	m_StandardWarp $0 $61 $1d $7 $2
	m_StandardWarp $0 $6a $1e $7 $2
	m_StandardWarp $0 $5f $1f $7 $2
	m_PointerWarp     $36 warpSource5405
	m_PointerWarp     $34 warpSource53fd
	m_PointerWarp     $29 warpSource53d5
	m_StandardWarp $0 $2b $68 $5 $2
	m_PointerWarp     $1a warpSource53ed
	m_StandardWarp $0 $3f $24 $7 $2
	m_StandardWarp $0 $2f $25 $7 $2
	m_PointerWarp     $2e warpSource53e1
	m_StandardWarp $0 $3a $28 $7 $2
	m_StandardWarp $0 $2c $74 $5 $2
	m_PointerWarp     $1c warpSource53d9
	m_StandardWarp $0 $15 $0e $7 $2
	m_StandardWarp $0 $18 $26 $7 $2
	m_StandardWarp $0 $38 $2c $7 $2
	m_StandardWarp $0 $3e $2d $7 $2
	m_StandardWarp $4 $fd $57 $0 $3
	m_PointerWarp     $fd warpSource53d1
	m_StandardWarp $0 $fe $36 $0 $2
	m_StandardWarp $0 $06 $5a $0 $2
	m_StandardWarp $0 $08 $5f $0 $2
	m_StandardWarp $0 $07 $5e $0 $2
	m_StandardWarp $0 $09 $5c $0 $2
	m_StandardWarp $0 $0a $62 $0 $2
	m_PointerWarp     $0b warpSource53c1
	m_PointerWarp     $62 warpSource53c9
	m_PointerWarp     $20 warpSource53bd
	m_PointerWarp     $23 warpSource53b9
	m_PointerWarp     $14 warpSource53b5
	m_StandardWarp $0 $3d $46 $0 $2
	m_StandardWarp $0 $2d $70 $0 $2
	m_PointerWarp     $30 warpSource53ad
	m_StandardWarp $0 $95 $47 $1 $2
	m_WarpListEndNoDefault

warpSource53ad:
	m_PositionWarp $2c $2f $7 $2
	m_WarpListEndWithDefault

warpSource53b1:
	m_PositionWarp $91 $6e $0 $2
	m_WarpListEndWithDefault

warpSource53b5:
	m_PositionWarp $91 $06 $0 $2
	m_WarpListEndWithDefault

warpSource53b9:
	m_PositionWarp $51 $34 $7 $2
	m_WarpListEndWithDefault

warpSource53bd:
	m_PositionWarp $2c $30 $7 $2
	m_WarpListEndWithDefault

warpSource53c1:
	m_PositionWarp $8b $63 $0 $2
	m_PositionWarp $24 $31 $7 $2
	m_WarpListEndWithDefault

warpSource53c9:
	m_PositionWarp $97 $80 $5 $2
	m_PositionWarp $27 $4f $3 $2
	m_WarpListEndWithDefault

warpSource53d1:
	m_PositionWarp $1c $48 $3 $2
	m_WarpListEndWithDefault

warpSource53d5:
	m_PositionWarp $82 $79 $5 $2
	m_WarpListEndWithDefault

warpSource53d9:
	m_PositionWarp $9c $75 $5 $2
	m_PositionWarp $12 $2b $7 $2
	m_WarpListEndWithDefault

warpSource53e1:
	m_PositionWarp $12 $2a $7 $2
	m_PositionWarp $9c $76 $5 $2
	m_WarpListEndWithDefault

warpSource53e9:
	m_PositionWarp $1d $23 $7 $2
	m_WarpListEndWithDefault

warpSource53ed:
	m_PositionWarp $91 $73 $5 $2
	m_PositionWarp $9d $27 $7 $2
	m_PositionWarp $69 $29 $7 $2
	m_PositionWarp $65 $59 $0 $2
	m_WarpListEndWithDefault

warpSource53fd:
	m_PositionWarp $82 $2c $5 $2
	m_PositionWarp $1d $21 $7 $2
	m_WarpListEndWithDefault

warpSource5405:
	m_PositionWarp $8c $40 $5 $2
	m_PositionWarp $22 $22 $7 $2
	m_WarpListEndWithDefault

warpSource540d:
	m_PositionWarp $11 $20 $7 $2
	m_WarpListFallThrough

warpSource5411:
	m_PositionWarp $2b $51 $0 $2
	m_PositionWarp $7b $76 $0 $2
	m_WarpListEndWithDefault

warpSource5419:
	m_PositionWarp $21 $2e $5 $2
	m_PositionWarp $57 $23 $5 $2
	m_WarpListEndWithDefault

warpSource5421:
	m_PositionWarp $42 $0b $7 $2
	m_PositionWarp $49 $0c $7 $2
	m_WarpListEndWithDefault

warpSource5429:
	m_PositionWarp $93 $34 $2 $2
	m_PositionWarp $9b $35 $2 $2
	m_WarpListEndWithDefault

warpSource5431:
	m_PositionWarp $57 $1c $7 $2
	m_WarpListEndNoDefault

group6WarpSources:
	m_StandardWarp $1 $05 $08 $4 $3
	m_StandardWarp $1 $10 $0b $4 $3
	m_StandardWarp $1 $27 $0c $4 $3
	m_StandardWarp $2 $27 $62 $4 $3
	m_StandardWarp $2 $2a $10 $4 $3
	m_StandardWarp $4 $2b $0d $4 $3
	m_StandardWarp $8 $2b $0e $4 $3
	m_StandardWarp $1 $68 $12 $4 $3
	m_StandardWarp $8 $68 $11 $4 $3
	m_StandardWarp $1 $93 $19 $4 $3
	m_StandardWarp $2 $94 $17 $4 $3
	m_StandardWarp $1 $95 $1a $4 $3
	m_StandardWarp $8 $96 $15 $4 $3
	m_StandardWarp $1 $97 $16 $4 $3
	m_StandardWarp $2 $97 $18 $4 $3
	m_StandardWarp $1 $98 $13 $4 $3
	m_StandardWarp $2 $98 $14 $4 $3
	m_StandardWarp $1 $c0 $1b $4 $3
	m_StandardWarp $2 $c0 $1c $4 $3
	m_StandardWarp $2 $28 $61 $4 $3
	m_StandardWarp $1 $28 $63 $4 $3
	m_WarpListEndNoDefault

group7WarpSources:
	m_StandardWarp $1 $01 $11 $0 $3
	m_StandardWarp $2 $01 $02 $7 $3
	m_StandardWarp $4 $02 $01 $7 $3
	m_StandardWarp $2 $02 $22 $2 $3
	m_StandardWarp $2 $03 $05 $7 $3
	m_StandardWarp $4 $04 $04 $7 $3
	m_StandardWarp $2 $04 $24 $2 $3
	m_StandardWarp $1 $08 $6c $5 $3
	m_StandardWarp $2 $08 $17 $3 $3
	m_StandardWarp $1 $09 $07 $1 $3
	m_StandardWarp $2 $0a $19 $3 $3
	m_StandardWarp $1 $05 $4a $3 $3
	m_StandardWarp $2 $05 $03 $5 $3
	m_StandardWarp $0 $07 $3b $5 $2
	m_StandardWarp $1 $10 $08 $5 $3
	m_StandardWarp $2 $11 $07 $5 $3
	m_StandardWarp $1 $11 $17 $5 $3
	m_StandardWarp $1 $29 $0a $5 $3
	m_StandardWarp $2 $2a $09 $5 $3
	m_StandardWarp $1 $47 $0b $5 $3
	m_StandardWarp $2 $47 $72 $5 $3
	m_StandardWarp $8 $48 $0c $5 $3
	m_StandardWarp $1 $48 $71 $5 $3
	m_StandardWarp $4 $49 $0d $5 $3
	m_StandardWarp $2 $4a $0e $5 $3
	m_StandardWarp $1 $4a $78 $5 $3
	m_StandardWarp $2 $73 $13 $5 $3
	m_StandardWarp $1 $74 $12 $5 $3
	m_StandardWarp $2 $74 $11 $5 $3
	m_StandardWarp $2 $75 $10 $5 $3
	m_StandardWarp $1 $76 $14 $5 $3
	m_StandardWarp $8 $76 $0f $5 $3
	m_StandardWarp $4 $ef $44 $4 $3
	m_StandardWarp $4 $d3 $61 $0 $3
	m_StandardWarp $1 $bf $21 $5 $3
	m_StandardWarp $2 $c0 $24 $5 $3
	m_StandardWarp $2 $71 $22 $5 $3
	m_StandardWarp $1 $70 $26 $5 $3
	m_StandardWarp $1 $72 $27 $5 $3
	m_StandardWarp $8 $45 $15 $5 $3
	m_StandardWarp $1 $44 $2a $5 $3
	m_StandardWarp $2 $46 $2b $5 $3
	m_StandardWarp $2 $43 $6e $5 $3
	m_StandardWarp $8 $43 $6f $5 $3
	m_StandardWarp $1 $42 $70 $5 $3
	m_StandardWarp $4 $42 $6d $5 $3
	m_StandardWarp $8 $4b $77 $5 $3
	m_StandardWarp $2 $0d $85 $0 $3
	m_WarpListEndNoDefault

