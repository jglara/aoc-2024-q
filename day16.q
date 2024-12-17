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

 select min(md) from t where r=e[0],c=e[1]
 
 }


