<CsoundSynthesizer>
<CsInstruments>
ifn ftgen 1,0,514,7,0,128,1,256,1,128,1 
instr 1
 Sf = "violac3.wav"
 p3 = filelen(Sf)
 a1 diskin2 Sf,1
 fs1 pvsanal a1,1024,128,1024,1
 ih,kt pvsbuffer fs1, 2
 fs2 pvsbufread2 kt,ih,1,1
 a2 pvsynth fs2
    out a2
endin
schedule(1,0,1)
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
