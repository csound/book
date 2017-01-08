giwheels init 96
gawheels[]  init giwheels
/*******************************
ToneWheel iwheels
iwheels - number of tonewheels
***********************************/
opcode ToneWheel,0,io
 ibnd,icnt xin
 if icnt < ibnd-1 then
  ToneWheel ibnd, icnt+1 
 endif
 gawheels[icnt] oscili 1,cpspch(5+icnt/100)  
endop
