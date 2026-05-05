SET baseShipPath TO "0:/ShipScripts/".

// Run ship specific script
IF SHIP:NAME:STARTSWITH("Aerobee-") {
    PRINT "Running aerobee sounding rocket script...".
    RunPath(baseShipPath + "AerobeeSoundingRockets.ks").
} ELSE {
    IF EXISTS(baseShipPath + SHIP:NAME + ".ks") {
        RunPath(baseShipPath + SHIP:NAME + ".ks").
    } ELSE {
        PRINT "No launch script found for this ship. Please create one at " + baseShipPath + SHIP:NAME + ".ks".
    }
}
