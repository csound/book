<CsoundSynthesizer>
<CsInstruments>
instr 1
 Sname = p5
 p3 = filelen(Sname)
 asig  diskin Sname
 kcps,kamp ptrack asig, 1024
 kcps port kcps,0.01 
 amod oscili p4*kcps,kcps*2.33
 fs1 pvsanal asig,1024,1,1024,1
 fs2 pvshift fs1,amod,0
 ahr pvsynth fs2
 out ahr
endin
schedule(1,0,0,5,"cornetto.wav")
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
