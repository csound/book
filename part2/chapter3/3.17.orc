/* Two modulation instruments */

ifn ftgen 1,0,16385,-5,1,16384,2
instr 1
 k1 oscili 1,1/p3,1
 a1 oscili p4,p5*k1
 out a1
endin
schedule(1,0,10,0dbfs/2,440)
