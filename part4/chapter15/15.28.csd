<CsoundSynthesizer>
<CsInstruments>
 sr = 48000
 ksmps = 32

 giSine ftgen 0, 0, 65536, 10, 1 
 giCosine ftgen 0, 0, 8193, 9, 1, 1, 90 
 giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1
 giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1 

 instr 1
 kamp linen 1, 0.1, p3, 0.1
 kamp = kamp*ampdbfs(-3)
 asamplepos1 = 0
 ; invert phase to retain constant
 ; power during crossfade
 asamplepos2 = 0.5 
 asamplepos3 = 0
 kGrainRate = p4
 async = 0.0 ; (disable external sync)
 kGrainDur = 1.0
 kgdur = (kGrainDur*1000)/kGrainRate
 ka_d_ratio = 0.5
 awavfm = 0 ; (FM disabled)
 kwavfreq = 1
 kwavekey1 = p4*2
 kwavekey2 = p4*3
 kwavekey3 = p4*4
 ; crossface by using wave mix masks
 iwaveamptab ftgentmp 0, 0, 32, -2, 0, 0, 0,0,0,0,0 
 kamp1 linseg 1, 1, 1, 2, 0, 4, 0
 kamp2 linseg 0, 1, 0, 2, 1, 1, 1, 2, 0, 2, 0
 kamp3 linseg 0, 4, 0, 2, 1, 1, 1
 tablew kamp1, 2, iwaveamptab
 tablew kamp2, 3, iwaveamptab
 tablew kamp3, 4, iwaveamptab 
 a1 partikkel kGrainRate, 0, -1, async, 0, -1, 
     giSigmoRise, giSigmoFall, 0, ka_d_ratio, kgdur, 
     kamp, -1, kwavfreq, 0.5, -1, -1, awavfm, 
     -1, -1, giCosine, 1, 1, 1, -1, 0, 
     giSine, giSine, giSine, giSine, iwaveamptab, 
     asamplepos1,asamplepos2,asamplepos3,asamplepos1, 
     kwavekey1, kwavekey2, kwavekey3, kwavekey1, 100
 out a1
 endin

</CsInstruments>
<CsScore>
i1 0 7 200 
</CsScore>
</CsoundSynthesizer>
