<CsoundSynthesizer>
<CsInstruments>

 nchnls = 2

 giSine ftgen 0, 0, 65536, 10, 1 
 giCosine ftgen 0, 0, 8193, 9, 1, 1, 90 
 ; (additive) saw wave
 giSaw ftgen 0, 0, 65536, 10, 1, 1/2, 1/3, 1/4, 1/5, 
       1/6, 1/7, 1/8,  1/9, 1/10, 1/11, 1/12, 1/13, 
       1/14, 1/15, 1/16, 1/17, 1/18, 1/19, 1/20 
 giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1
 giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1 

 instr 1
 kamp = ampdbfs(-12)
 asamplepos1 = 0
 kGrainRate transeg p4, 0.5, 1, p4, 4, -1, p5, 1, 1, p5 
 async = 0.0 ; (disable external sync)
 kGrainDur = 0.5
 kgdur = (kGrainDur*1000)/kGrainRate
 ka_d_ratio = 0.5
 kwavfreq = 880
 kwavekey1 = 1
 awavfm = 0 ; (FM disabled)
 krandommask = 0

 ; channel masking table, 
 ; output routing for individual grains 
 ; (zero based, a value of 0.0 routes to output 1)
 ; output 0 and 1 are used for stereo channels L and R,
 ; output 2 and 3 for reverb left and right
 ; output 4 and 5 is sent to two different filters
 ichannelmasks ftgentmp 0, 0, 16, -2, 0, 9, 
       0, 1, 0, 1, 2, 1, 0, 1, 0, 3

 ; randomly route some grains (mask index 4 or 5)  
 ; to the first filter
 kfilt1control randh 1, kGrainRate, 0.1 
 kfilt1trig = (abs(kfilt1control) > 0.2 ? 4 : 0) 
 kfilt1trig =
     (abs(kfilt1control) > 0.6 ? 5 : kfilt1trig) 
 if kfilt1trig > 0 then
 tablew 4, kfilt1trig, ichannelmasks ; send to output 4
 else
 tablew 0, 4, ichannelmasks ; reset to original values
 tablew 1, 5, ichannelmasks 
 endif

 ; randomly route some grains (mask index 9 or 10)  
 ; to the second filter
 kfilt2control randh 1, kGrainRate, 0.2 
 kfilt2trig = (abs(kfilt2control) > 0.2 ? 9 : 0) 
 kfilt2trig =
    (abs(kfilt2control) > 0.6 ? 10 : kfilt2trig) 
 if kfilt2trig > 0 then
 tablew 5, kfilt2trig, ichannelmasks ; send to output 5
 else
 tablew 1, 9, ichannelmasks ; reset to original values
 tablew 0, 10, ichannelmasks
 endif

 a1,a2,a3,a4,a5,a6 partikkel kGrainRate, 0, -1, async, 
   0, -1, giSigmoRise, giSigmoFall, 0, ka_d_ratio, 
   kgdur, kamp, -1, kwavfreq, 0.5, -1, -1, awavfm, 
   -1, -1, giCosine, 1, 1, 1, ichannelmasks, 
   krandommask, giSaw, giSaw, giSaw, giSaw, -1, 
   asamplepos1, asamplepos1, asamplepos1,asamplepos1, 
    kwavekey1, kwavekey1, kwavekey1, kwavekey1, 100

 outs a1,a2
 chnset a3, "reverbLeft"
 chnset a4, "reverbRight"
 chnset a5, "filter1"
 chnset a6, "filter2"
 endin

 instr 11
 a1 chnget "reverbLeft"
 a2 chnget "reverbRight"
 ar1,ar2 freeverb a1,a2, 0.8, 0.3
 idry = 0.2
 ar1 = ar1+(a1*idry)
 ar2 = ar2+(a2*idry)
 outs ar1,ar2
 a0 = 0
 chnset a0, "reverbLeft" 
 chnset a0, "reverbRight" 
 endin
 
 instr 12
 a1 chnget "filter1"
 a2 chnget "filter2"
 afilt1 butterlp a1, 800
 afilt2 butterhp a2, 2000
 asum = afilt1+afilt2
 outs asum, asum
 a0 = 0
 chnset a0, "filter1" 
 chnset a0, "filter2" 
 endin
 
</CsInstruments>
<CsScore>
i1 0 20 330 6
i11 0 24 ; reverb
i12 0 24 ; filters
</CsScore>
</CsoundSynthesizer>
