instr 1
 ktime = timeinsts()  
 k1 init 1
 if ktime%1 == 0 then
  event "i",2,0,2,p4,p5+ktime/100
 endif
endin

instr 2
 k1 expon 1,p3,0.001
 a1 oscili p4*k1,cpspch(p5)
 out a1
endin
schedule(1,0,10,0dbfs/2,8.00)