IF (STATUS = "PRELAUNCH") {
   CORE:PART:GETMODULE("kOSProcessor"):DOEVENT("Open Terminal").
   SWITCH TO ARCHIVE.

   PRINT "'RUN LAUNCH.' to begin.".
}