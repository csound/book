instr 1
 avar init 0
 avar2 = pluck(p4,cpspch(p5),cpspch(p5),0,1)
 timout 1,p3-1,sec
 kgoto end
 sec:
  a1 expseg 0.001,1,1,p3-2,0.001 
  avar = oscili(a1*p4,cpspch(p5))
 end:
  out avar+avar2 
endin
schedule(1,0,5,0dbfs/2,8.00)