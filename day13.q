i: ("J"$) each (" "vs) each read0 `:data/day13_parsed.txt
i0: ("J"$) each (" "vs) each read0 `:data/day13_test_parsed.txt

invm: {[m]
 det: (-/) m[0] * reverse m[1];
 m1: ((1; -1); (-1;1)) *' reverse each flip reverse each m;
 m1 % det
 }

solve: {[b;p]
 ib: invm[b];
 sum each ib *\: p
 }

but: {[x]
 b: flip 2 2 # first 0 4_ x;
 p: last 0 4_  x;
 s: solve[b;p]
 }

tokens:{[x]
 s: but[x];
 if[any 100 < s; :0];
 if[any 0> s; :0];
 if[any {0.0001< abs(x - floor x+0.5)} s; :0];
 sum (3 1) * s
 }

d13p1:{[i]
 toks: tokens each i;
 sum toks
 }
