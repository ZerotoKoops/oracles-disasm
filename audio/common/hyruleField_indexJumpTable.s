indexJumpTableChannel0:
.dw musHyruleFieldAChannel0 ; Section A
.dw musHyruleFieldBChannel0 ; Section B
.dw musHyruleFieldCChannel0 ; Section C
.dw musHyruleFieldDChannel0 ; Section D
.dw musHyruleFieldEChannel0 ; Section E
.dw musHyruleFieldFChannel0 ; Section F
.dw musHyruleFieldGChannel0 ; Section G
.dw musHyruleFieldHChannel0 ; Section H
.dw musHyruleFieldIChannel0 ; Section I
.dw musHyruleFieldJChannel0 ; Section J
.dw musHyruleFieldKChannel0 ; Section K
.dw musHyruleFieldAChannel0 ; Section L
.dw musHyruleFieldMChannel0 ; Section M
.dw musHyruleFieldNChannel0 ; Section N
.dw musHyruleFieldOChannel0 ; Section O
.rept 2
	.dw musHyruleFieldPChannel0 ; Section P-Q
.endr
.rept 2
	.dw musHyruleFieldRChannel0 ; Section R,T
	.dw musHyruleFieldSChannel0 ; Section S,U
.endr

indexJumpTableChannel1:
.dw musHyruleFieldAChannel1 ; Section A,00
.dw musHyruleFieldBChannel1 ; Section B,01
.dw musHyruleFieldCChannel1 ; Section C,02
.dw musHyruleFieldDChannel1 ; Section D,03
.dw musHyruleFieldEChannel1 ; Section E,04
.dw musHyruleFieldFChannel1 ; Section F,05
.dw musHyruleFieldGChannel1 ; Section G,06
.dw musHyruleFieldHChannel1 ; Section H,07
.dw musHyruleFieldIChannel1 ; Section I,08
.dw musHyruleFieldJChannel1 ; Section J,09
.dw musHyruleFieldKChannel1 ; Section K,10
.dw musHyruleFieldAChannel1 ; Section L,11
.dw musHyruleFieldMChannel1 ; Section M,12
.dw musHyruleFieldNChannel1 ; Section N,13
.dw musHyruleFieldOChannel1 ; Section O,14
.dw musHyruleFieldPChannel1 ; Section P,15
.dw musHyruleFieldQChannel1 ; Section Q,16
.dw musHyruleFieldRChannel1 ; Section R,17
.dw musHyruleFieldSChannel1 ; Section S,18
.dw musHyruleFieldTChannel1 ; Section T,19
.dw musHyruleFieldUChannel1 ; Section U,20

indexJumpTableChannel4:
.dw musHyruleFieldAChannel4 ; Section A
.rept 2
	.dw musHyruleFieldBChannel4 ; Section B-C
.endr	
.dw musHyruleFieldDChannel4 ; Section D
.dw musHyruleFieldEChannel4 ; Section E
.dw musHyruleFieldFChannel4 ; Section F
.rept 2
	.dw musHyruleFieldGChannel4 ; Section G-H
.endr
.dw musHyruleFieldIChannel4 ; Section I
.dw musHyruleFieldJChannel4 ; Section J
.dw musHyruleFieldKChannel4 ; Section K
.dw musHyruleFieldAChannel4 ; Section L	
.dw musHyruleFieldMChannel4 ; Section M
.dw musHyruleFieldNChannel4 ; Section N
.dw musHyruleFieldOChannel4 ; Section O
.rept 2
	.dw musHyruleFieldPChannel4 ; Section P-Q
.endr
.dw musHyruleFieldRChannel4 ; Section R
.dw musHyruleFieldSChannel4 ; Section S
.dw musHyruleFieldTChannel4 ; Section T
.dw musHyruleFieldUChannel4 ; Section U

indexJumpTableChannel6:
.rept 6
	.dw musHyruleFieldAChannel6 ; Section A-F
.endr
	.dw musHyruleFieldGChannel6 ; Section G
.rept 4
	.dw musHyruleFieldAChannel6 ; Section H-K
.endr
.rept 2
	.dw musHyruleFieldAChannel6 ; Section L-M
.endr
.rept 4
	.dw musHyruleFieldNChannel6 ; Section N-Q
.endr
.rept 4
	.dw musHyruleFieldRChannel6 ; Section R-U
.endr