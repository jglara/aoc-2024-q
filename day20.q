m0: read0 `:data/day20_test.txt
m: read0 `:data/day20.txt

D: (0 1; -1 0; 0 -1; 1 0); /  > ^ < v

locate:{[m;c]
 raze til[count m] ,/:' where each m=c
 }

cheatsave:{[ds;p;d]
 ps: 2 {x+y}[d]\p;
 cheat: ds ./: ps;
 saved: ?[010b ~ 0Wj=cheat; -2+cheat[2]-cheat[0]; 0];
 saved
 }

bfs:{[m;s;e]

 steps:0;
 queue: enlist s;
 visited: enlist ();

 // distances from s to e
 ds: (count[m], count[m 0]) # 0Wj;

 while[ count queue;
  visited ,: queue;
  ds: .[;;:;steps]/[ds;queue]; / update distances

  queue: distinct raze queue +\:/: D;
  queue: queue where "#" <> m ./: queue;
  queue: queue where not queue in visited;

/  if[ 0= count queue; break];
  steps +: 1;
  ];

 
 ds
 }

d20p1:{[m]
 s: first locate[m;"S"];
 e: first locate[m;"E"];

 ds: bfs[m;s;e];
 
 ps: raze til[count m] ,/:' where each ds<>0Wj;

 cs: raze {[ds;ps;d] cheatsave[ds;;d] each ps}[ds;ps] each D;
/  break;
 sum count each group cs where cs>=100
 

 }
