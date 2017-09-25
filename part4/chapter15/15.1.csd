<CsoundSynthesizer>
<CsInstruments>

giSoundfile ftgen 0,0,0,1,"fox.wav",0,0,0			
giSigmoWin ftgen 0,0,8193,19,1,0.5,270,0.5		

instr 1
 kprate linseg 1,2.3,1,0,-0.5,2,-0.5,0,1,1,1
 kGrainRate = 25.0
 kGrainDur = 2.0
 kgdur = kGrainDur/kGrainRate		
 kPitch = 1
 a1 syncgrain ampdbfs(-8),kGrainRate,kPitch,kgdur,
    kprate/kGrainDur,giSoundfile,giSigmoWin,100
 out a1
endin

schedule(1,0,5.75)
</CsInstruments>
<CsScore>
e 1
</CsScore>
</CsoundSynthesizer>
