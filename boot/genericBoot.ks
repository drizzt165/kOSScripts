IF (STATUS = "PRELAUNCH") {
   CORE:PART:GETMODULE("kOSProcessor"):DOEVENT("Open Terminal").
   SWITCH TO 0.

   PRINT "'RUN LAUNCH.' to begin.".
}