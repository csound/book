instr 1
 apha init 0
 kph[] fillarray 0,0,0
 kamp[] fillarray 1,0.1,0.5
 kfr[] fillarray p5,p5*2.7,p5*3.1
 kcnt = 0
 asig = 0
 while kcnt < lenarray(kph) &&
       kcnt < lenarray(kamp) &&
       kcnt < lenarray(kfr) do
  ksmp = 0
  kpha = kph[kcnt]
  kf = kfr[kcnt]
  while ksmp < ksmps do
   kpha += (2*$M_PI*kf/sr)%(2*$M_PI)
   vaset(kpha,ksmp,apha)
   ksmp += 1
  od
  asig += kamp[kcnt]*sin(apha)
  kph[kcnt] = kpha
  kcnt += 1
 od
 k1 expseg p4,p3,0.001*p4
 out asig*k1
endin
schedule(1,0,1,0dbfs/2,300)