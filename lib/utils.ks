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

GLOBAL FUNCTION waitUntilApoapsis {
    WAIT UNTIL SHIP:VERTICALSPEED < 0 and STAGE:READY.
}

GLOBAL FUNCTION hasChute {
    // Wait for apo to deploy payload and arm parachute.
    FOR PART IN SHIP:PARTS {
        // Check for real chute mod part
        IF PART:NAME:CONTAINS("RC.Stack") {
            RETURN True.
        }
    }
    RETURN False.
}

GLOBAL FUNCTION getPitch {
    RETURN (90 - vectorAngle(SHIP:FACING:forevector, UP:forevector)).
}

GLOBAL FUNCTION getManeuverError {
    RETURN vectorAngle(SHIP:FACING:forevector, NEXTNODE:burnvector).
}