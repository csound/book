<CsoundSynthesizer>
<CsInstruments>
/**********************
asig String kamp,ifun,ils,ipos,ipk
kamp - amplitude
ifun - fundamental freq
ils - loss factor
ipos - pluck position
ipk - pickup position
********************/
opcode String,a,kiii
 setksmps 1
 kamp,ifun,ipos,ipk xin
 ain1 init 0
 ain2 init 0
 idel = 1/(2*ifun)
 kcnt line 0, p3, p3
 if kcnt < idel then
  ainit1 linseg  0,idel*ipos, 1, idel*(1-ipos),0
  ainit2 linseg  0,idel*(1-ipos),-1, idel*ipos,0
 else
  ainit1=0
  ainit2=0
 endif
 awg1 delayr idel
 apick1 deltap idel*(1-ipk)
     delayw  ain1+ainit1
 awg2 delayr idel
 apick2 deltap idel*ipk
     delayw  ain2+ainit2
 ain1 = (-awg2 + delay1(-awg2))*0.5
 ain2 = -awg1
      xout (apick1+apick2)*kamp
endop

instr 1
 asig String p4,p5,0.3,0.05
 out asig
endin

</CsInstruments>
<CsScore>
i1 0 1 10000 220
i1 + 1 10000 440
i1 + 1 10000 330
i1 + 1 10000 275
i1 + 1 10000 220
</CsScore>
</CsoundSynthesizer>
