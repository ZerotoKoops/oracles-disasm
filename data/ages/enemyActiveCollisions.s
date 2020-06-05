; Technically, this table is indexed by Enemy.collisionType. But, Enemy.collisionType is
; almost always the same as Enemy.id, except in rare cases (ie. ENEMYID_SPINY_BEETLE
; borrows ENEMYID_BEAMOS's value when hiding under rock).

; Each 4 bytes here is a bitset which determines which item collisions the Enemy will
; respond to. If a bit is unset, it won't do anything when it collides with an object with
; that item collision. (See constants/itemCollisions.s.)

; Note: the bits are reversed to make it easier to look at (ie. collisionType 0 is at the
; far left)

enemyActiveCollisions:
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x00
	dbrev %11111111 %11110100 %00010111 %11111110 ; 0x01
	dbrev %11111111 %11110100 %00010111 %11111110 ; 0x02
	dbrev %11111111 %01000100 %00010111 %01111110 ; 0x03
	dbrev %11111111 %11000100 %00010111 %01111110 ; 0x04
	dbrev %11111111 %11110110 %10010111 %11111110 ; 0x05
	dbrev %11111111 %11110100 %00010111 %11111110 ; 0x06
	dbrev %11111111 %11110110 %10010111 %11111110 ; 0x07
	dbrev %11111111 %11110111 %00010111 %11111110 ; 0x08
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x09
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x0a
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x0b
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x0c
	dbrev %11111111 %11110111 %00010111 %11111110 ; 0x0d
	dbrev %11111111 %11001110 %10010111 %01111110 ; 0x0e
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x0f
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x10
	dbrev %11111111 %11110111 %00010011 %11111110 ; 0x11
	dbrev %11111111 %11110111 %10010111 %11111110 ; 0x12
	dbrev %10011111 %01000110 %00010111 %01111110 ; 0x13
	dbrev %11111111 %11001111 %00010111 %11111110 ; 0x14
	dbrev %10000000 %00000100 %00010111 %01111110 ; 0x15
	dbrev %11110000 %00000000 %00000000 %00000000 ; 0x16
	dbrev %10011111 %11110110 %10010111 %11111110 ; 0x17
	dbrev %11111111 %11111111 %00010111 %11111110 ; 0x18
	dbrev %10011111 %01000110 %00010111 %01111110 ; 0x19
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x1a
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x1b
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x1c
	dbrev %11111111 %11001111 %10010111 %11111110 ; 0x1d
	dbrev %11111111 %11110111 %10010111 %11111110 ; 0x1e
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x1f
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x20
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x21
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x22
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x23
	dbrev %10001111 %11111111 %10010111 %11111110 ; 0x24
	dbrev %11111111 %11010101 %00010111 %11111110 ; 0x25
	dbrev %11111111 %11110110 %10010111 %11111110 ; 0x26
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x27
	dbrev %00001111 %11111111 %10010111 %11111110 ; 0x28
	dbrev %10000000 %00000000 %00000000 %00000000 ; 0x29
	dbrev %11111111 %01001110 %10010111 %01111110 ; 0x2a
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x2b
	dbrev %10001111 %11111111 %10010111 %11111110 ; 0x2c
	dbrev %11111111 %11000000 %00010001 %10000000 ; 0x2d
	dbrev %11111111 %11001110 %10010111 %01111110 ; 0x2e
	dbrev %11111111 %11001110 %10010111 %01111110 ; 0x2f
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x30
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x31
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x32
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x33
	dbrev %11111111 %11110111 %00010111 %11111110 ; 0x34
	dbrev %10001111 %11111111 %10010111 %11111110 ; 0x35
	dbrev %00001111 %11110111 %00010111 %11111110 ; 0x36
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x37
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x38
	dbrev %10111111 %11010111 %10010111 %11111110 ; 0x39
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x3a
	dbrev %11111111 %11110110 %00010111 %11111110 ; 0x3b
	dbrev %11111111 %11110110 %10010111 %11111110 ; 0x3c
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x3d
	dbrev %11111111 %11110111 %00010111 %11111110 ; 0x3e
	dbrev %10001111 %11110110 %00010111 %11111110 ; 0x3f
	dbrev %11111111 %11111111 %10010011 %11111110 ; 0x40
	dbrev %11111111 %11110111 %00010111 %11111110 ; 0x41
	dbrev %10001111 %11110111 %00010111 %11111110 ; 0x42
	dbrev %10001111 %11111111 %00010111 %11111110 ; 0x43
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x44
	dbrev %11111111 %11110111 %00010111 %11111110 ; 0x45
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x46
	dbrev %10001111 %11110111 %00010111 %11111110 ; 0x47
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x48
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x49
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x4a
	dbrev %11111111 %11011111 %10010111 %11111110 ; 0x4b
	dbrev %11111111 %11110111 %00010111 %11111110 ; 0x4c
	dbrev %11111111 %11001111 %10010111 %11111110 ; 0x4d
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x4e
	dbrev %11111111 %11111111 %00010111 %11111110 ; 0x4f
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x50
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x51
	dbrev %11111111 %11111110 %10010111 %11111110 ; 0x52
	dbrev %00000000 %00000000 %10000000 %00000000 ; 0x53
	dbrev %11111111 %11110110 %10010111 %11111110 ; 0x54
	dbrev %10001111 %11000110 %10010111 %01111110 ; 0x55
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x56
	dbrev %11111111 %11110110 %00010011 %01111110 ; 0x57
	dbrev %00001111 %10000100 %00010011 %11111110 ; 0x58
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x59
	dbrev %10001111 %11011000 %10010001 %00000000 ; 0x5a
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x5b
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x5c
	dbrev %10111111 %10000100 %00000000 %00000000 ; 0x5d
	dbrev %11111111 %11000110 %00010111 %11111110 ; 0x5e
	dbrev %11111111 %11001110 %10010111 %11111110 ; 0x5f
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x60
	dbrev %11111111 %11110110 %00010111 %11111110 ; 0x61
	dbrev %00000000 %00000100 %00000000 %00000000 ; 0x62
	dbrev %00000000 %00000000 %00000000 %00111110 ; 0x63
	dbrev %11111111 %11111111 %10010111 %11111110 ; 0x64
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x65
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x66
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x67
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x68
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x69
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x6a
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x6b
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x6c
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x6d
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x6e
	dbrev %00000000 %00000000 %00000000 %00000000 ; 0x6f
	dbrev %11111111 %11110110 %00010111 %11111110 ; 0x70
	dbrev %11111111 %11110110 %00010111 %11111110 ; 0x71
	dbrev %11111111 %11111110 %00010111 %11111110 ; 0x72
	dbrev %11111111 %11110110 %00010111 %11111110 ; 0x73
	dbrev %10111111 %01000110 %00010111 %01111110 ; 0x74
	dbrev %10011111 %11010110 %00010111 %11111110 ; 0x75
	dbrev %11111111 %11110100 %00010111 %11111110 ; 0x76
	dbrev %11111111 %11000100 %00010111 %01111110 ; 0x77
	dbrev %11111111 %11110110 %00010111 %11111110 ; 0x78
	dbrev %10001111 %11000100 %10010111 %01111110 ; 0x79
	dbrev %10010000 %00000000 %00010100 %00111110 ; 0x7a
	dbrev %11111111 %11110110 %00010111 %01111110 ; 0x7b
	dbrev %10001111 %11000000 %00000000 %00000000 ; 0x7c
	dbrev %11111111 %11110100 %00010111 %01111110 ; 0x7d
	dbrev %11111111 %11110110 %00010111 %01111110 ; 0x7e
	dbrev %00000000 %00000100 %00010101 %01111110 ; 0x7f
