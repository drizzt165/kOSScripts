runOncePath("0:/lib/utils.ks").

set spinTime to 2.

// Enable mechjeb ascent module
SET mj:ascent:ENABLED to TRUE.
stage.

// Wait for first stage to actually begin
WAIT UNTIL mj:info:STAGETIMECURRENT > 0.

// Pass control to mechjeb
UNLOCK STEERING.
UNLOCK THROTTLE.

// Wait until 3 seconds before the end of stage 1
WAIT UNTIL mj:info:STAGETIMECURRENT < spinTime.
PRINT "Performing roll for stability...".

// Initiate roll before seperation
SET SHIP:CONTROL:ROLL to 1.
SET startTime to TIME:SECONDS.
WAIT UNTIL TIME:SECONDS - startTime > spinTime.

// Disable roll and let mechjeb take over
SET SHIP:CONTROL:ROLL to 0.

// Wait for mission sucess condition
WAIT UNTIL (SHIP:AIRSPEED > 3000 and SHIP:apoapsis > 140000) or VERTICALSPEED < 0.

// Turn off engine to prevent excessive reentry heating
LOCK THROTTLE to 0.

// Decouple parachute and science equipment for rentry.
PRINT "Coasting to apoapsis...".
WAIT UNTIL VERTICALSPEED < 0 and STAGE:READY.
STAGE.
WAIT 0.

