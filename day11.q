i: "J"$ " " vs first read0 `:data/day11.txt
i0: 125 17

step:{[n]
 if[n=0;:enlist 1];
 s: string n;
 if[ mod[count s;2] ; :enlist n*2024];
 "J"$ cut[ floor .5 * count s; s]
 }


d11p1:{
 count 25 {raze {raze step x} each x}/ x
 }
