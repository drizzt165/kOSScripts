runOncePath("0:/lib/utils.ks").
//Initiate launch
passControlToMechjeb().
stage.

IF hasChute() {
    waitUntilApoapsis().
    stage.
}
