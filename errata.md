Csound: A Sound and Music Computing Sytem
================================

Errata
------

1. chapter 8, p. 161, listing 8.4, '+' in place of '0' in
some of the lines:

```
i 1 0 1  100 ; 100
i 1 + 1  <   ; 200 
i 1 + 1  <   ; 300
i 1 + 1  <   ; 400
i 1 + 1  500 ; 500
```


2. chapter 8, p.163, listing 8.6 two lines
have missing '$' 

```
$FLUTE(0 ' 0.5 ' 10000 ' 9.00)
$OBOE(0 ' 0.7 ' 8000 ' 8.07)
```
3. On p.112, under 'Until and while', last paragraph should read:
"These loops will work at initialisation time only if the condition is
i-time and perfomance time only if the condition is k-rate"
