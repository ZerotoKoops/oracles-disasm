;;
; return z iff the current group and room match c and b.
compareRoom:
    ld a,(wActiveGroup)
    cp c
    ret nz
    ld a,(wActiveRoom)
    cp b
    ret

;;
; searches for a value in a table starting at hl, with an entry matching
; keys b and subkey c, and values e bytes long. sets c if found. a key of
; ff ends the table.
searchDoubleKey:
@loop:
    ldi a,(hl)
    cp $ff
    ret z
    cp b
    jr nz,@next
    ldi a,(hl)
    cp c
    jr nz,@done
    scf
    ret
@next:
    inc hl
@done:
    ld a,e
    rst_addAToHl
    jr @loop

;;
; searches for a value in a table starting at hl, with an entry matching
; key "a" and values "e" bytes long. sets c if found. a key of ff ends the table.
searchKey:
    ld b,a
@loop:
    ldi a,(hl)
    cp $ff
    ret z
    cp b
    jr nz,@next
    scf
    ret
@next:
    ld a,e
    rst_addAToHl
    jr @loop

;;
; b = treasure id
; c = treasure subid
spawnTreasureOnLink:
    call createTreasure
    ret nz
    push de
    ld de,w1Link.yh
    call objectCopyPosition_rawAddress
    pop de
    xor a
    ret

;;
; b = treasure id
; c = treasure subid
spawnTreasure:
    call createTreasure
    ret nz
    call objectCopyPosition
    xor a
    ret

;;
; call a function hl in bank 02, preserving af. e can't be used as a
; parameter to that function, but it can be returned. this function only
; exists because banks 08 and 09 are so tight on space.
callBank2:
    push af
    ld e,$02
    call interBankCall
    pop af
    ret

;;
; Look for an interaction of type treasure in the room, and return the address of the first one found
; in HL. Carry flag is set if found.
findTreasure:
    ld hl,$d041
@loop:
    ld a,(hl)
    cp INTERAC_TREASURE
    jr nz,@next
    scf
    ret

@next:
    ld a,h
    cp $df
    jr z,@endNotFound
    inc h
    jr @loop

@endNotFound:
    scf
    ccf
    ret