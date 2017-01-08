ifn ftgen 2,0,16384,20,3,1
/***************************
asig VChorus ain,kdepth,ichorus
asig - input signal
kdepth - depth settings (0-3)
ichorus - 1 for chorus, 0 for vibrato.
***************************/
opcode VChorus,a,akp
  asig,ks,ichorus xin
  kdep[] fillarray 0,0.45,0.66,1
  kset = (ks < 0 ? 0 : (ks > 3 ? 3 : ks))
  adel oscili 1.1*kdep[ks],6.87,2
  amix vdelay asig,adel,2
 xout amix + asig*ichorus
endop
