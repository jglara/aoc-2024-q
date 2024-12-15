parsei:{[i]
 { { "J"$ vs[","] each 1_ vs["="] x} each vs[" "] x} each i
 }

i: "J"$ vs[" "] each read0 `:data/day14_parsed.txt
i0: "J"$ vs[" "] each read0 `:data/day14_test_parsed.txt

state:{[t;w;h;x]
 p: -2 _ x;
 v: 2 _ x;
 mod[p + t*v; w,h]
 }

quad:{[w;h;xs]
 wm: w div 2;
 hm: h div 2;
 
 xs: xs where not wm = xs[;0];
 xs: xs where not hm = xs[;1]; /filter out robots in the middle

 value count each group xs >\: wm, hm
 }


d14p1:{[i;w;h]
 xs: state[100;w;h] each i;
 prd quad[w;h] xs
 }

/ find the minimum point, where the robots are almost in the same quadrant
d14p2:{[i;w;h]
 qs: {quad[w;h] state[y;w;h] each x}[i] each til 101 * 103;
 prs: prd each qs;
 
 where prs = min prs
 }


d14p1[i;101;103]
