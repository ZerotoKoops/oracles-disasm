; Values for "collect mode" (override for the 1st byte in the treasure object data).
; This is a combination of the "spawn mode" and "grab mode" (see constants/treasureSpawnModes.s).
.define COLLECT_MODE_PICKUP_NOANIM,        $08
.define COLLECT_MODE_PICKUP_1HAND,         $09
.define COLLECT_MODE_PICKUP_1HAND_NOFLAG,  $01
.define COLLECT_MODE_PICKUP_2HAND,         $0a
.define COLLECT_MODE_PICKUP_2HAND_NOFLAG,  $02
.define COLLECT_MODE_POOF,                 $1a
.define COLLECT_MODE_FALL_KEY,             $28
.define COLLECT_MODE_FALL,                 $29
.define COLLECT_MODE_CHEST_NOFLAG,         $30
.define COLLECT_MODE_CHEST,                $38
.define COLLECT_MODE_DIVE,                 $49
.define COLLECT_MODE_CHEST_MAP_OR_COMPASS, $68
.define COLLECT_MODE_DIG,                  $5a