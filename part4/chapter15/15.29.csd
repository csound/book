<CsoundSynthesizer>
<CsInstruments>

 giSine ftgen 0, 0, 65536, 10, 1 
 giCosine ftgen 0, 0, 8193, 9, 1, 1, 90 
 giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1
 giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1 
 giSoundfile ftgen 0, 0, 0, 1,"Vocphrase.wav",0,0,0 

 instr 1
 kamp adsr 0.0001, 0.3, 0.5, 0.5
 kamp = kamp*ampdbfs(-6)
 isoundDur = filelen("Vocphrase.wav")
 asamplepos1 phasor 1/isoundDur
 aref loscil 1, 1, giSoundfile, 1
 kcps, krms pitchamdf aref, 100, 800 
 kGrainRate limit kcps, 100, 800
 async = 0.0 ; (disable external sync)
 kGrainDur = 2.0
 kgdur = (kGrainDur*1000)/kGrainRate
 ka_d_ratio = 0.5
 kwavfreq = semitone(p4)
 kwavekey1 = 1/isoundDur
 awavfm = 0 ; (FM disabled)
 a1 partikkel kGrainRate, 0, -1, async, 0, -1, 
     giSigmoRise, giSigmoFall, 0, ka_d_ratio, kgdur, 
     kamp, -1, kwavfreq, 0.5, -1, -1, awavfm, 
     -1, -1, giCosine, 1, 1, 1, -1, 0, giSoundfile, 
     giSoundfile, giSoundfile, giSoundfile, -1, 
     asamplepos1,asamplepos1,asamplepos1,asamplepos1,
     kwavekey1, kwavekey1, kwavekey1, kwavekey1, 100
 out a1
 endin

schedule(1,0,7,0)
schedule(1,7,7,4)
schedule(1,14,7,8)
schedule(1,21,7,-4)
schedule(1,28,7,-8)

</CsInstruments>
<CsScore>
e 29
</CsScore>
</CsoundSynthesizer>
