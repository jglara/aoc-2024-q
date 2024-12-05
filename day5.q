/ parse input
i: read0 `:data/day5.txt;
i0: read0 `:data/day5_test.txt;

pr:{[i]
 ir: (0,where 0=count each i) _ i;
 // k:page values: list of paged that can not be before k
 ruls: ("J"$ "|"vs) each ir 0;
 ruls1:{[r;x] r[;1] x}[ruls;] each (group ruls[;0]);
 
 ruls1
 }

pu:{[i]
 i: (0,where 0=count each i) _ i;
 
 upds: 1_ ("J"$ ","vs) each i 1;
 upds 
 }

/ pred
/ x: list
/ returns a dict with predecedors of each member (except first)
pred:{[l]
 (1_l) ! 1_ reverse 1_ count[l] {1_ x}\ reverse l
 }

 / u: update list
/ r: preceding rules
/ check that update list follows preceding rules
invalid:{[r;u]
 p: pred u;
 any key[p] {[r;x;y] any r[x] in y}[r;;]' value p
 }

d5p1:{[i]
 rs: pr i;
 us: pu i;
 valid: us where not invalid[rs;] each us;
 mid: {x @ -1+`int$ count[x]%2} each valid;

 sum mid
 }


// part 2

/ rs: precedence rules
/ l: updates
/ x: element of l to put in right order according to rs
reorder:{[rs;l;x]
 pre: l where not l in rs[x]; / elements that should go before x
 post: l where l in rs[x];    / elements that shoukd go after x
 pre,x,post
 }

reorderall:{[rs;l]
 // iterate over each element to reorder
 () {[rs;x;y] reorder[rs;x;y]}[rs;;]/ l
 }

d5p2:{[i]

 rs: pr i;
 us: pu i;

 nvalid: us where invalid[rs;] each us;

 valid: reorderall[rs;] each nvalid;
 mid: {x @ -1+`int$ count[x]%2} each valid;
 
 sum mid
 } 


(d5p1 i; d5p2 i)
