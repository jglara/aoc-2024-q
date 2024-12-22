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
 p1: (abs[d][1] # enlist[d1]), (abs[d][0] # enlist[d0]); / path 1
 p2: (abs[d][0] # enlist[d0]), (abs[d][1] # enlist[d1]); / path 2

 ?[any invalid in pad[t2] +\ p2; p1; p2] 
 
 }

seq2pad:{[pad;invalid;seq]
 raze ,[;"A"] each dir2dirpad each npseq[pad;invalid] prior seq
 }

chainpads:{[seq]
 seq: 0N! seq2pad[numpad2dir;3 0i;seq];
 seq: 0N! seq2pad[dirpad2dir;0 0i;seq];
 seq: seq2pad[dirpad2dir;0 0i;seq];
 seq
 }

d21p1:{[input]
 cs: count each chainpads each input;
 ns: "J"$ -1_/: input;
 sum cs * ns
 }
