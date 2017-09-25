<CsoundSynthesizer>
<CsInstruments>

0dbfs = 1 
 
; audio buffer table for granular effects processing
giLiveFeedLen = 524288 ; 11.8 seconds buffer at 44.1
giLiveFeedLenSec = giLiveFeedLen/sr
giLiveFeed ftgen 0, 0, giLiveFeedLen+1, 2, 0

instr 1
 a1 inch 1 
 aFeed chnget "partikkelFeedback" 
 kFeed = 0.4 
 a1 = a1 + (aFeed*kFeed) 
 iLength = ftlen(giLiveFeed)
 gkstartFollow tablewa giLiveFeed, a1, 0 
 ; reset kstart when table is full
 gkstartFollow = (gkstartFollow > (giLiveFeedLen-1) ? 
       0 : gkstartFollow)
 ; update table guard point (for interpolation)
 tablegpw giLiveFeed 
endin

schedule(1,0,10)
</CsInstruments>
<CsScore>
e 1
</CsScore>
</CsoundSynthesizer>
