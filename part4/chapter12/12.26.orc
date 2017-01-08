instr 1
  Note(notnum()-24)
endin

instr 100
 ToneWheel giwheels
 kbar[]  init 9
 kbar[0] ctrl7 1,11,0,1
 kbar[1] ctrl7 1,12,0,1
 kbar[2] ctrl7 1,13,0,1
 kbar[3] ctrl7 1,14,0,1
 kbar[4] ctrl7 1,15,0,1
 kbar[5] ctrl7 1,16,0,1
 kbar[6] ctrl7 1,17,0,1
 kbar[7] ctrl7 1,18,0,1
 kbar[8] ctrl7 1,19,0,1
 kvib    ctrl7 1,20,0,3
 ksel    ctrl7 1,21,0,1
 asig Mixer kbar
 out  clip(VChorus(asig,kvib,ksel),0,0dbfs)
endin
schedule 100,0,-1
