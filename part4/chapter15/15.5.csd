<CsoundSynthesizer>
<CsInstruments>
giSine	ftgen 0, 0, 65536, 10, 1		
giCosine ftgen 0, 0, 8193, 9, 1, 1, 90		
giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1
giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1	

instr 1
 kamp  adsr 2, 1, 0.5, 2
 kamp  = kamp*ampdbfs(-10)
 asamplepos1 = 0
 kGrainRate = randh(30,30)+32
 async = 0.0 ; (disable external sync)
 kGrainDur = randh(0.5,30)+0.7
 kgdur = (kGrainDur*1000)/kGrainRate
 ka_d_ratio = 0.2
 kwavfreq = randh(300,30)+400
 kwavekey1 = 1
 awavfm = 0 ; (FM disabled)
 a1 partikkel kGrainRate, 0, -1, async, 0, -1,
     giSigmoRise, giSigmoFall, 0, ka_d_ratio, kgdur,
     kamp, -1, kwavfreq, 0.5, -1, -1, awavfm, 
     -1, -1, giCosine, 1, 1, 1, -1, 0, 
     giSine, giSine, giSine, giSine, -1,
     asamplepos1,asamplepos1,asamplepos1,asamplepos1, 
     kwavekey1, kwavekey1, kwavekey1, kwavekey1, 100
 out a1
endin

schedule(1,0,6)
</CsInstruments>
<CsScore>
e 1
</CsScore>
</CsoundSynthesizer>
