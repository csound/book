instr 1
 ktrig = (release() == 1 ? 0 : 1)
 iatt1 = 0.01
 idec1 = 0.1
 isus1 = 0.8
 irel1 = 0.1
 kenv1 ADSR p4,iatt1,idec1,isus1,irel1,ktrig
 iatt2 = 0.1
 idec2 = 0.2
 isus2 = 0.4
 irel2 = 0.05
 kenv2 ADSR 1,iatt2,idec2,isus2,irel2,ktrig 
 a1 vco2 0dbfs/3, p5
 a2 vco2 0dbfs/3, p5*1.005
 a3 vco2 0dbfs/3, p5*.995
 a4 moogladder a1+a2+a3, p5*6*(1+kenv2), 0.7
    out a4*kenv1
endin

i1 = 0
while i1 < 12 do
 schedule(1,i1,1,i1/12,cpspch(8+i1/100)) 
 i1 += 1
od
