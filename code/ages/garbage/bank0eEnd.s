.ifdef BUILD_VANILLA

; Garbage repeated data
_fake1:
	.db $00
	.dw $7f71

_fake2:
	.db SPEED_80
	.db $00
@@loop:
	ms_left  $30
	ms_wait  30
	ms_right $a0
	ms_wait  30
	ms_loop  @@loop

.endif