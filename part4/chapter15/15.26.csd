<CsoundSynthesizer>
<CsInstruments>

 nchnls = 2
 giSine ftgen 0, 0, 65536, 10, 1 
 giCosine ftgen 0, 0, 8193, 9, 1, 1, 90 
 giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1
 giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1 

 instr 1
 iamp = ampdbfs(-12)
 kamp linen iamp, 0.01, p3, 1 
 asamplepos1 = 0
 kGrainRate1 = 7
 async = 0.0 ; (disable external sync)
 kGrainDur = 1.0
 kgdur1 = (kGrainDur*1000)/kGrainRate1
 ka_d_ratio = 0.1
 kwavfreq1 = 880
 kwavekey1 = 1
 awavfm = 0 ; (FM disabled)
 id1 = 1
 a1 partikkel kGrainRate1, 0, -1, async, 0, -1, 
     giSigmoRise, giSigmoFall, 0, ka_d_ratio, kgdur1, 
     1, -1, kwavfreq1, 0.5, -1, -1, awavfm,  -1, -1, 
     giCosine, 1, 1, 1, -1, 0, giSine, giSine, giSine, 
     giSine, -1, asamplepos1, asamplepos1, asamplepos1, 
     asamplepos1, kwavekey1, kwavekey1, kwavekey1, 
     kwavekey1, 100, id1

 async1, aphase1 partikkelsync, id1

 kphaSyncGravity linseg 0, 2, 0, p3-5, 1, 1, 1
 aphase2 init 0
 ksync2 init 0
 asyncPolarity limit (int(aphase2*2)*2)-1, -1, 1
 asyncStrength =
    abs(abs(aphase2-0.5)-0.5)*asyncPolarity
 ; Use the phase of partikkelsync instance 2 to find 
 ; sync polarity for partikkel instance 2.
 ; If the phase of instance 2 is less than 0.5, 
 ; we want to nudge it down when synchronizing,
 ; and if the phase is > 0.5
 ; we want to nudge it upwards.
 async2in = async1*kphaSyncGravity*asyncStrength 

 ; adjust grain rate of second partikkel instance 
 ; to approach that of the first instance
 krateSyncGravity = 0.0005 
 ksyncPulseCount init 0
 ksync1 downsamp async1, ksmps 
 ksync1 = ksync1*ksmps 
 ; count the number of master clock pulses 
 ; within this (slave)clock period
 ksyncPulseCount = ksyncPulseCount + ksync1 
 ksyncRateDev init 0
 ksyncStrength downsamp asyncStrength
 ; sum of deviations within this (slave)clock period
 ksyncRateDev = ksyncRateDev + (ksyncStrength*ksync1) 

 ; adjust rate only on slave clock tick
 if ksync2 > 0 then 
 ; if no master clock ticks, my tempo is too high
 if ksyncPulseCount == 0 then 
 krateAdjust = -krateSyncGravity
 ; if more than one master clock tick,
 ; my tempo is too low
 elseif ksyncPulseCount > 1 then 
 krateAdjust = krateSyncGravity
 ; if exactly one master clock tick, 
 ; it depends on the phase value at the time 
 ; when the master clock tick was received
 elseif ksyncPulseCount == 1 then 
 krateAdjust = ksyncRateDev*krateSyncGravity*0.02
 endif

 ; Reset counters on (slave)clock tick
 ksyncPulseCount = 0 
 ksyncRateDev = 0
 endif 
 
 kGrainRate2 init 2
 kGrainRate2 = kGrainRate2 +
         (krateAdjust*kGrainRate2*0.1)
 kgdur2 = (kGrainDur*1000)/kGrainRate2
 kwavfreq2 = 440
 id2 = 2
 a2 partikkel kGrainRate2, 0, -1, async2in, 0, -1,
     giSigmoRise, giSigmoFall, 0, ka_d_ratio, kgdur2,
     1, -1, kwavfreq2, 0.5, -1, -1, awavfm, -1, -1, 
     giCosine, 1, 1, 1, -1, 0, giSine, giSine, giSine, 
     giSine, -1, asamplepos1, asamplepos1, asamplepos1, 
     asamplepos1, kwavekey1, kwavekey1, kwavekey1, 
     kwavekey1, 100, id2

 async2, aphase2 partikkelsync, id2
 ksync2 downsamp async2, ksmps
 ksync2 = ksync2*ksmps
 
 ; partikkel instance 1 outputs to the left
 ; instance 2 outputs to the right
 outs a1*kamp, a2*kamp
 endin

</CsInstruments>
<CsScore>
i1 0 20
</CsScore>
</CsoundSynthesizer>
