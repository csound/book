<CsoundSynthesizer>
<CsInstruments>
gS_ats = "fox.ats"
giDur ATSinfo gS_ats, 7
giBark[] fillarray 0,100,200,300,400,510,630,770,920,
             1080,1270,1480,1720,2000,2320,2700,
             3150,3700,4400,5300,6400,
             7700,9500,12000,15500,20000

instr noise_bands
 p3 = giDur
 gktime line 0, giDur, giDur
 iBand = 1
 until iBand > 25 do
  iBw = giBark[iBand] - giBark[iBand-1]
  iCfq = (giBark[iBand] + giBark[iBand-1]) / 2
  schedule "noise_band", 0, giDur, iBand, iBw, iCfq
  iBand += 1
 od
endin

instr noise_band
 kEnergy ATSreadnz gktime, gS_ats, p4
 aNoise randi sqrt(kEnergy), p5
 out aNoise * poscil:a(.2, p6)
endin
schedule("noise_bands",0,1)
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
