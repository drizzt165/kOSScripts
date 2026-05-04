// Setup mechjeb
SET mj to addons:mj.

// *****************************************
// GLOBAL FUNCTIONS
// *****************************************

GLOBAL FUNCTION passControlToMechjeb {
    // Enable mechjeb ascent module
    SET mj:ascent:ENABLED to TRUE.
    // Pass control to mechjeb
    UNLOCK STEERING.
    UNLOCK THROTTLE.
}

GLOBAL FUNCTION deployPayloadAtApo {
    WAIT UNTIL SHIP:VERTICALSPEED < 0 and STAGE:READY.
    stage.
    wait 0.
}