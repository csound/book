<CsoundSynthesizer>
<CsInstruments>

giSoundfile ftgen 0,0,0,1,"fox.wav",0,0,0
giSine ftgen 0,0,65536,10,1		
giCosine ftgen 0,0,8193,9,1,1,90		
giSigmoRise ftgen 0,0,8193,19,0.5,1,270,1
giSigmoFall ftgen 0,0,8193,19,0.5,1,90,1	

instr 1
 asamplepos1 linseg 0,2.3,0.84,2,0.478,1.47,1.0
 kGrainRate = 25.0
 async = 0.0 ; (disable external sync)
 kGrainDur = 2.0
 kgdur = (kGrainDur*1000)/kGrainRate
 kwavfreq = 1
 kwavekey1 = 1/(tableng(giSoundfile)/sr)
 awavfm = 0 ; (FM disabled)
 a1 partikkel kGrainRate,0,-1,async,0,-1,
    giSigmoRise,giSigmoFall,0,0.5,kgdur,
    ampdbfs(-13),-1,kwavfreq,0.5,-1,-1,awavfm,
    -1,-1,giCosine,1,1,1,-1,0,\
    giSoundfile,giSoundfile,giSoundfile,giSoundfile,-1,
    asamplepos1,asamplepos1,asamplepos1,asamplepos1,
    kwavekey1,kwavekey1,kwavekey1,kwavekey1,100
 out a1
endin

schedule(1,0,5.75)
</CsInstruments>
<CsScore>
e 1
</CsScore>
</CsoundSynthesizer>
