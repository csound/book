<CsoundSynthesizer>
<CsInstruments>
instr 1
 printf_i("p4 = %.f\n",1,p4)
endin
</CsInstruments>
<CsScore>
i 1 0 1  100 ; 100
i 1 + 1  <   ; 200 
i 1 + 1  <   ; 300
i 1 + 1  <   ; 400
i 1 + 1  500 ; 500
e 
</CsScore>
</CsoundSynthesizer>