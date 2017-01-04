	sr = 10000
  	kr = 100
	ksmps = 100
	nchnls = 1

	instr 1
k1  	linen p4,.03, p3,.06
a1  	oscil  k1, cpspch(p5), 1
      	out a1
	endin 