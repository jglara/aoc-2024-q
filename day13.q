i: ("J"$) each (" "vs) each read0 `:data/day13_parsed.txt
i0: ("J"$) each (" "vs) each read0 `:data/day13_test_parsed.txt

\P 14 // increase the display precision

// invert a matrix
invm: {[m]
 det: (-/) m[0] * reverse m[1];
 m1: ((1; -1); (-1;1)) *' reverse each flip reverse each m;
 m1 % det
 }

// solve a 2x2 linear equation
solve: {[b;p]
 ib: invm[b];
 sum each ib *\: p
 }

// reorder input to get matrix and solve it
but: {[x]
 b: flip 2 2 # first 0 4_ x;
 p: last 0 4_  x;
 s: solve[b;p]
 }

// calculate tokens needed after solving
// only integral solutions are valid, 0.001 is a good tolerance value for p1 and p2
tokens:{[x]
 s: but[x];
/ if[any 100 < s; :0];
 if[any 0> s; :0];
 if[any {0.001< abs(x - floor x+0.5)} s; :0];
 sum (3 1) * s
 }

d13p1:{[i]
 toks: tokens each i;
 sum toks
 }

/ jsut adjust values and solve the same as p1
d13p2:{[i]
 i:0 0 0 0 10000000000000  10000000000000  +/: i;
 toks: tokens each i;
 sum toks
 }


(d13p1 i; d13p2 i)
