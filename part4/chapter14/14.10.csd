<CsoundSynthesizer>
<CsInstruments>
gS_ats = "fox.ats"
giDur ATSinfo gS_ats, 7 ;duration 

instr noise_band
 iBand = 5 ;400..510 Hz 
 p3 = giDur
 ktime line 0, giDur, giDur
 kEnergy ATSreadnz ktime, gS_ats, iBand 
 aNoise randi sqrt(kEnergy), 55
 aSine poscil .25, 455
 out aNoise*aSine
endin
schedule("noise_band",0,1)
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
