/* A simple sound synthesis instrument */

instr 1
 aramp init 0
 out((2*aramp-1)*p4)
 aramp += a(1/kr)*p5 
 aramp = aramp%1 
endin
schedule(1,0,10,0dbfs/2,440)
