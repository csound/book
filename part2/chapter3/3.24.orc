/* Random pitch example */

instr 1
   aout oscili 0.8*0dbfs, 440+random(-8, 12)
   out aout
endin
schedule(1,0,1)
schedule(1,1,1)
