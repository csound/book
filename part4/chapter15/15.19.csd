<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

 giSine ftgen 0, 0, 65536, 10, 1 
 giCosine ftgen 0, 0, 8193, 9, 1, 1, 90 
 giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1
 giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1 

 instr 1
 kamp adsr 0.0001, 0.3, 0.5, 0.5
 kamp = kamp*ampdbfs(-6)
 asamplepos1 = 0
 kGrainRate = cpsmidinn(p4)
 async = 0.0 ; (disable external sync)
 kGrainDur = 0.5
 kgdur = (kGrainDur*1000)/kGrainRate
 ka_d_ratio = 0.5
 kwavfreq = kGrainRate*2
 kwavekey1 = 1
 awavfm = 0 ; (FM disabled)
 krandommask = 0

 ; pitch masking tables
 iwavfreqstarttab ftgentmp 0, 0, 16, -2, 0, 1, 1,1 
 iwavfreqendtab ftgentmp 0, 0, 16, -2, 0, 1, 1,1 

 koctaviation linseg 1, 0.5, 1, p3-0.5 , 2
 tablew koctaviation, 2, iwavfreqstarttab
 tablew koctaviation, 2, iwavfreqendtab

 a1 partikkel kGrainRate, 0, -1, async, 0, -1, 
     giSigmoRise, giSigmoFall, 0, ka_d_ratio, kgdur, 
     kamp, -1, kwavfreq, 0.5, 
     iwavfreqstarttab, iwavfreqendtab, awavfm, 
     -1, -1, giCosine, 1, 1, 1, -1, krandommask, 
     giSine, giSine, giSine, giSine, -1, 
     asamplepos1, asamplepos1, asamplepos1, asamplepos1, 
     kwavekey1, kwavekey1, kwavekey1, kwavekey1, 100
 out a1
 endin

</CsInstruments>
<CsScore>
i1 0 2 48 
i1 2 . 51 
i1 4 . 53 
i1 6 4 60 
</CsScore>
</CsoundSynthesizer>
