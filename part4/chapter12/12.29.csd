<CsoundSynthesizer>
<CsInstruments>
opcode OscBnk,a,kiiio
 kp,ifa,iff,is,icnt xin
 if icnt < is-1 then
   asig OscBnk kp,ifa,iff,is,icnt+1
 endif
 xout asig + 
        oscili(port(table(k(icnt),ifa),0.01),                
                  kp*table(k(icnt),iff))
endop
opcode StreamAnal,k,aiii
 asig,ifa,iff,is xin
 fsig pvsanal asig,is*2,is/4,is*2,1
 xout pvsftw(fsig,ifa,iff)
endop

gioscs init 512
gifn1 ftgen 1,0,gioscs,7,0,gioscs,0
gifn2 ftgen 2,0,gioscs,7,0,gioscs,0
instr 1
 a1 diskin2 "fox.wav",1,0,1
 kfl StreamAnal a1,1,2,gioscs
 a1 OscBnk p4,1,2,gioscs
 a2 OscBnk p5,1,2,gioscs
 out (a1+a2)/2
endin
schedule(1,0,10,1,.75)
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
