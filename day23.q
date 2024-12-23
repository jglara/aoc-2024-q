input0: ("-"vs) each read0 `:data/day23_test.txt
input: ("-"vs) each read0 `:data/day23.txt

neighs:{[input;x]
 except[;x] raze input where any each input = x
 }

triads:{[vxs]
 asc distinct asc each raze {[vxs;x] (x[0], x[1]),/: neighs[vxs;x 0] inter neighs[vxs;x 1] }[vxs] each vxs
 }

d23p1:{[input]
 nds: distinct raze input;
 ts: `$ nds where like[;"t?"] each nds;
 vxs: `$ input;

 trs: triads[vxs];
 trs: trs where any each trs in ts;

 count trs

 /adj: nds ! {[input;x] input[;1] where input[;0] = x}[input] each nds;
 
 }
