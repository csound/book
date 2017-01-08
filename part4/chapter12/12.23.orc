gkpart[] fillarray 0,19,12,24,31,36,40,43,48
gabus[] init 9
/*******************************************
Note inum
inum - note to be played (relative to tonewheel scale)
*******************************************/
opcode Note,0,i
inote xin
 kcnt init 0
 knote init 0
 kcnt = 0
 while kcnt < 9 do
   knote = inote+gkpart[kcnt]
   if knote < giwheels  && knote >= 0 then
    gabus[kcnt] = gabus[kcnt] + gawheels[knote]
   endif 
   kcnt += 1
 od
endop
