/**************************************************
asig Morph ain1,ain2,kaint,kfint
ain1 - input signal 1
ain2 - input signal 2
kaint - amplitude interpolation (0 < kaint < 1)
kaint - frequency interpolation (0 < kfint < 1)
**************************************************/
opcode Morph,a,aakk
 as1,as2,ka,kf xin
 isiz = 2048
 ihop = isiz/8
 fs1 pvsanal as1,isiz,ihop,isiz,1
 fs2 pvsanal as2,isiz,ihop,isiz,1
 fsm pvsmorph fs1,fs2,ka,kf
 xout pvsynth(fsm)
endop
