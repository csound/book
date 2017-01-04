gipar ftgen 1, 0, 3, -2, 0.4, 0.6, 0.7
gimod ftgen 2, 0, 2, -2, 0, 0
giscal ftgen 3, 0, 6, -2,0.1,0.5,0.2,0.5,0.1,0.3
gires ftgen 4, 0,3,2,0,0,0

instr 1
 k1 oscili p4,p5
 tablew k1,p6,gimod
endin
schedule(1,0,-1,1,0.93,0)
schedule(1,0,-1,1,2.05,1)

instr 2
 kenv linen p4,0.01,p3,0.1
 k1 table p6,gires
 a1 oscili k1*kenv,p5
 out a1
 schedule(2,0.5,1.5,
          rnd(0.1)*0dbfs,
          500+gauss(400),
          int(rnd(2.99)))
endin
schedule(2,0,1.5,0dbfs*0.1,500,0)

instr 10
 kupdt init 1
 modmatrix gires,gimod,gipar,giscal,2,3,kupdt
 kudpt = 0
endin
schedule(10,0,-1)