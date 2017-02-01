; this UDO is needed to upsample the samplepos pointer with interpolation
; simply using interp will give artifacts when the time pointer wraps around (from 1 to 0)
; UpsampPhasor ensures correct interpolation across the wraparound boundary,

gikr = kr
opcode UpsampPhasor, a,k
 kval xin
 setksmps 1
 kold init 0
 if (abs(kold-kval)<0.5) && (abs(kold-kval)>0) then
 reinit interpolator
 elseif abs(kold-kval)>0.5 then; when phasor restarts 
 kold = kold-1
 reinit interpolator
 endif
 interpolator:
 aval linseg i(kold), 1/gikr, i(kval), 1/gikr, i(kval)
 rireturn
 kold = kval
 xout aval
endop
