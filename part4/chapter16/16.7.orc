/**************************
asig Masspring ad,ik,idp,ih
ad - external displacement
ik - spring constant
idp - dampening constant
ims - mass
**************************/
opcode Masspring,a,aiiii
 setksmps 1
 ad,ik,idp,ims xin
 av init 0
 ax init 0
 ih = 1/sr
 ac = -(ik*ax+ad)/ims
 av = idp*av+ac*ih
 ax = ax+av*ih
 xout ax
endop
