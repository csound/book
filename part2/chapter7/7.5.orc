opcode FilePlay,a,S
 Sname xin
 p3 = filelen(Sname)
 a1 diskin Sname,1 
 xout a1
endop

instr 1
 out FilePlay("fox.wav")
endin
schedule(1,0,1)