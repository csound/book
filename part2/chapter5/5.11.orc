instr 1
 itie tival
 tigoto dur
 env:
  ist = p2
  idur = abs(p3)
  k1 linen 1,0.2,idur,2
 dur:
  if itie == 0 igoto osc
   iend = idur + ist - p2
   p3 = iend > 0 ? iend : 0
 osc:
  a1 vco2 p4*k1,cpspch(p5),0,itie
  a2 moogladder a1,1000+k1*3000,.7,itie
  out a1
endin
schedule(1,0,-6,0dbfs/2,8.00)
schedule(1,2,-1,0dbfs/2,8.07)
schedule(1,3,-1,0dbfs/2,8.06)
schedule(1,4,1,0dbfs/2,8.05)