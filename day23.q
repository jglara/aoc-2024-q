input0: ("-"vs) each read0 `:data/day23_test.txt
input: ("-"vs) each read0 `:data/day23.txt

neighs:{[input;x]
 except[;x] raze input where any each input = x
 }

d23p1:{[input]
 nds: distinct raze input;
 ts: `$ nds where like[;"t?"] each nds;
 vxs: `$ input;

 clis: vxs where any each vxs in ts;
 clis: inccli[vxs;clis];
 count clis
 
 }

/ list of cliques 1 element bigger than cli
inccli:{[vxs;clis]
 clis: clis ,/:' ((inter/) neighs[vxs] each) each clis;
 asc distinct asc each raze clis
 }

d23p2:{[input]
 nds: distinct raze input;
 ts: `$ nds where like[;"t?"] each nds;
 vxs: `$ input;

 clis: vxs where any each vxs in ts;
 clis: {count x} inccli[vxs]\clis;
 break;
 last -1_ clis
 }
