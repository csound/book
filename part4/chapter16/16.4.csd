<CsoundSynthesizer>
<CsInstruments>
gicos   ftgen 0, 0,8192,11,1

/**********************
asig MyMarimba idur,iamp,ifrq,ibias
idur - time to decay
iamp - amplitude
ifrq - fundamental freq
********************/
opcode MyMarimba,a,iii
  idur,ifrq,iamp xin
  ; envelope
  k1      expseg  .0001,.03,iamp,idur-.03,.001
  ; anticlick
  k25     linseg  1,.03,1,idur-.03,3
  ; power to partials
  k10     linseg  2.25,.03,3,idur-.03,2
  a1      gbuzz   k1*k25,ifrq,k10,0,35,gicos
  a2      reson   a1,500,50,1     ;filt
  a3      reson   a2,1500,100,1   ;filt
  a4      reson   a3,2500,150,1   ;filt
  a5      reson   a4,3500,150,1   ;filt
  a6      balance a5,a1
          xout    a6
endop

instr 1
  ifq  =          cpspch(p4)
  asig MyMarimba  20,ifq,p5
       out        asig
endin
</CsInstruments>
<CsScore>
i1     0       10     8.00    30000
i1     4       .      8.02    30000
i1     8       .      8.04    30000
i1     12      .      8.05    30000
i1     16      .      8.07    30000
i1     20      .      8.09    30000
i1     24      .      8.11    30000
i1     28      .      9.00    30000
i1     32      .      8.00    10000
i1     32      .      8.04    10000
i1     32      .      8.07    10000
</CsScore>
</CsoundSynthesizer>
