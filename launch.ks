SET baseShipPath TO "0:/ShipScripts/".

// Run ship specific script
IF SHIP:NAME:STARTSWITH("Aerobee-") {
    PRINT "Running aerobee sounding rocket script...".
    RunPath(baseShipPath + "AerobeeSoundingRockets.ks").

} ELSE IF SHIP:NAME:STARTSWITH("V-2-Mk3-AdvBio") {
    PRINT "Running V-2-Mk3-AdvBio-* script...".
    RunPath(baseShipPath + "V-2-Mk3-AdvBio.ks").
} ELSE {
    IF EXISTS(baseShipPath + SHIP:NAME + ".ks") {
        RunPath(baseShipPath + SHIP:NAME + ".ks").
    } ELSE {
        PRINT "No launch script found for this ship. Please create one at " + baseShipPath + SHIP:NAME + ".ks".
    }
}
