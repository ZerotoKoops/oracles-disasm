hyruleFieldDStart:
	tempo 150

hyruleFieldDChannel1:
	.redefine HI_VOL $6
	.redefine LO_VOL $3

	
	indexJump
	cmdff	


hyruleFieldDChannel0:
	.redefine HI_VOL $4
	.redefine LO_VOL $3

	indexJump
	cmdff


hyruleFieldDChannel4:
	.redefine HI_VOL $0e
	.redefine LO_VOL $08

	indexJump
	cmdff

hyruleFieldDChannel6:
	.redefine HI_VOL $5
	.redefine LO_VOL $3

	indexJump
	cmdff
