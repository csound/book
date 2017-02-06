/* Preprocessor condititionals */

#define PRINTAMP #1#
instr 1
  iamp = ampdbfs(p4)
  ifreq = cpspch(p5)
#ifdef PRINTAMP
  print iamp
#else
  print ifreq
#end  
 out(oscili(iamp,ifreq)
endin
schedule(1,0,1,-6,8.09)
