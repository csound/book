<CsoundSynthesizer>
<CsInstruments>
instr 1
 out oscili(p4,cpspch(p5))
endin
</CsInstruments>
<CsScore bin="python">
import sys
f = open(sys.argv[1], "w")
stm = "i 1 %f 1 %f %f \n"
for i in range(0,12):
   f.write(stm % (i,1000+i*1000,8+i/100.))
</CsScore>
</CsoundSynthesizer>