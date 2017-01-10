<CsoundSynthesizer>
<CsOptions>
-M0 -+rtmidi=virtual -odac
</CsOptions>
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
opcode VChorus,a,akp
  asig,ks,ichorus xin
  kdep[] fillarray 0,0.45,0.66,1
  kset = (ks < 0 ? 0 : (ks > 3 ? 3 : ks))
  adel oscili 1.1*kdep[ks],6.87,2
  amix vdelay asig,adel,2
 xout amix + asig*ichorus
endop

instr 1
  Note(notnum()-24)
endin

instr 100
 ToneWheel giwheels
 kbar[]  init 9
 kbar[0] ctrl7 1,1,0,1
 kbar[1] ctrl7 1,2,0,1
 kbar[2] ctrl7 1,3,0,1
 kbar[3] ctrl7 1,4,0,1
 kbar[4] ctrl7 1,5,0,1
 kbar[5] ctrl7 1,6,0,1
 kbar[6] ctrl7 1,7,0,1
 kbar[7] ctrl7 1,8,0,1
 kbar[8] ctrl7 1,9,0,1
 kvib ctrl7 1,10,0,3
 asig Mixer kbar
 out  clip(VChorus(asig,kvib,1),0,0dbfs)
endin
schedule 100,0,-1
</CsInstruments>
</CsoundSynthesizer>
