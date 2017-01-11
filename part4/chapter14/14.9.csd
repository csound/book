<CsoundSynthesizer>
<CsInstruments>
gS_ats = "fox.ats"
giDur ATSinfo gS_ats, 7 ;duration 
giLowPart = 5 ;lowest partial used
giHighPart = 90 ;highest partial used
giOffset = 2 ;increment
gkPartMaxAmps[] init giHighPart+1

instr partial_arp
 p3 = giDur*5 ;time stretch
 iCnt = giLowPart
 while iCnt <= giHighPart do
  ;check maximum in each partial and write in array
  schedule "check_max", 0, 1, iCnt
  ;call instr to play a note if threshold is crossed
  schedule "p_trigger", 0, p3, iCnt
  iCnt += giOffset
 od
 ;create time pointer for all instances of p_trigger
 gkTime line 0, p3, giDur
endin
  
instr check_max
 kMaxAmp, kTim init 0
 while kTim < giDur do
   kFq,kAmp ATSread kTim, gS_ats, p4
   kMaxAmp = kAmp > kMaxAmp ? kAmp : kMaxAmp
   kTim += ksmps/sr
 od
 gkPartMaxAmps[p4] = dbamp(kMaxAmp)
 turnoff
endin

instr p_trigger
 idBdiff = 2
 kMax = gkPartMaxAmps[p4] ;get max of this partial (dB)
 kPrevAmp init 0
 kState init 0 ;0=below, 1=above thresh
 kFq,kAmp ATSread gkTime, gS_ats, p4
 if kAmp > kPrevAmp && 
    dbamp(kAmp) > kMax-idBdiff && 
    kState == 0 then
  event "i", "pling", 0, p3*2, kFq, kAmp
  kState = 1
 elseif kAmp < kPrevAmp && 
          dbamp(kAmp) < kMax-idBdiff && 
          kState == 1 then
  kState = 0
 endif
 kPrevAmp = kAmp
endin
  
instr pling
 aImp mpulse p5*3, p3
 aFilt mode aImp, p4, 1/p5*50
 out aFilt
endin
schedule("partial_arp",0,1)
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
