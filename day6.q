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

