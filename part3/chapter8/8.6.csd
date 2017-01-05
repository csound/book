<CsoundSynthesizer>
<CsInstruments>
instr 1
 printf_i("FLUTE: p4 = %.f\n",1,p4)
endin
instr 2
 printf_i("OBOE: p4 = %.f\n",1,p4)
endin
</CsInstruments>
<CsScore>
#define  FLUTE(a'b'c'd) #i1 $a $b $c $d#
#define  OBOE(a'b'c'd) #i2 $a $b $c $d#

$FLUTE(0 ' 0.5 ' 10000 ' 9.00)
$OBOE(0 ' 0.7 ' 8000 ' 8.07)
e 
</CsScore>
</CsoundSynthesizer>