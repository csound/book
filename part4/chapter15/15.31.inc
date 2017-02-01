waveamptab ftgentmp 0, 0, 32, -2, 0, 0, 1, 0, 0, 0, 0
iwaveamptab1 ftgentmp 0, 0, 32, -2, 0, 0, 1, ampdbfs(-7), ampdbfs(-9), ampdbfs(-9), 0
iwaveamptab2 ftgentmp 0, 0, 32, -2, 0, 0, 1, ampdbfs(-12), ampdbfs(-9), ampdbfs(-12), 0
iwavetabs ftgentmp 0, 0, 2, -2, iwaveamptab1, iwaveamptab2
kwavemorf linseg 0, 1, 0, 2, 1, 1, 1
ftmorf kwavemorf, iwavetabs, iwaveamptab