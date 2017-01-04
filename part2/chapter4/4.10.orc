instr 1
 asigs[] init 3
 asigs[0] = vco2(p4, p5)
 asigs[1] = vco2(p4, p6)
 asigs[2] = vco2(p4, p7)
 aout = asigs[0] + asigs[1] + asigs[2]
         out aout
endin
schedule(1,0,1,0dbfs/6,440,660,880)