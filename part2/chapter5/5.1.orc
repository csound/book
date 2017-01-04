seed 0
instr 1
 if linrand:i(1) < 0.5 then
  prints "oscillator \n"
  avar = oscili(p4,cpspch(p5))
 else
  prints "string model \n"
  avar = pluck(p4,cpspch(p5),cpspch(p5),0,1)
 endif
  out avar 
endin
schedule(1,0,1,0dbfs/2,8.00)