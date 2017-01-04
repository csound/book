instr 1 
   out((oscili(p4, p5) + 
   oscili(p4/3,p5*3) + 
   oscili(p4/5,p5*5))/3)
endin
schedule(1,0,10,0dbfs/2,440)