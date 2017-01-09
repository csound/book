<CsoundSynthesizer>
<CsInstruments>
opcode Partial,a,kkkii
 ka,kf,kt,ifa,iff xin
 xout(oscili(ka*tablei:k(kt,ifa,1),
            kf*tablei:k(kt,iff,1)))
endop

i1 ftgen 1,0,16385,5,1,16384,0.001
i2 ftgen 2,0,16385,-5,1,16384,0.9

instr 1
 ap[] init 8
 ipf[] fillarray 440,480,590,610,700,850,912,990
 ipa[] fillarray 0.8,0.9,0.3,0.7,0.6,0.5,0.1,0.2
 kt = timeinsts()/p3
 ap[0] Partial ipa[0],ipf[0]*p4,kt,1,2
 ap[1] Partial ipa[1],ipf[1]*p4,1.1*kt,1,2 
 ap[2] Partial ipa[2],ipf[2]*p4,1.2*kt,1,2
 ap[3] Partial ipa[3],ipf[3]*p4,1.3*kt,1,2
 ap[4] Partial ipa[4],ipf[4]*p4,1.4*kt,1,2
 ap[5] Partial ipa[5],ipf[5]*p4,1.5*kt,1,2
 ap[6] Partial ipa[6],ipf[6]*p4,1.6*kt,1,2
 ap[7] Partial ipa[7],ipf[7]*p4,1.7*kt,1,2
 kcnt = 0
 amix = 0
 while kcnt < 8 do
    amix += ap[kcnt]
    kcnt += 1
  od
  out linen(amix*0dbfs/10,0.01,p3,0.01)
endin
schedule(1,0,20,1.5)
schedule(1,1,19,1)
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
