<CsoundSynthesizer>
<CsInstruments>

 0dbfs = 1 ; needs 0dbfs = 1, to keep recording and playback in same range
 ksmps = 128
 nchnls = 2 

 ; audio buffer table for granular effects processing
 giLiveFeedLen = 524288 ; 11.8 seconds buffer at 44.1
 giLiveFeedLenSec = giLiveFeedLen/sr
 giLiveFeed ftgen 0, 0, giLiveFeedLen+1, 2, 0

 ; other tables
 giSine ftgen 0, 0, 65536, 10, 1 
 giCosine ftgen 0, 0, 8193, 9, 1, 1, 90 
 giSigmoRise ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1 
 giSigmoFall ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1 
 giSigmoWin ftgen 0, 0, 8193, 19, 1, 0.5, 270, 0.5		

; this UDO is needed to upsample the samplepos pointer with interpolation
; simply using interp will give artifacts when the time pointer wraps around (from 1 to 0)
; UpsampPhasor ensures correct interpolation across the wraparound boundary,

 gikr = kr
 opcode UpsampPhasor, a,k
 kval xin
 setksmps 1
 kold init 0
 if (abs(kold-kval)<0.5) && (abs(kold-kval)>0) then
 reinit interpolator
 elseif abs(kold-kval)>0.5 then; when phasor restarts 
 kold = kold-1
 reinit interpolator
 endif
 interpolator:
 aval linseg i(kold), 1/gikr, i(kval), 1/gikr, i(kval)
 rireturn
 kold = kval
 xout aval
 endop

;******************************************************
;record input to buffer
 instr 1
 a1 inch 1 
 aFeed chnget "partikkelFeedback" 
 kFeed = 0.7
 a1 = a1 + (aFeed*kFeed) 
 kdry = 0.8
 aout = a1 * kdry 
 outs aout, aout

 iLength = ftlen(giLiveFeed)
 gkstartFollow tablewa giLiveFeed, a1, 0 
 ; reset kstart when table is full
 gkstartFollow = (gkstartFollow > (giLiveFeedLen-1) ? 
 0 : gkstartFollow) 
 ; update table guard point (for interpolation)
 tablegpw giLiveFeed 

 endin

;******************************************************
; grain reverb
 instr 2

; grain clock
 kGrainRate = 110.0 
 async  = 0.0 

; grain shape
 kGrainDur = 12.0 
 kduration = (kGrainDur*1000)/kGrainRate 

; same pitch for all source waveforms
 kwavfreq = 1 
 kfildur1 = tableng(giLiveFeed) / sr  
 kpitchmod = 0.005
#define PitchDeviation(N)#
 kpitchdev$N. randh kpitchmod, 1, 0.1
 kwavekey$N = 1/kfildur1*(1+kpitchdev$N.)
#
$PitchDeviation(1)
$PitchDeviation(2)
$PitchDeviation(3)
$PitchDeviation(4)

 awavfm = 0 

 ; grain delay time, 
 ; gradually increasing delay time 
 ; to create slowdown effect.
 kplaybackspeed = 0.25 ; slow down 
 koverlaprate = 0.8 ; overlap rate
 koverlap = 1 ; amount of overlap between layers

 ; four overlapping windows of slowdown effect,
 ; fading in and out,
 ; reset delay time to zero on window boundaries
#define Overlaptime(N'P)#
 koverlaptrig$N. metro koverlaprate, $P.
 if koverlaptrig$N. > 0 then
 reinit timepointer$N.
 endif
timepointer$N.:
 ksamplepos$N. line 0, i(kfildur1), 
       1-i(kplaybackspeed)
 itimenv$N. divz i(koverlap), i(koverlaprate), .01
 kampwav$N. oscil1i itimenv$N.*0.1, 1, 
       itimenv$N., giSigmoWin
 rireturn
#
$Overlaptime(1'0.0)
$Overlaptime(2'0.25)
$Overlaptime(3'0.50)
$Overlaptime(4'0.75)

 ktimedev = 12/(giLiveFeedLenSec*1000)
#define TimeDeviation(N)#
 kdevpos$N rnd31 ktimedev, 1
 ksamplepos$N = ksamplepos$N+kdevpos$N
#
$TimeDeviation(1)
$TimeDeviation(2)
$TimeDeviation(3)
$TimeDeviation(4)

 ; Avoid crossing the record boundary 
#define RecordBound(N)#
 ksamplepos$N. limit ksamplepos$N., 
       (kduration*kwavfreq)/(giLiveFeedLenSec*1000),1
 ; make samplepos follow the record pointer 
 ksamplepos$N.  = 
       (gkstartFollow/giLiveFeedLen) - ksamplepos$N.
 asamplepos$N. UpsampPhasor ksamplepos$N.
 asamplepos$N wrap asamplepos$N, 0, 1 
#
$RecordBound(1)
$RecordBound(2)
$RecordBound(3)
$RecordBound(4)

 ; pitch masking tables
 iwavfreqstarttab ftgentmp 0, 0, 16, -2, 0, 2, 1,1,2
 iwavfreqendtab ftgentmp 0, 0, 16, -2, 0, 2, 1,1,2

 ; channel masking table, send grains alternating to
 ; left and right output, for stereo reverb
 ichannelmasks ftgentmp 0, 0, 16, -2, 0, 1, 0, 1

 ; activate all 4 source waveforms
 iwaveamptab ftgentmp 0, 0, 32, -2, 0, 0, 1,1,1,1,0                   
 
 ; write amp envelope for overlapping 
 ; slowdown windows to wave mix mask table
  tablew kampwav1, 2, iwaveamptab
  tablew kampwav2, 3, iwaveamptab
  tablew kampwav3, 4, iwaveamptab
  tablew kampwav4, 5, iwaveamptab

 a1, a2  partikkel kGrainRate, 0, -1, async, 0, -1, 
   giSigmoRise, giSigmoFall, 0, 0.5, kduration, 1, -1, 
   kwavfreq, 0.5, iwavfreqstarttab, iwavfreqendtab, 
   awavfm, -1, -1, giCosine, 1, 1, 1, ichannelmasks, 
   0, giLiveFeed, giLiveFeed, giLiveFeed, giLiveFeed, 
   iwaveamptab, asamplepos1, asamplepos2, 
   asamplepos3, asamplepos4, 
   kwavekey1, kwavekey2, kwavekey3, kwavekey4, 100

; audio feedback in granular processing 
 aFeed dcblock a1 
 aFeed butterlp aFeed, 8000
 ; empirical adjustment of feedback scaling for stability
 aFeed = aFeed*0.6 
 chnset aFeed, "partikkelFeedback" 

  outs a1*ampdbfs(-6), a2*ampdbfs(-6)

 endin

;******************************************************

</CsInstruments>
<CsScore>
i1 0 86400 ; record live input 
i2 0 86400 ; granular reverb
</CsScore>
</CsoundSynthesizer>
