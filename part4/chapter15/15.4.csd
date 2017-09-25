<CsoundSynthesizer>
<CsInstruments>
giSine	ftgen	0, 0, 65536, 10, 1		
giCosine ftgen	0, 0, 8193, 9, 1, 1, 90		
giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1
giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1	

instr 1
 kamp adsr 0.0001, 0.3, 0.5, 0.5
 kamp = kamp*ampdbfs(-6)
 asamplepos1 = 0
 kGrainRate = cpsmidinn(p4)
 async = 0.0 ; (disable external sync)
 kGrainDur = 1.0
 kgdur = (kGrainDur*1000)/kGrainRate
 ka_d_ratio = p5
 kwavfreq line 200, p3, 500
 kwavekey1 = 1
 awavfm	= 0 ; (FM disabled)
 a1 partikkel kGrainRate, 0, -1, async, 0, -1, 
     giSigmoRise, giSigmoFall, 0, ka_d_ratio, kgdur,
     kamp, -1, kwavfreq, 0.5, -1, -1, awavfm, 
     -1, -1, giCosine, 1, 1, 1, -1, 0, 
     giSine, giSine, giSine, giSine, -1, 
     asamplepos1,asamplepos1,asamplepos1,asamplepos1, 
     kwavekey1, kwavekey1, kwavekey1, kwavekey1, 100
  out	a1
endin

schedule(1,0,1,48,0.5)
schedule(1,1,1,51,0.5)
schedule(1,2,1,53,0.5)
schedule(1,3,1,55,0.5)
schedule(1,4,3,58,0.5)

schedule(1,8,1,48,0.1)
schedule(1,9,1,51,0.1)
schedule(1,10,1,53,0.1)
schedule(1,11,1,55,0.1)
schedule(1,12,3,58,0.1)
</CsInstruments>
<CsScore>
e 13
</CsScore>
</CsoundSynthesizer>
