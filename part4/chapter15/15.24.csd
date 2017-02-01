<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

 giSine ftgen 0, 0, 65536, 10, 1 
 giCosine ftgen 0, 0, 8193, 9, 1, 1, 90 
 giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1
 giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1 

 instr 1
 iamp = ampdbfs(-12)
 kamp linen iamp, 0.01, p3, 1 
 asamplepos1 = 0
 kGrainRate = p4
 async = 0.0 ; (disable external sync)
 kdistribution line 0, p3-1, 1
 idisttab ftgen 0, 0, 32768, 7, 0, 32768, 1 
 kGrainDur = 1.0
 kgdur = (kGrainDur*1000)/kGrainRate
 ka_d_ratio = 0.1
 kwavfreq = 880
 kwavekey1 = 1
 awavfm = 0 ; (FM disabled)
 a1 partikkel kGrainRate, kdistribution, idisttab, 
       async, 0, -1, giSigmoRise, giSigmoFall, 0, 
       ka_d_ratio, kgdur, 1, -1, kwavfreq, 0.5, -1, -1, 
       awavfm, -1, -1, giCosine, 1, 1, 1, -1, 0, 
       giSine, giSine, giSine, giSine, -1, asamplepos1, 
       asamplepos1, asamplepos1, asamplepos1, 
       kwavekey1, kwavekey1, kwavekey1, kwavekey1, 100
 out a1*kamp
 endin

</CsInstruments>
<CsScore>
i1 0 4 440
i1 4 10 8 
</CsScore>
</CsoundSynthesizer>
