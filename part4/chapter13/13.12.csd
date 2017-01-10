<CsoundSynthesizer>
<CsInstruments>
opcode PitchShifter,a,akkip
 asig,kp,kdel,ifn,imax xin
 kfm = (kp-1)/kdel
 amd1 phasor -kfm
 amd2 phasor -kfm,0.5
 admp delayr imax
 atp1 deltap3 amd1*kdel
 atp2 deltap3 amd2*kdel
 delayw asig
 xout atp1*tablei:a(amd1,ifn,1) +
     atp2*tablei:a(amd2,ifn,1)
endop

instr 1
 ain inch 1
 kf, ka pitchamdf ain,100,600
 kf = kf < 100 ? 100 : (kf > 600 ? 600 : kf)
 kdel = 2/kf
 kdel port kdel, 0.01, 0.1 
 asig PitchShifter ain,1.5,kdel,1
 outs asig+ain,asig+ain
endin
schedule(1,0,-1)
</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
