<CsoundSynthesizer>
<CsInstruments>
gS_file = "fox.ats"
giPartials ATSinfo gS_file, 3
giFilDur ATSinfo gS_file, 7
giSine ftgen 0, 0, 65536, 10, 1

instr lazy_dog
  kLev1 randomi .2, .8, .2
  kLev2 = 1 - kLev1
  kTimPnt linseg 1.67, p3, giFilDur-0.2
  ATSbufread kTimPnt, randi:k(.1,.2,0,1), 
                      gS_file, giPartials/4, 1, 3
  aCross ATScross kTimPnt+randomi:k(0.01,0.2,0.1), 1, 
                      gS_file, giSine, kLev2, 
                      kLev1, giPartials/4, 0, 2
  outs aCross*2
endin

schedule("lazy_dog",0,100)
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
