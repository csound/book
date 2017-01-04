instr 1
 if p6 = 0 then
  iamp[]fillarray p4*0.1,p4*0.5
  ifr[] fillarray p5*2.7,p5*3.1
  icnt = 0
  while icnt < lenarray(iamp) && 
       icnt < lenarray(ifr) do
   schedule(1,0,p3,iamp[icnt],ifr[icnt],1)
   icnt += 1
  od  
 endif
 k1 expon  1,p3,0.001
 a1 oscili p4,p5
   out a1*k1  
endin
schedule(1,0,2,0dbfs/4,300,0)