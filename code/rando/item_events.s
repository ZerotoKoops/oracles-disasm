;;
; run certain actions depending on what item was picked up and where. this
; has to be explicitly called if an item is given by an interaction other
; than ID 60.
handleGetItem:
    ld a,b
    ld e,a
    push de
    ld e,$73
    ld a,(de) ; nonzero if interaction should set item room flag
    pop de
    and a
    push af
    call satchelRefillSeeds
    call slingshotAddDefaultSeed
    pop af
    jr z,@incoming
    @incoming:
    ld a,e
    call giveTreasure
    ret

;;
; make satchel refill seeds inherently, not as part of a scripted event.
satchelRefillSeeds:
    ld a,e
    cp TREASURE_SEED_SATCHEL
    ret nz
    push bc
    push de
    push hl
    ld hl,wSeedSatchelLevel
    inc (hl) ; needed since this is run *before* the satchel is given
    call refillSeedSatchel
    dec (hl)
    pop hl
    pop de
    pop bc
    ret

;;
slingshotAddDefaultSeed:
    ld a,e
    cp TREASURE_SLINGSHOT
    ret nz
    push bc
    ld a,$20
    ld c,$20
    call giveTreasure
    pop bc
    ret

;;
; Add a special bypass to not show textboxes for Small Keys dropping from ceiling
bypassKeydropsTextbox:
    ; Don't bypass anything if keysanity is on, since we want the textbox to indicate for which dungeon 
    ; that key was for.
    ld a,$00
    or a
    jr nz,@regularText

    ld e,$71            ; var31, containing spawn mode
    ld a,(de)
    cp $02
    jr nz,@regularText  ; jump if not a drop from ceiling
    
    ld e,$72            ; var32, containing grab mode
    ld a,(de)
    or a
    jr nz,@regularText  ; jump if grab triggers an animation change
    
    ; It's a drop not triggering an animation change ==> it's a keydrop, so skip its textbox (0xFF)
    ld a,$ff
    ret
    
; return regular text ID otherwise
@regularText:
    ld e,$75            ; var35, containing text id
    ld a,(de)
    ret