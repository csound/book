/* Example of use of linrand */

0dbfs = 1
instr 1
   itail linrand 0.1
   p3 += itail
   a1    oscili  0.8, 440
   out     a1
endin
instr 2
   itail trirand 0.1
   p3 += itail
   a1    oscili  0.8, 440
   out     a1
endin
schedule(1,0,1)
schedule(2,2,1)
