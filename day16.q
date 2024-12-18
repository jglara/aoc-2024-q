m:  read0 `:data/day16_test2.txt

D: (0 1; -1 0; 0 -1; 1 0); /  > ^ < v

locate:{[m;c]
 raze til[count m] ,/:' where each m in c
 }

upd1:{[m;r;c;d;md]
 rp: r + D[d;0];
 cp: c + D[d;1];
 dp: d;

 }


d16:{[m]
 s: first locate[m;"S"];
 e: first locate[m;"E"];
 m: .[m;s;:;"."];
 m: .[m;e;:;"."];

 t: raze locate[m;"."] ,/:\: 0 1 2 3;
 t: ([r:t[;0]; c:t[;1]; d:t[;2]]; md: count[t] # 0Wj);

 sd: 2;
 t[s[0], s[1], sd]: 0;
 u: select r,c,d,mdp:md from t where r=s[0],c=s[1],d=sd;

 while[ count u;
 
  / apply actions
  u1: update r: r+D[d;0], c: c+D[d;1], mdp:mdp+1 from u;
  u1: select from u1 where  in[.[m] each (r,'c);"."];
  u2: update d: mod[d+1;4], mdp:mdp+1000 from u;
  u3: update d: mod[d-1;4], mdp:mdp+1000 from u;
  u: u1,u2,u3;


  / select better action
  u: select r,c,d,md:mdp from u lj t where mdp < md;
  t: t lj `r`c`d xkey u;
  u: update mdp:md from u;
  ];
 0N!select min(md) from t where r=e[0],c=e[1];


 / part 2 
 /tt: `p xkey select p:(r,'c) , md from t where md=(min;md) fby ([]r;c);
 queue: select from t where r=e[0],c=e[1], md=min(md);
 
 while[ count (select from visited where r=s[0],c=s[1]);
  visited ,: queue;
  nq1: (ungroup select r, c, d: (d {mod[x+y;3]}/:\:-1 1) from queue) lj t;
  nq2: select r: r-D[d;0], c: c-D[d;1], d from queue;
  nq2: (select from nq2 where "." = (m ./: r,'c)) lj t;
  queue: select from nq1,nq2 where md=min(md),md>0;
  ];

 break;
 
 }


