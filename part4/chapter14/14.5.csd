<CsoundSynthesizer>
<CsInstruments>
instr 1
 isiz = 2048
 Sf = "cornetto.wav"
 p3 = filelen(Sf)
 asig diskin2 Sf,1
 fs1 pvsanal asig,isiz,isiz/8,isiz,1
 fs2 pvscale fs1,p4,1
 ahr pvsynth fs2
 adi delay  asig,isiz*1.125/sr
    out ahr*p6+adi*p5
endin
schedule(1,0,1,1.25,0.75,0.75)
schedule(1,0,1,.75,0,0.75)
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
