input: read0 `:data/day21.txt
input0: ("029A";"980A";"179A";"456A";"379A");


numpad2dir:("0123456789A "!(3 1i;2 0i;2 1i;2 2i;1 0i;1 1i;1 2i;0 0i;0 1i;0 2i; 3 2i; 3 2i))
dir2dirpad:((-1 0i;1 0i;0 -1i;0 1i)!"^v<>")
dirpad2dir:("^v<>A "!(0 1i;1 1i; 1 0i; 1 2i; 0 2i; 0 2i))

/ dirs to go to t1 from t2
npseq:{[pad;invalid;t1;t2]
 if[not all (t1,t2) in key pad; :()];
 
 d: pad[t1] - pad[t2];
 d0: signum[d 0],0i;
 d1: 0i,signum[d 1];
 p1: (abs[d][1] # enlist[d1]), (abs[d][0] # enlist[d0]); / path 1 row, column
 p2: (abs[d][0] # enlist[d0]), (abs[d][1] # enlist[d1]); / path 2 column,row

 if[any invalid in pad[t2] +\ p2; :enlist[p1]];
 if[any invalid in pad[t2] +\ p1; :enlist[p2]];

 distinct enlist[p1],enlist[p2]
 
 }


/ cost of pressing a key /giving by the sequence ks
/ kpcost: cost of each key (from the previos level
kcost:{[kpcost; ks]
 {[kpcost;x] sum kpcost prior x}[kpcost] each "^v<>A" ? ,["A"] each ks
 }

kscosts:{[kpcost]
 "^v<>A" {[kpcost;x;y] min kcost[kpcost] trim each ,[;"A"] each dir2dirpad npseq[dirpad2dir;0 0i;x;y]}[kpcost]/:\: "^v<>A"
 }

dscosts:{[kpcost]
 "0123456789A" {[kpcost;x;y] min kcost[kpcost] trim each ,[;"A"] each dir2dirpad npseq[numpad2dir;3 0i;x;y]}[kpcost]/:\: "0123456789A"
 }


d21p1:{[input]
 kpcost: 5 5 # 1;
 kpcost: 2 kscosts/ kpcost;
 dcost: dscosts[kpcost];


 cs: {[dcost;x] sum {[dcost;x;y] dcost[x;y] }[dcost] prior "0123456789A" ? x }[dcost] each ,["A"] each input;
 ns:"J"$ (-1_) each input;
 sum cs * ns 
 }

d21p2:{[input]
 kpcost: 5 5 # 1;
 kpcost: 25 kscosts/ kpcost;
 dcost: dscosts[kpcost];


 cs: {[dcost;x] sum {[dcost;x;y] dcost[x;y] }[dcost] prior "0123456789A" ? x }[dcost] each ,["A"] each input;
 ns:"J"$ (-1_) each input;
 sum cs * ns 
 }
