<CsoundSynthesizer>
<CsInstruments>

 sr = 44100
 ksmps = 10
 nchnls = 2
 0dbfs = 1

 ; load audio files
 giVocal ftgen 0, 0, 0, 1, "Vocphrase.wav", 0, 0, 0
 giChoir ftgen 0, 0, 0, 1, "Choir.wav", 0, 0, 0 
 giCello ftgen 0, 0, 0, 1, "Cello.wav", 0, 0, 0 
 giVibLine ftgen 0, 0, 0, 1, "VibDist.wav", 0, 0, 0 

 ; classic waveforms
 giSine ftgen 0,0,65537,10,1 
 giCosine ftgen 0,0,8193,9,1,1,90 
 giTri ftgen 0,0,8193,7,0,2048,1,4096,-1,2048,0

 ; grain envelope tables
 giSigmoRise ftgen 0,0,8193,19,0.5,1,270,1 
 giSigmoFall ftgen 0,0,8193,19,0.5,1,90,1 
 giExpFall ftgen 0,0,8193,5,1,8193,0.00001 
 giTriangleWin ftgen 0,0,8193,7,0,4096,1,4096,0 

 ; asynchronous clock UDO
 opcode probabilityClock, a, k
 kdens xin
 setksmps 1
 krand rnd31 1, 1
 krand = (krand*0.5)+0.5
 ktrig = (krand < kdens/kr ? 1 : 0)
 atrig upsamp ktrig
 xout atrig
 endop

 instr 1

 ; * use instrument running time
 ; as the morphing "index"
 kmorftime timeinsts 

 ; * source waveform selection automation
 ; single-cycle waveforms must
 ; be transposed differently 
 ; than sampled waveforms,
 ; hence the kwaveXSingle variable
 kwaveform1 = (kmorftime < 30 ? giVocal : giSine)
 kwave1Single = (kmorftime < 30 ? 0 : 1)
 kwaveform2 = (kmorftime < 51 ? giSine : giChoir)
 kwave2Single = (kmorftime < 51 ? 1 : 0)
 kwaveform3 = (kmorftime < 51 ? giSine : giCello)
 kwave3Single = (kmorftime < 51 ? 1 : 0)
 kwaveform4 = (kmorftime < 51 ? giSine : giVibLine)
 kwave4Single = (kmorftime < 51 ? 1 : 0)
 kwaveform1 = (kmorftime > 49 ? giVocal : kwaveform1)
 kwave1Single = (kmorftime > 49 ? 0 : kwave1Single)

 ; * get source waveform length 
 ; (used when calculating transposition
 ;  and time pointer)
 kfildur1 = tableng(kwaveform1) / sr
 kfildur2 = tableng(kwaveform2) / sr
 kfildur3 = tableng(kwaveform3) / sr
 kfildur4 = tableng(kwaveform4) / sr

 ; * original pitch for each waveform, 
 ; use if they should be transposed individually
 kwavekey1 linseg 1, 30, 1, 4, 600, 3, 600, 2, 
       400, 11, 400, 0, 1
 kwavekey2 linseg 440, 30, 440, 4, 1040, 3, 1040, 2, 
       1620, 12, 1620, 1, semitone(-5)
 kwavekey3 linseg 440, 30, 440, 4, 2250, 3, 2250, 2, 
       2400, 12, 2400, 1, semitone(10)
 kwavekey4 linseg 440, 30, 440, 4, 2450, 3, 2450, 2, 
       2800, 12, 2800, 1, semitone(-3)

 ; set original key dependant on waveform length 
 ; (only for sampled waveforms,
 ;  not for single cycle waves)
 kwavekey1 = (kwave1Single > 0 ? 
       kwavekey1 : kwavekey1/kfildur1)
 kwavekey2 = (kwave2Single > 0 ? 
       kwavekey2 : kwavekey2/kfildur2)
 kwavekey3 = (kwave3Single > 0 ? 
       kwavekey3 : kwavekey3/kfildur3)
 kwavekey4 = (kwave4Single > 0 ? 
       kwavekey4 : kwavekey4/kfildur4)

 ; * time pointer (phase) for each source waveform.
 isamplepos1 = 0
 isamplepos2 = 0
 isamplepos3 = 0
 isamplepos4 = 0

 ; phasor from 0 to 1, 
 ; scaled to the length of the source waveform
 kTimeRate = 1 
 asamplepos1 phasor kTimeRate / kfildur1 
 asamplepos2 phasor kTimeRate / kfildur2
 asamplepos3 phasor kTimeRate / kfildur3
 asamplepos4 phasor kTimeRate / kfildur4

 ; mix initial phase and moving phase value 
 ; (moving phase only for sampled waveforms, 
 ; single cycle waveforms use static samplepos)
 asamplepos1 = asamplepos1*(1-kwave1Single) +
    isamplepos1
 asamplepos2 = asamplepos2*(1-kwave2Single) +
    isamplepos2
 asamplepos3 = asamplepos3*(1-kwave3Single) +
    isamplepos3
 asamplepos4 = asamplepos4*(1-kwave4Single) +
    isamplepos4

 ; * amplitude
 kdb linseg -3, 8, -3, 4, -10, 2.5, 0, 0.5, -2, 10, 
       -2, 3, -6, 2, -6, 1.3, -2, 1.5, -5, 4, -2
 kenv expseg 1, p3-0.5, 1, 0.4, 0.001 
 kamp = ampdbfs(kdb) * kenv

 ; * grain rate
 kGrainRate linseg 12, 7, 12, 3, 8, 2, 60, 5, 
       110, 22, 110, 2, 14

 ; * sync 
 kdevAmount linseg 0, 42, 0, 4, 1, 2, 1, 2, 0
 async probabilityClock kGrainRate
 async = async*kdevAmount

 ; * distribution 
 kdistribution = 0.0
 idisttab ftgentmp 0, 0, 16, 16, 1, 16, -10, 0

 ; * grain shape
 kGrainDur linseg 2.5, 2, 2.5, 5, 1.0, 5, 5.0, 4, 
       1.0, 1, 0.8, 5, 0.2, 10, 0.8, 7, 0.8, 3, 
       0.1, 5, 0.1, 1, 0.2, 2, 0.3, 3, 2.5
 kduration = (kGrainDur*1000)/kGrainRate
 ksustain_amount linseg 0, 16, 0, 2, 0.9,
       12 ,0.9, 5, 0.2
 ka_d_ratio linseg 0.5, 30, 0.5, 5, 0.25, 4, 0.25, 3, 
       0.1, 7, 0.1, 1, 0.5
 kenv2amt linseg 0, 30, 0, 5, 0.5 

 ; * grain pitch 
 kwavfreq = 1
 awavfm = 0 ;(FM disabled)

 ; * pitch sweep
 ksweepshape = 0.75
 iwavfreqstarttab ftgentmp 0, 0, 16, -2, 0, 0, 1
 iwavfreqendtab ftgentmp 0, 0, 16, -2, 0, 0, 1
 kStartFreq randh 1, kGrainRate 
 kSweepAmount linseg 0, 7, 0, 3, 1, 1, 1, 4, 0 
 kStartFreq = 1+(kStartFreq*kSweepAmount)
 tablew kStartFreq, 2, iwavfreqstarttab

 ; * trainlet parameters
 ; amount of parameter linkage between 
 ; grain dur and train cps
 kTrainCpsLinkA linseg 0, 17, 0, 2, 1
 kTrainCpsLink = (kGrainDur*kTrainCpsLinkA)+
       (1-kTrainCpsLinkA) 
 kTrainCps = kGrainRate/kTrainCpsLink
 knumpartials = 16 
 kchroma linseg 1, 14, 1, 3, 1.5, 2, 1.1

 ; * masking
 ; gain masking table, amplitude for
 ; individual grains
 igainmasks ftgentmp 0, 0, 16, -2, 0, 1, 1, 1
 kgainmod linseg 1, 19, 1, 1, 1, 3, 0.5, 1, 
       0.5, 6, 0.5, 7, 1
 ; write modified gain mask, 
 ; every 2nd grain will get a modified amplitude 
 tablew kgainmod, 3, igainmasks 

 ; channel masking table, 
 ; output routing for individual grains 
 ; (zero based, a value of 0.0
 ;  routes to output 1)
 ichannelmasks ftgentmp 0, 0, 16, -2, 0, 3, 
       0.5, 0.5, 0.5, 0.5

 ; create automation to modify channel masks 
 ; the 1st grain moving left, 
 ; the 3rd grain moving right, 
 ; other grains stays at center.
 kchanmodL linseg 0.5, 25, 0.5, 3, 0.0, 5, 0.0, 4, 0.5
 kchanmodR linseg 0.5, 25, 0.5, 3, 1.0, 5, 1.0, 4, 0.5
 tablew kchanmodL, 2, ichannelmasks 
 tablew kchanmodR, 4, ichannelmasks 
 
 ; amount of random masking (muting)
 ; of individual grains
 krandommask linseg 0, 22, 0, 7, 0, 3, 0.5, 3, 0.0 

 ; wave mix masking. 
 ; Set gain per source waveform per grain, 
 ; in groups of 5 amp values, reflecting 
 ; source1, source2, source3, source4, 
 ; and the 5th slot is for trainlet amplitude.
 iwaveamptab ftgentmp 0, 0, 32, -2, 0, 0, 1,0,0,0,0

 ; vocal sample
 iwaveamptab1 ftgentmp 0, 0, 32, -2, 0, 0, 1,0,0,0,0 
 ; sine
 iwaveamptab2 ftgentmp 0, 0, 32, -2, 0, 0, 0,1,0,0,0 
 ; trainlet
 iwaveamptab3 ftgentmp 0, 0, 32, -2, 0, 0, 0,0,0,0,1 
 ; formant 'a'
 iwaveamptab4 ftgentmp 0, 0, 32, -2, 0, 0, 
       1, ampdbfs(-7), ampdbfs(-9), ampdbfs(-9), 0
 ; formant 'e'
 iwaveamptab5 ftgentmp 0, 0, 32, -2, 0, 0, 
       1, ampdbfs(-12), ampdbfs(-9), ampdbfs(-12), 0
 iwavetabs ftgentmp 0, 0, 8, -2, 
       iwaveamptab1, iwaveamptab2, iwaveamptab3, 
       iwaveamptab4, iwaveamptab5, iwaveamptab1, 
       iwaveamptab2, iwaveamptab1
 kwavemorf linseg 0, 4, 0, 3, 1, 4, 1, 5, 2, 14, 2, 5, 
       3, 2, 3, 2, 4, 8, 4, 1, 5, 1, 6, 1, 6, 1, 7
 ftmorf kwavemorf, iwavetabs, iwaveamptab

 ; generate waveform crossfade automation 
 ; (only enabled after 52 seconds, when we 
 ; want to use the 2D X/Y axis
 ; method to mix sources)
 kWaveX linseg 0, 52,0, 1,0, 1,1, 1,1
 kWaveY linseg 0, 52,0, 1,1, 1,1, 1,0
 
 if kmorftime < 52 kgoto skipXYwavemix
 ; calculate gain for 4 sources from XY position
 kwgain1 limit ((1-kWaveX)*(1-kWaveY)), 0, 1
 kwgain2 limit (kWaveX*(1-kWaveY)), 0, 1
 kwgain3 limit ((1-kWaveX)*kWaveY), 0, 1
 kwgain4 limit (kWaveX*kWaveY), 0, 1
 tablew kwgain1, 2, iwaveamptab
 tablew kwgain2, 3, iwaveamptab
 tablew kwgain3, 5, iwaveamptab
 tablew kwgain4, 4, iwaveamptab
 skipXYwavemix:

 a1,a2,a3,a4,a5,a6,a7,a8 partikkel kGrainRate, 
   kdistribution, idisttab, async, kenv2amt,
   giExpFall, giSigmoRise, giSigmoFall,
   ksustain_amount, ka_d_ratio, 
   kduration, kamp, igainmasks, kwavfreq, ksweepshape, 
   iwavfreqstarttab, iwavfreqendtab, awavfm,  -1, -1, 
   giCosine, kTrainCps, knumpartials, kchroma, 
   ichannelmasks, krandommask, kwaveform1, kwaveform2, 
   kwaveform3, kwaveform4, iwaveamptab, 
   asamplepos1, asamplepos2, asamplepos3, asamplepos4, 
   kwavekey1, kwavekey2, kwavekey3, kwavekey4, 100

 outs a1, a2
 endin

schedule(1,0,56.5)

</CsInstruments>
<CsScore>
e 1
</CsScore>
</CsoundSynthesizer>
