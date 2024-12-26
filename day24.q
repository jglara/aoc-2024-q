input0: read0 `:data/day24_test1.txt
input1: read0 `:data/day24_test2.txt
input: read0 `:data/day24.txt


OPS:`AND`XOR`OR;

doop:{[vals;ops;x]
 if[x in key vals; :vals[x]];
 (op;l;r): ops x;
 vl: doop[vals;ops;l];
 vr: doop[vals;ops;r];

 vx: ((&;<>;|) OPS ? op) [vl;vr];
 vals[x]: vx;
 vx
 }

d24p1:{[input]
 i: _[;input] 0,where 0 = count each input;
 vals: "SB"$/: ": "vs/:  i 0;
 ops: {(x 4; x 1 0 2)} each `$ " "vs' 1_i 1;

 vals: (vals[;0] ! vals[;1]);
 ops:(ops[;0] ! ops[;1]);

 zs: reverse asc { x where like[;"z*"] each string x} key ops;

 2 sv doop[vals;ops] each zs
 }


