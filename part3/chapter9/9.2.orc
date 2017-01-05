massign 0,0
instr 1
 k1,k2,k3,k4 midiin
 if k1 == 144 then
  S1 strcpyk "NOTE ON"
 elseif k1 == 128 then
  S1 strcpyk  "NOTE OFF"
 elseif k1 == 166 then
  S1 strcpyk  "POLY AFTERTOUCH"
 elseif k1 == 208 then
  S1 strcpyk  "AFTERTOUCH"
 elseif k1 == 192 then
  S1 strcpyk  "PROGRAM CHANGE"
 elseif k1 == 176 then
  S1 strcpyk "CONTROL CHANGE"
 elseif k1 == 224 then
  S1 strcpyk  "PITCH BEND"
 else
  S1 strcpyk  "UNDEFINED"
 endif
 printf "%s chn:%d data1:%d data2:%d\n",
          k1,S1,k2,k3,k4
endin
schedule(1,0,-1)