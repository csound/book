/*****************************************************
al,ar Bf2bi aw,ax,ay,az,ar,as,at,au,av
aw,ax ... = 2nd-order bformat input signal
===================================
adapted from example by Brian Carty
*****************************************************/
opcode Bf2bi, aa, aaaaaaaaa
 aw,ax,ay,az,ar,as,at,au,av xin
 if sr == 44100 then
  Shl = "hrtf-44100-left.dat"
  Shr = "hrtf-44100-right.dat"
 elseif sr == 48000 then
  Shl = "hrtf-48000-left.dat"
  Shr = "hrtf-48000-right.dat"
 elseif sr == 96000 then
  Shl = "hrtf-96000-left.dat"
  Shr = "hrtf-96000-right.dat"
 else
  al, ar bformdec1 1,aw,ax,ay,az,ar,as,at,au,av 
  goto end  
 endif                
 a1,a2,a3,a4,a5,a6,a7,a8 bformdec1 4, 
           aw, ax, ay, az, 
           ar, as, at, au, av
 al1,ar1 hrtfstat a2,22.5,0,Shl,Shr
 al2,ar2 hrtfstat a1,67.5,0,Shl,Shr
 al3,ar3 hrtfstat a8,112.5,0,Shl,Shr
 al4,ar4 hrtfstat a7,157.5,0,Shl,Shr
 al5,ar5 hrtfstat a6,202.5,0,Shl,Shr
 al6,ar6 hrtfstat a5,247.5,0,Shl,Shr
 al7,ar7 hrtfstat a4,292.5,0,Shl,Shr
 al8,ar8 hrtfstat a3,337.5,0,Shl,Shr 
 al = (al1+al2+al3+al4+al5+al6+al7+al8)/8 
 ar = (ar1+ar2+ar3+ar4+ar5+ar6+ar7+ar8)/8
 end:
        xout al,ar
endop
