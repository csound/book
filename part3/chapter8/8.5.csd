<CsoundSynthesizer>
<CsInstruments>
instr 1
 printf_i("p4=%.1f p5=%.1f \n",1,p4,p5) 
endin
</CsInstruments>
<CsScore>
#define FREQ1 #440#
#define FREQ2  #660#
i1 0 1 1000 $FREQ1 ; i1 0 1 1000 440
i1 0 1 1500 $FREQ2 ; i1 0 1 1000 660
i1 0 1 1200 $FREQ1
i1 0 1 1000 $FREQ2
e 
</CsScore>
</CsoundSynthesizer>