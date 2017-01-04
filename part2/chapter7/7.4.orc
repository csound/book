gisinetab = ftgen(0, 0, 4097, 10, 1)
opcode SinModulate, a, a[]i
 asigs[], ifreq xin
 icount = lenarray(asigs)
 iphaseAdj = 1 / icount
 aphs = phasor(ifreq)
 aout = 0
 kndx = 0
 until (kndx >= icount) do
  aphsAdj = ((kndx / icount) * aphs) % 1.0
  amod = tablei:a(aphsAdj, gisinetab, 1)
  aout += asigs[kndx] * ((amod + 1) / 3)
  kndx += 1
 od
 xout aout
endop

instr 1
 ipch = cps2pch(p4,12)
 iamp = ampdbfs(p5)
 asigs[] init 3
 aenv linsegr 0,0.01,.5,0.01,.45,2.25,0
 asigs[0] vco2 iamp, ipch
 asigs[1] vco2 iamp, ipch * 2
 asigs[2] vco2 iamp, ipch * 3
 out moogladder(SinModulate(asigs, 
                   0.75)*aenv,
                   2000,.3)
endin

icnt = 0
while icnt < 6 do
 schedule(1,icnt,10-icnt,8+2*icnt/100,-12)
 icnt += 2
od