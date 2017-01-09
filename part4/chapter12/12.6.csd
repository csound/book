<CsoundSynthesizer>
<CsInstruments>
opcode VocBand,a,aakk
 as,an,kf,kbw xin
 xout(balance(butterbp(
              butterbp(as,kf,kbw),kf,kbw),
              butterbp(
              butterbp(an,kf,kbw),kf,kbw)))
endop
opcode Vocoder, a, aakkkpp
 as,an,kmin,kmax,kq,ibnd,icnt  xin
 if kmax < kmin then
    ktmp = kmin
    kmin = kmax
    kmax = ktmp
 endif
 if kmin == 0 then 
    kmin = 1
 endif
 if (icnt >= ibnd) goto bank
   abnd   Vocoder as,an,kmin,kmax,kq,ibnd,icnt+1
 bank:
    kfreq = kmin*(kmax/kmin)^((icnt-1)/(ibnd-1))
    kbw = kfreq/kq
    ao VocBand as,an,kfreq,kbw
    amix = ao + abnd
    xout amix
endop

instr 1
 S1 = "fox.wav"
 imin = 100
 imax = 10000
 asig diskin2 S1,1, 0,1   
 ap,aloc plltrack asig, 0.1
 krms port rms(asig), 0.01
 anoi vco krms,ap,1,0
 aout Vocoder anoi,asig,imin,imax,25,32	
 outs aout,aout 
endin
schedule(1,0,99)
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
