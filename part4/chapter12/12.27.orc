/*****************************
asig OscBnk kpitch,ifa,ifn,isize
kpitch - pitch transposition factor
ifa - amplitude function table
iff - frequency function table
isize - oscillator bank size
*******************************/
opcode OscBnk,a,kiiio
 kp,ifa,iff,is,icnt xin
 if icnt < is-1 then
   asig OscBnk kp,ifa,iff,is,icnt+1
 endif
 xout asig + 
        oscili(port(table(k(icnt),ifa),0.01),                
                  kp*table(k(icnt),iff))
endop
