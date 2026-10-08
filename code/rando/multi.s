;;
; if the item buffer is nonzero, spawn the item at link and reset the buffer.
; var INTERAC_MULTI_BYTE is used to signal the destination player number, and
; var 71 is set to override normal collect/player properties lookup.
checkNetItemBuffer:
    push bc
    push de
    push hl
    
    ; Don't spawn the item if Link is too close to the room border, preventing any text-warp from occuring
    ld a,(wRoomEdgeY)
    ld b,a
    ld a,(w1Link.yh)
    cp $09
    jr c,@done
    add a,$09
    sub b
    jr nc,@done
    
    ld a,(wRoomEdgeX)
    ld b,a
    ld a,(w1Link.xh)
    cp $09
    jr c,@done
    add a,$09
    sub b
    jr nc,@done

    ld a,(wMenuDisabled)
    and a
    jr nz,@done
    ld a,(wLinkGrabState)
    and a
    jr nz,@done
    ld hl,$cbfb
    ldi a,(hl)
    or a
    jr z,@done
    cp $ff
    jr nz,@notDeathlink
    
    ; If item in buffer is 0xFF, it's a deathlink signal so make Link die
    ld a,$fe
    ld (wLinkDeathTrigger),a
    jr @done
    
@notDeathlink:
    ld b,a
    ld c,(hl)
    call spawnTreasureOnLink
    jr nz,@done
    ld l,$71
    ld (hl),$02
    
    ld hl,$c6a8
    inc (hl)
    ld a,(hl)
    or a
    jr nz,@noOverflow
    ld hl,$c6a9
    inc (hl)
    
@noOverflow:
    ld hl,$cbfb
    xor a
    ldi (hl),a
    ld (hl),a
    
@done:
    pop hl
    pop de
    pop bc
    call linkInteractWithAButtonSensitiveObjects
    ret

;;
treasureCollideImmediately:
    call objectSetVisiblec2
    ld e,$70
    ld a,(de)
    ret z
    jp $4000    ; interactionCode60