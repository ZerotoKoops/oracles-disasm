;;
clearInteractions:
	ldde FIRST_INTERACTION_INDEX, Interaction.start
--
	ld h,d
.ifdef AGES_ENGINE
	ld l,e
.else
	ld l,Interaction.start
.endif
	ld b,$40
	call clearMemory
	inc d
	ld a,d
	cp $e0
	jr c,--
	ret
	
incDecimalHlRef:
	ld a,(hl)
	add $01
	daa
	ld (hl),a
	ret

decDecimalHlRef:
	ld a,(hl)
	sub $01
	daa
	ld (hl),a
	ret

.ifdef ROM_AGES
checkForDawnDuskPaletteExceptions:
    ld a,(wTilesetPalette)
    ld e,a
    ld hl,@dawnDuskPaletteExceptions
    jp lookupKey

@dawnDuskPaletteExceptions:
    .db PALH_TILESET_YOLL_GRAVEYARD, $ff ; graveyard
    .db PALH_TILESET_SYMMETRY_CITY_RUINED $ff ; not saved Symmetry City
    .db PALH_TILESET_BLACK_TOWER_OUTSIDE_PRESENT $ff ; Black Tower
    .db PALH_TILESET_MAKU_TREE_TOP $ff ; top of Maku Tree
    .db $00
.endif

updateTimeOfDayPalette:
; clock
	ld a,(wTilesetFlags)
	and TILESETFLAG_OUTDOORS
	jr z,@normalPalette

	ld a,(wTimeOfDay)
	rst_jumpTable
	.dw @normalPalette
.ifdef ROM_AGES
	.dw @dawnDuskPalette
	.dw @nightPalette
	.dw @dawnDuskPalette
.else ; ROM_SEASONS
	.dw @duskPalette
	.dw @normalPalette
	.dw @dawnPalette
.endif

.ifdef ROM_AGES
@nightPalette:
	ld a,PALH_99
	ret

@dawnDuskPalette:
	call checkForDawnDuskPaletteExceptions
	jr c,@normalPalette
	ld a,PALH_TILESET_OVERWORLD_PAST_ALTERNATE
.else ; ROM_SEASONS

@duskPalette:
	ld a,PALH_TILESET_TARM_RUINS_AUTUMN
	ret

@dawnPalette:
	ld a,PALH_TILESET_TARM_RUINS_WINTER
	ret
.endif

@normalPalette:
	ld a,(wTilesetPalette)
    ret

updateParts:
	ldh a,(<hRomBank)
	push af
	callfrombank0 partCode.updateParts
	xor a
	ld (wc4b6),a

	pop af
	setrombank
	ret

getDayNightCombination:
	push hl
    ld hl,wDay
    ldi a,(hl) ;day
	or a
	jr nz,+
; Day 0
	inc a;ld a,$01
	jr ++
+
; Normal Days
    dec a
    rla
    ld c,a
    ld a,(hl) ;day or night
    rra
    add c
++
	pop hl
	ret
