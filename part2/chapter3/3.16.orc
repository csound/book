/* Two modulation instruments */

instr 1 
   out(oscili(p4/2 + oscili:k(p4/2, p6), p5))
endin
schedule(1,0,5,0dbfs/2,440,3.5)

instr 2
   out(oscili(p4, p5 + oscili:k(p5/100,p6)))
endin
schedule(2,5,5,0dbfs/2,440,3.5)
