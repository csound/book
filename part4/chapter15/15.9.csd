<CsoundSynthesizer>
<CsInstruments>

0dbfs = 1 
 
; audio buffer table for granular effects processing
giLiveFeedLen = 524288 ; 11.8 seconds buffer at 44.1
giLiveFeedLenSec = giLiveFeedLen/sr
giLiveFeed ftgen 0, 0, giLiveFeedLen+1, 2, 0

; other tables
giSine ftgen 0, 0, 65536, 10, 1 
giCosine ftgen 0, 0, 8193, 9, 1, 1, 90 
giSigmoRise  ftgen 0, 0, 8193, 19, 0.5, 1, 270, 1 
giSigmoFall  ftgen 0, 0, 8193, 19, 0.5, 1, 90, 1 

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
 kFeed = 0.4 
 a1 = a1 + (aFeed*kFeed) 
 kdry = 0.2
 aout = a1 * kdry 
 out aout

 iLength = ftlen(giLiveFeed)
 gkstartFollow tablewa giLiveFeed, a1, 0 
 ; reset kstart when table is full
 gkstartFollow = (gkstartFollow > (giLiveFeedLen-1) ? 
 0 : gkstartFollow) 
 ; update table guard point (for interpolation)
 tablegpw giLiveFeed 

endin

;******************************************************
; grain delay
instr 2
 
; grain clock
 kGrainRate = 35.0 
 async  = 0.0 

; grain shape
 kGrainDur = 3.0 
 kduration = (kGrainDur*1000)/kGrainRate 

; grain pitch (transpose, or "playback speed")
 kwavfreq = 1 
 kfildur1 = tableng(giLiveFeed) / sr  
 kwavekey1 = 1/kfildur1 
 awavfm = 0  

 ; automation of the grain delay time
 ksamplepos1 linseg 0, 1, 0, 2, 0.1, 2, 
       0.1, 2, 0.2, 2, 0, 1, 0 
 kpos1Deviation randh 0.003, kGrainRate
 ksamplepos1 = ksamplepos1 + kpos1Deviation

 ; Avoid crossing the record boundary 
 ksamplepos1 limit ksamplepos1, 
       (kduration*kwavfreq)/(giLiveFeedLenSec*1000),1
 ; make samplepos follow the record pointer 
 ksamplepos1  = 
       (gkstartFollow/giLiveFeedLen) - ksamplepos1 
 asamplepos1 UpsampPhasor ksamplepos1
 asamplepos1 wrap asamplepos1, 0, 1

 a1  partikkel kGrainRate, 0, -1, async, 0, -1, 
  giSigmoRise, giSigmoFall, 0, 0.5, kduration, 0.5, -1, 
  kwavfreq, 0.5, -1, -1, awavfm, 
  -1, -1, giCosine, 1, 1, 1, 
  -1, 0, giLiveFeed, giLiveFeed,
  giLiveFeed, giLiveFeed, -1,
  asamplepos1,asamplepos1,asamplepos1,asamplepos1, 
  kwavekey1, kwavekey1, kwavekey1, kwavekey1, 100

 ; audio feedback in granular processing 
 aFeed dcblock a1 
 chnset aFeed, "partikkelFeedback" 

  out a1*ampdbfs(-6)
 
endin

</CsInstruments>
<CsScore>
i1 0 86400 ; record live input 
i2 0 86400 ; granular delay 
</CsScore>
</CsoundSynthesizer>
