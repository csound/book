opcode SumOsc,a,i[]i[]ijo
 iam[],ifr[],iN,ifn,icnt xin
 if icnt >= iN-1 goto syn
  asig SumOsc iam,ifr,iN,ifn,icnt+1
 syn:
   xout asig + oscili(iam[icnt],ifr[icnt],ifn)
endop

gifn ftgen 1,0,16384,10,1,1/2,1/3,
                    1/4,1/5,1/7,1/8,1/9
instr 1
 ifr[] fillarray 1,1.001,0.999,1.002,0.998
 iam[] fillarray 1,0.5,0.5,0.25,0.25
 a1 SumOsc iam,ifr*p5,lenarray(iam),gifn
 out a1*p4/lenarray(iam) * transeg:k(1,p3,-3,0)
endin
schedule(1,0,10,0dbfs/2,440)