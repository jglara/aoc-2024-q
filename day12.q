i: read0 `:data/day12.txtxo
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

sides:{[ps]
 per: (raze (0 1; 0 -1; 1 0; -1 0) +/:\: ps) except ps;
 rws: {[per;x] per[;1] where per[;0] = x}[per;] each distinct per[;0];
 rws: {x where 1<> 0, 1_ deltas x} each (distinct per[;0])!rws;
 ps: raze (key rws) ,/:' value rws;
 
 rws: {[ps;x] ps[;0] where ps[;1] = x}[ps;] each distinct ps[;1];
 rws: {x where 1<> 0, 1_ deltas x} each (distinct ps[;1])!rws;
 rws: raze (key rws) ,/:' value rws;
 count rws
 }

d12p1:{[m]
 m: merge[m];
 gs: distinct raze distinct each m;
 rs: m locate/: gs;
 ps: perimeter each rs;
 as: count each rs;

 sum ps *' as
 }

d12p2:{[m]
 m: merge[m];
 gs: distinct raze distinct each m;
 rs: m locate/: gs;
 sds: sides each rs;
 as: count each rs;

 sum sds *' as
 }

