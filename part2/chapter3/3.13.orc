instr 1
 i2pi = 6.28318530
 aramp init 0
 out(sin(aramp*i2pi)*p4) 
 aramp += a(1/kr)*p5 
 aramp = aramp%1 
endin
schedule(1,0,10,0dbfs/2,440)
