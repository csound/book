<CsoundSynthesizer>
<CsInstruments>
/**************************
asig Masspring ad,ik,idp,ih
ad - external displacement
ik - spring constant
idp - dampening constant
ims - mass
**************************/
opcode Masspring,a,aiii
 setksmps 1
 ad,ik,idp,ims xin
 av init 0
 ax init 0
 ih = 1/sr
 ac = -(ik*ax+ad)/ims
 av = idp*av+ac*ih
 ax = ax+av*ih
 xout ax
endop

instr 1
 asig = p4
 ifr = p5
 idp = p6
 ik = 1.9
 im = ik*(1/(2*$M_PI*ifr))^2
 ams Masspring asig,ik,idp,im
 out dcblock(ams)
 asig = 0
endin
schedule(1,0,5,0dbfs/2,440,0.9999)

</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>
