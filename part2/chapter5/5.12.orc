instr 1
 S1 = p4
 if compilestr(S1) == 0 then
  schedule(2,0,1,p5,p6)
 endif
endin
schedule(1,0,0,
{{
 instr 2
  k1 expon 1,p3,0.001
  a1 oscili p4*k1,p5
  out a1
 endin
}}, 0dbfs/2, 440)