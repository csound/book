/* Producing random numbers at k-rate */

instr 1
 imax = 10
 printk 0.1, rnd(k(imax)) 
endin 
schedule(1,0,1)
