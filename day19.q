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
  ];
 0b
 }

d19p1:{[input]
 pats: ", "vs raze 1# raze _[;input] 0,where  0=count each input;
 tws:  raze each 1_ raze  _[;input] where  0=count each input;

 sum goodpat[pats] each tws

 }


// Part 2

allpats:{[pats;tw]
 stw: `$tw;
 m:first value MEMO[stw];
 if [not null m; :m];
 if[ 0 = count tw; :1];
 ppats: pats where any each 0 = tw ss/: pats;
 
 if[0=count ppats;
  MEMO[stw]:0;
  :0 ];
 
 tws: _[;tw] each count each ppats;

 total:0;
 while[ count tws;

  $[ 0=count first tws; n:1;
   n: .z.s[pats] first tws];
  
/  if[0<count tws[0];   0N!(`$ tws[0]),n];
  
  total +: n;
  tws: 1_ tws;
  ];

 MEMO[stw]: total;
 total
 }

MEMO: ([tw: enlist `nothing]; c: enlist 0);

d19p2:{[input]
 pats: ", "vs raze 1# raze _[;input] 0,where  0=count each input;
 tws:  raze each 1_ raze  _[;input] where  0=count each input;
 MEMO: ([tw: enlist `nothing]; c: enlist 0);
 sum allpats[pats] each tws

 }
