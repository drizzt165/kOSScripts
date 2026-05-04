runOncePath("0:/lib/utils.ks").
//Initiate launch
passControlToMechjeb().
stage.

// Wait for apo to deploy payload and arm parachute.
deployPayloadAtApo().

PRINT "Payload detached... Good luck! Bye.".

