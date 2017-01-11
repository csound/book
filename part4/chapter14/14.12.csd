<CsoundSynthesizer>
<CsInstruments>
gS_ats = "fox.ats"
giDur ATSinfo gS_ats, 7 ;duration 
giBark[] fillarray 0,100,200,300,400,510,630,770,920,
             1080,1270,1480,1720,2000,2320,2700,
              3150,3700,4400,5300,6400,7700,9500,
              12000,15500,20000

instr noise_bands
 p3 = giDur*5
 gkTime transeg 0, p3, -3, giDur
 iBand = 1
 until iBand > 23 do ;limit because of mode max freq
  iBw = giBark[iBand] - giBark[iBand-1]
  iCfq = (giBark[iBand] + giBark[iBand-1]) / 2
  schedule "noise_band_gauss", 0, p3, iBand, iBw, iCfq
  iBand += 1
 od
endin

instr noise_band_gauss
 xtratim 2
 kEnergy ATSreadnz gkTime, gS_ats, p4
 aNoise gauss sqrt(portk(kEnergy,gkTime/20))
 aFilt mode aNoise, p6, p6/p5
 out aFilt/12
endin
schedule("noise_bands",0,1)
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
