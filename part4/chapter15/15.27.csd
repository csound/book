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
 kGrainRate = p4
 async = 0.0 ; (disable external sync)
 kGrainDur = 1.0
 kgdur = (kGrainDur*1000)/kGrainRate
 ka_d_ratio = 0.5
 ipitch1 = p4*2
 ipitch2 = p4*3
 ipitch3 = p4*4
 kwavfreq linseg ipitch1, 1, ipitch1, 2, 
       ipitch2, 1, ipitch2, 2, ipitch3, 1, ipitch3
 kwavekey1 = 1
 iwaveamptab ftgentmp 0, 0, 32, -2, 0, 0, 1,0,0,0,0 
 awavfm = 0 ; (FM disabled)
 a1 partikkel kGrainRate, 0, -1, async, 0, -1, 
     giSigmoRise, giSigmoFall, 0, ka_d_ratio, kgdur,
     kamp, -1, kwavfreq, 0.5, -1, -1, awavfm, 
     -1, -1, giCosine, 1, 1, 1, -1, 0, 
     giSine, giSine, giSine, giSine, iwaveamptab, 
     asamplepos1,asamplepos1,asamplepos1,asamplepos1, 
     kwavekey1, kwavekey1, kwavekey1, kwavekey1, 100
 out a1
 endin

</CsInstruments>
<CsScore>
i1 0 7 200
</CsScore>
</CsoundSynthesizer>
