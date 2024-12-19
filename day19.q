input0: read0 `:data/day19_test.txt
input: read0 `:data/day19.txt

goodpat:{[pats;tw]
 if[ 0 = count tw; :1b];
 ppats: pats where any each 0 = tw ss/: pats;
 if[0=count ppats;:0b];
 tws: _[;tw] each count each ppats;
 while[ count tws;
  if[.z.s[pats] first tws; :1b];
  tws: 1_ tws;
  ] 
 0b
 }

d19p1:{[input]
 pats: ", "vs raze 1# raze _[;input] 0,where  0=count each input;
 tws:  raze each 1_ raze  _[;input] where  0=count each input;

 sum goodpat[pats] each tws

 }
