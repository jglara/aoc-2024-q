i: read0 `:data/day6.txt
i0: read0 `:data/day6_test.txt

/ locate c in m
locate:{[m;c]
 first raze til[count m] ,/:' where each m=c
 }

/follow direction until obstacle
follow:{[m;p;v]
 cs: {[m;x] "." = m . x}[m;] {x + y}[v;]\p;
 -1_  cs
 }


d1p1:{[m]
 p: locate[m;"^"];
 v: -1 0;
 m:.[m;p;:;"."];
 visited: 0 * `int$ m;

 inside: 1b;
 while[all inside;
  l: follow[m;p;v];
  visited: .[;;:;1]/[visited;l];
  p: last l;
  inside: (p+v) < count[m];
  v: v[1], -1*v[0]; / turn right

  ];
 
 visited
 }


d1p2:{[m]
 p: locate[m;"^"];
 v: -1 0;
 m:.[m;p;:;"."];
 visited: 0 * `int$ m;

 inside: 1b;
 bs:0;
 while[all inside;
  l: follow[m;p;v];
  vn: v[1], -1*v[0]; / turn right
  bs+: sum visited ./: last each follow[m;;vn] each 1_l;
  
  visited: .[;;:;1]/[visited;l];
  p: last l;
  inside: (p+v) < count[m];
  v: vn;

  ];
 bs
 /visited
 }


/check:{[lv;step]
// 0N!lv; 0N!step;
/ f: 0b vs "x"$1 2 4 8 @ mod[step+1;4];
/ sum any each (any each) each lv &\:\: f
/ }
/
/d1p2:{[m]
/ p: locate[m;"^"];
/ v: -1 0;
/ m:.[m;p;:;"."];
/ visited: (count[m], count[m]) # enlist 00000000b;
/
/ block:0;
/ step:0;
/ inside: 1b;
/ while[all inside;
/  l: follow[m;p;v];
/  f: 0b vs "x"$1 2 4 8 @ step;
/
/  vn: v[1], -1*v[0]; / turn right
/  ps: 0N!visited ./: last each follow[m;;vn] each -1_l;
/  visited: .[;;|;f]/[visited;l];
/  
/  /cs: check[ps ;step];
/  /  0N!cs;
/  /block +: cs;
/
/  p: last l;
/  inside: (p+v) < count[m];
/  v: vn;
/  step: mod[step+1;4];
/  ];
/ 
/ block
/ }

