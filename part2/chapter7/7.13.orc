opcode BPBnk,a,ai[]kio
 asig,ifc[],kQ,iN,icnt xin
 if icnt >= iN-1 goto cont
   afil BPBnk asig,ifc,kQ,iN,icnt+1
 cont:
   xout afil + 
        butterbp(asig,ifc[icnt],ifc[icnt]/kQ)
endop

instr 1
 a1 rand p4
 ifc[] fillarray 700, 1500, 5100, 8000
 a2 BPBnk a1,ifc,10,lenarray(ifc)
 out a2
endin
schedule(1,0,10,0dbfs/2)