Csound: A Sound and Music Computing Sytem
================================

Errata
------

1. chapter 3, p.88, listing 3.28 has missing $:
asig $OSC(kenv*ampdbfs(p4) ’ kpit*cpspch(p5))


2. chapter 8, p. 161, listing 8.4, '+' in place of '0' in
some of the lines:

```
i 1 0 1  100 ; 100
i 1 + 1  <   ; 200 
i 1 + 1  <   ; 300
i 1 + 1  <   ; 400
i 1 + 1  500 ; 500
```


3. chapter 8, p.163, listing 8.6 two lines
have missing '$' 

```
$FLUTE(0 ' 0.5 ' 10000 ' 9.00)
$OBOE(0 ' 0.7 ' 8000 ' 8.07)
```

4. chapter 16, p.397, listing 16.6
aexc instead of aecx 


5. chapter 16, p.401, listing 16.7 should read
opcode Masspring,a,aiii instead of
opcode Masspring,a,aiiii


6. some chapter 15 examples have missing lines 
listing 15.21 (missing last lines)
listing 15.25 (missing last lines)
listing 15.26 (missing last lines)


7. odd layout of listing
listing 15.27 (header + one line on one page, then some stray lines on next page under other figures, then more on next page)

8. On p.112, under 'Until and while', last paragraph should read:
"These loops will work at initialisation time only if the condition is
i-time and perfomance time only if the condition is k-rate"

