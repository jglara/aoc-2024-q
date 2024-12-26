input0: ("-"vs) each read0 `:data/day23_test.txt
input: ("-"vs) each read0 `:data/day23.txt

adj:{[vxs;nds]
 nds ! {[vxs;x] except[;x] raze vxs where any each vxs = x}[vxs] each nds
 }



triads:{[adja; vxs]
 
 asc distinct asc each raze {[adja;vxs;x] x,/: (inter/) adja each x }[adja;vxs] each vxs
 }

d23p1:{[input]
 nds: distinct raze input;
 ts: `$ nds where like[;"t?"] each nds;
 vxs: `$ input;
 nds: `$ nds;


 adja: adj[vxs; nds];
 trs: triads[adja;vxs];
 trs: trs where any each trs in ts;

 count trs 
 }

d23p2:{[input]
 nds: `$ distinct raze input;
 vxs: `$ input;

 adja: adj[vxs; nds];
 trs: triads[adja]\vxs;
 "," sv string first first -2#trs
 }

