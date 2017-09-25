<CsoundSynthesizer>
<CsInstruments>

 giSoundfile ftgen 0, 0, 0, 1,"fox.wav",0,0,0 
 giSine ftgen 0, 0, 65536, 10, 1 
 giCosine ftgen 0, 0, 8193, 9, 1, 1, 90 
 ; (additive) saw wave
 giSaw ftgen 0, 0, 65536, 10, 1, 1/2, 1/3, 1/4, 1/5, 
       1/6, 1/7, 1/8,  1/9, 1/10, 1/11, 1/12, 1/13, 
       1/14, 1/15, 1/16, 1/17, 1/18, 1/19, 1/20 
 giNoiseUni ftgen 0, 0, 65536, 21, 1, 1 
 giNoise ftgen 0, 0, 65536, 24, giNoiseUni, -1, 1 
 giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1
 giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1 

 instr 1
 kamp = ampdbfs(-3)
 kwaveform1 = giSine
 kwaveform2 = giSaw
 kwaveform3 = giNoise
 kwaveform4 = giSoundfile
 asamplepos1 = 0.0 ; phase of single cycle waveform
 asamplepos2 = 0.0
 asamplepos3 = 0.0
 asamplepos4 = 0.27; start read position in sound file
 
 kGrainRate = 8
 async = 0.0 ; (disable external sync)
 kGrainDur = 1.0
 kgdur = (kGrainDur*1000)/kGrainRate
 ka_d_ratio = 0.5
 kwavfreq = 1 ; set master transposition to 1
 ; source 1 and 2 are single cycle source waveforms,
 ; so the pitch is determined by cycles per second
 kwavekey1 = 440 ; (a single cycle sine)
 kwavekey2 = 440 ; (a single cycle saw)
 ; source 3 and 4 are tables with audio sample data,
 ; so the playback frequency should be relative to
 ; table length and sample rate
 kwavekey3 = 1/(tableng(kwaveform3)/sr); (noise at sr)
 kwavekey4 = 1/(tableng(kwaveform4)/sr); (soundfile)
 awavfm = 0 ; (FM disabled)
 krandommask = 0

 ; wave mixing by writing to the wave mask table
 iwaveamptab ftgentmp 0, 0, 32, -2, 0, 0, 1,0,0,0,0 
 kamp1 linseg 1, 1, 1, 1, 0, 5, 0, 1, 1, 1, 1
 kamp2 linseg 0, 1, 0, 1, 1, 1, 1, 1, 0, 1, 0
 kamp3 linseg 0, 3, 0, 1, 1, 1, 1, 1, 0, 1, 0
 kamp4 linseg 0, 5, 0, 1, 1, 1, 1, 1, 0, 1, 0
 tablew kamp1, 2, iwaveamptab
 tablew kamp2, 3, iwaveamptab
 ; we do additional scaling of source 3 and 4, 
 ; to make them appear more equal in loudness
 tablew kamp3*0.7, 4, iwaveamptab 
 tablew kamp4*1.5, 5, iwaveamptab 

 a1 partikkel kGrainRate, 0, -1, async, 0, -1, 
     giSigmoRise, giSigmoFall, 0, ka_d_ratio, 
     kgdur, kamp, -1, kwavfreq, 0.5, -1, -1, 
     awavfm, -1, -1, giCosine, 1, 1, 1, -1, 
     krandommask, kwaveform1, kwaveform2, 
     kwaveform3, kwaveform4, iwaveamptab, 
     asamplepos1, asamplepos2, asamplepos3, 
     asamplepos4,  kwavekey1, kwavekey2, 
     kwavekey3, kwavekey4, 100

 out a1
 endin

schedule(1,0,10)
 
</CsInstruments>
<CsScore>
e 1
</CsScore>
</CsoundSynthesizer>
