ps: ("J"$ ","vs) each read0 `:data/day18.txt;
ps0: ("J"$ ","vs) each read0 `:data/day18_test.txt;
D: (0 1; -1 0; 0 -1; 1 0); /  > ^ < v

d18p1:{[m]
 s: 0 0;
 e: 2 # count[m]-1;

 steps:0;
 queue: enlist s;
 visited: ();
 while[ not e in queue;
  visited ,: queue;
  queue: distinct raze queue +\:/: D;
  queue: queue where 0 = m ./: queue;
  queue: queue where not queue in visited;
  if[ 0= count queue; :0];
  steps +: 1;
  ];

 
 steps
 }

/m: flip .[;;:;1]/[71 71  # 0; 1024 # ps];
d18p1[flip .[;;:;1]/[7 7  # 0; 12 # ps0]];
/d18p1[flip .[;;:;1]/[71 71  # 0; 1024 # ps]];
