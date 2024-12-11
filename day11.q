i: "J"$ " " vs first read0 `:data/day11.txt
i0: 125 17

step:{[n]
 if[n=0;:enlist 1];
 s: string n;
 if[ mod[count s;2] ; :enlist n*2024];
 "J"$ cut[ floor .5 * count s; s]
 }

stepn:{[t_n]
 t: t_n 0;
 n: t_n 1;
 
 (t-1) ,/: step[n]

 }

stones:{[t;ns]
 stack: t ,/: ns;
 memo: ((0 0; 0 1))!(1 1);
 while[ count stack;
  it: first stack;
  nn: stepn[it];
  vv: memo @/: nn;
  $[0 = it 0; (memo[it]: 1; stack: 1_ stack;);            / found, remove from stack
   not null memo[it]; stack: 1_ stack;            / found, remove from stack
   any null vv; stack: (nn where null vv), stack; / add to stack not found items, to be searched later
   (memo[it]: sum vv; stack: 1_ stack) / add element to memo, remove from stack
   ]      
  ];

 memo
 }

d11p1:{
 sum stones[25; x] 25,/:x
 }

d11p2:{
 sum stones[75; x] 75,/:x
 }
