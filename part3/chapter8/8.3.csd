<CsoundSynthesizer>
<CsInstruments>
instr 1
 printf_i("i %d %.1f %.1f %.1f %.1f %.1f %.1f \n",
           1, p1, p2, p3, p4, p5, p6, p7)
endin
</CsInstruments>
<CsScore>
i 1 0 5 10000 440  pp5 np4 ; i 1 0 5 10000 440 0 30000
i 1 1 2 30000 330  pp4  ; i 1 1 2 30000 330 10000 20000
i 1 2 1 20000 55 . pp5 ; i 1 2 1 20000 55 30000 330
e 
</CsScore>
</CsoundSynthesizer>