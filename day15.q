i: read0 `:data/day15_test.txt

D: (0 -1; 0 1; -1 0; 1 0); /  < > ^ v

locate:{[m;c]
 raze til[count m] ,/:' where each m=c
 }

/ move in map m from p in direction d
move:{[m_p;d]
 m: m_p 0;
 p: m_p 1;
 
 $[ .[m; p+d]="."; :enlist[m], enlist[p+d]; / empty : move one position
  .[m; p+d]="#"; :enlist[m], enlist[p];   / wall  : go back
  ];

 / first pos in dir where there is no "O"
 n: {[m;p] .[m;p] = "O" }[m] {[p;d] p+d}[;d]/p+d;
 if[.[m; n]="#"; :enlist[m], enlist[p];];   / wall  : go back

 / push boxes by swapping last box with empty space
 m: .[m;n;:; "O" ];
 m: .[m;p+d;:; "." ];

 enlist[m], enlist[p+d] / move one position 
 }

d14p1:{[i]
 split: first where 0 = count each i;
 dirs: D "<>^v" ? raze  _[;i] 1+ split;
 m: first (0,split) _ i;
 p: first locate[m;"@"];
 m: .[m;p;:;"."];

 m_p: (enlist[m],enlist[p]) move/dirs;
 sum {x[1] + 100 * x[0]} each locate[;"O"] m_p[0]

 }
