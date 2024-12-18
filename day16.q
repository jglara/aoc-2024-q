m0:  read0 `:data/day16_test2.txt
m:  read0 `:data/day16.txt

D: (0 1; -1 0; 0 -1; 1 0); /  > ^ < v

locate:{[m;c]
 raze til[count m] ,/:' where each m in c
 }

upd1:{[m;r;c;d;md]
 rp: r + D[d;0];
 cp: c + D[d;1];
 dp: d;

 }


d16p1:{[m]
 s: first locate[m;"S"];
 e: first locate[m;"E"];
 m: .[m;s;:;"."];
 m: .[m;e;:;"."];

 t: raze locate[m;"."] ,/:\: 0 1 2 3;
 t: ([r:t[;0]; c:t[;1]; d:t[;2]]; md: count[t] # 0Wj);

 tf:([]; r:(); c:());
 
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
 total:0;
 visited: select r,c from t where md=0;
 while[ 0=count select from queue where r=s[0],c=s[1];
/  break;
  nq1: (ungroup select rp:r, cp: c, dp:d, r, c, d: (d {mod[x+y;4]}/:\:-1 1),cost:1000 from queue) lj t;
  nq2: select rp:r, cp: c, dp:d, r: r-D[d;0], c: c-D[d;1], d, cost:1 from queue;
  nq2: (select from nq2 where "." = (m ./: r,'c)) lj t;
  /queue: 0N!select from nq1,nq2 where (md+cost)=min(md+cost);
  nq: update tcost: cost+md from nq1,nq2;
  queue: distinct select from nq where tcost=(min;tcost) fby ([]rp;cp;dp);
  visited ,: distinct select r,c from queue;
  total +: 1;
  ];

 1+count distinct visited
 
 }


d16p2:{[m;score]
 s: first locate[m;"S"];
 e: first locate[m;"E"];
 m: .[m;s;:;"."];
 m: .[m;e;:;"."];

 total: 0;
 pending: enlist (`p`sc`scl!enlist[s], 0, score );
 while[ count pending;
  fp: first pending;
  
  
  pending: 1_ pending;
  ];

 total
 }
