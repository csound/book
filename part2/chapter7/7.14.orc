instr 1
iamp = p4
ifreq = p5
a1 subinstr 2,iamp,ifreq,0.1,p3,0.9,-1
   out  a1
endin
schedule(1,0,1,0dbfs/2,440)

instr 2
 a1 oscili p4,p5,p9
 a2 linen a1,p6,p7,p8
    out a2
endin