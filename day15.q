i: read0 `:data/day15.txt

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

/ part 2

expand:{[m]
 e: "#.O@" ! ("##"; ".."; "[]"; "@.");
 each[raze e @/: ; m]
 }


/ move from c to next white space 1 to dir d
move2h:{[m_p;d]
 m: m_p 0;
 p: m_p 1;
 
 l: m[p 0];
 c: p 1;
 
 cs: {[l;x] any l[x]= 2 3}[l] +[;d[1]]\c+d[1];
 if[1=l[last cs]; :m_p]; /no movement

 l[cs]: l[c,-1_cs];
 l[c]: 0;

 m[p 0]: l;

 enlist[m], enlist[p+d]
 }

/ move from c to next white space 1 to dir d vertically
move2v:{[m_p;d]
 m: m_p 0;
 p: m_p 1;

 dv: d 0; / only row

 l: m[p 0];
 m: .[m;p;:;0];
 
 r: dv+p 0;
 cs: enlist p 1;
 while[count cs;
  nl: m[ r ];
  ncs: cs;
  ncsl: 1+cs where 2= nl[ncs]; // add right parts of blocks
  ncsr: -1+cs where 3= nl[ncs]; // add left parts of blocks
  ncs: distinct ncs,ncsl,ncsr;
  ncs: ncs where 0 <> nl[ncs];   // empty cells removal
  if[ any 1=nl[ncs]; :m_p]; // any wall found, return no movement

  
  m[r;ncs]: 0; /now make room
  m[r;cs]: l[cs]; /move prev line
  
  r +: dv; /next row
  l: nl;
  cs: ncs;
  
  ];
 
 
 enlist[m], enlist[p+d]
 }

/ move in map m from p in direction d (day 2)
moved2:{[m_p;d]
 if[0 = d 0; :move2h[m_p;d]];

 move2v[m_p;d]
 }

d14p2:{[i]
 split: first where 0 = count each i;
 dirs: D "<>^v" ? raze  _[;i] 1+ split;

 m: ".#[]@" ? expand first (0,split) _ i;
 p: first locate[m;4];
/ m: .[m;p;:;0];
 

 m_p: (enlist[m],enlist[p]) moved2/dirs;
 sum {x[1] + 100 * x[0]} each locate[;2] m_p[0]

 }
