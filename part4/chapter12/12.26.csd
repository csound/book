<CsoundSynthesizer>
<CsInstruments>
giwheels init 96
gawheels[]  init giwheels
opcode ToneWheel,0,io
 ibnd,icnt xin
 if icnt < ibnd-1 then
  ToneWheel ibnd, icnt+1 
 endif
 gawheels[icnt] oscili 1,cpspch(5+icnt/100)  
endop
gkpart[] fillarray 0,19,12,24,31,36,40,43,48
gabus[] init 9
opcode Note,0,i
inote xin
 kcnt init 0
 knote init 0
 kcnt = 0
 while kcnt < 9 do
   knote = inote+gkpart[kcnt]
   if knote < giwheels  && knote >= 0 then
    gabus[kcnt] = gabus[kcnt] + gawheels[knote]
   endif 
   kcnt += 1
 od
endop
opcode Mixer,a,k[]
 kbar[] xin
 asig = 0
 kcnt = 0
 kscl = 0
 while kcnt < 9 do
  asig += gabus[kcnt]*kbar[kcnt]
  gabus[kcnt] = 0
  kscl += kbar[kcnt]
  kcnt += 1
 od
  xout asig*0dbfs/(21+kscl*active:k(1))
endop
ifn ftgen 2,0,16384,20,3,1
opcode VChorus,a,akk
  asig,ks,kchorus xin
  kdep[] fillarray 0,0.45,0.66,1
  kset = (ks < 0 ? 0 : (ks > 3 ? 3 : ks))
  adel oscili 1.1*kdep[ks],6.87,2
  amix vdelay asig,adel,2
 xout amix + asig*kchorus
endop

instr 1
  Note(notnum()-24)
endin

instr 100
 ToneWheel giwheels
 kbar[]  init 9
 kbar[0] ctrl7 1,11,0,1
 kbar[1] ctrl7 1,12,0,1
 kbar[2] ctrl7 1,13,0,1
 kbar[3] ctrl7 1,14,0,1
 kbar[4] ctrl7 1,15,0,1
 kbar[5] ctrl7 1,16,0,1
 kbar[6] ctrl7 1,17,0,1
 kbar[7] ctrl7 1,18,0,1
 kbar[8] ctrl7 1,19,0,1
 kvib    ctrl7 1,20,0,3
 ksel    ctrl7 1,21,0,1
 asig Mixer kbar
 out  clip(VChorus(asig,kvib,ksel),0,0dbfs)
endin
schedule 100,0,-1
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
