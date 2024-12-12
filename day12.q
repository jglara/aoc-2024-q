i: read0 `:data/day12.txt
i0: ("AAAA"; "BBCD"; "BBCC"; "EEEC")
i1: ("OOOOO"; "OXOXO"; "OOOOO"; "OXOXO"; "OOOOO")
i2: read0 `:data/data12_test2.txt

merge1:{[gs;gid1;gid2]
 ps: locate[gs;gid1];
 .[;;:;gid2]/[gs;ps]
 }

merge_r:{[m;gs;nr]
  {[gs;r;c] merge1[gs; gs[r;c]; gs[r;c-1]]}[;nr;]/[gs; where not differ m[nr]]
  }

merge:{[m]
 gs: #[count[m], count[m]; til[count[m] *count m]];

 gs: merge_r[m;;]/[gs; til count[m]];
 gs: flip merge_r[flip m;;]/[flip[gs]; til count[m]];

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
