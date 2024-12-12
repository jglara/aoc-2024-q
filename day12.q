i: read0 `:data/day12.txt
i0: ("AAAA"; "BBCD"; "BBCC"; "EEEC")
i1: ("OOOOO"; "OXOXO"; "OOOOO"; "OXOXO"; "OOOOO")

merge_r:{[as;gs]
 asgs: as ,' gs;
 r: ({if[x[0]=y[0]; :x]; y}\) asgs;
 r[;1]
 }

merge:{[m]
 gs: #[count[m], count[m]; til[count[m] *count m]];

 i:0;
 while[i< count[m];
  gs: m merge_r' gs;
  gs: flip flip[m] merge_r' flip[gs];
  i +: 1;
  ];

 gs
 }

locate:{[m;c]
 raze til[count m] ,/:' where each m=c
 }

perimeter:{[ps]
 per: (raze (0 1; 0 -1; 1 0; -1 0) +/:\: ps) except ps;
 count per
 }

d12p1:{[m]
 m: merge[m];
 gs: distinct raze distinct each m;
 rs: m locate/: gs;
 ps: perimeter each rs;
 as: count each rs;

 sum ps *' as
 }
