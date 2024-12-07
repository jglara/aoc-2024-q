i: read0 `:data/day6.txt
i0: read0 `:data/day6_test.txt

/ locate c in m
locate:{[m;c]
 raze til[count m] ,/:' where each m=c
 }

/follow direction until obstacle
follow:{[m;p;v]
 cs: {[m;x] "." = m . x}[m;] {x + y}[v;]\p;
 -1_  cs
 }


visit:{[m]
 p: first locate[m;"^"];
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

d1p1:{[m]
 sum sum visit[m]
 }

/// part 2
 
cycle:{[m]
 p: first locate[m;"^"];
 v: -1 0;
 m:.[m;p;:;"."];
 corners: (count[m], count[m]) # enlist 00000000b;

 step:0;
 inside: 1b;
 while[inside;
  l: follow[m;p;v];

  f: 0b vs "x"$1 2 4 8 @ step;
  p: last l;
  inside: all ((p+v) < count[m]) and ((p+v) >= 0);
  if[any (corners . p) & f; if[inside; :1b]];
  / $[; :1b];
  corners: .[corners;p;|;f];
  

  v: v[1], -1*v[0]; / turn right  
  step: mod[step+1;4];
  ];
 
 0b
 }


d1p2:{[m]
 path: locate[visit[m];1];

 cs: {[m;x] if["^" = m . x;:0b]; cycle (.[m;x;:;"#"]) }[m;] each path;
 sum cs
 }


(d1p1[i]; d1p2[i])
