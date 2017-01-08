instr 1
 S1 = "fox.wav"
 imin = 100
 imax = 10000
 asig diskin2 S1,1, 0,1   
 ap,aloc plltrack asig, 0.1
 krms port rms(asig), 0.01
 anoi vco krms,ap,1,0
 aout Vocoder anoi,asig,imin,imax,25,32	
 outs aout,aout 
endin
