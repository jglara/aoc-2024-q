/ parse input
i:"J"$(" "vs) each read0 `:data/day2.txt
/ test input
i0: (7 6 4 2 1;1 2 7 8 9;9 7 6 2 1;1 3 2 4 5;8 6 4 4 1;1 3 6 7 9)

/ retun if list is safe
safe: {
 ds: 1_ deltas x;
 c1:all within[;1 3] abs(ds);  / check cond1
 c2:1=count distinct signum ds; / check cond2
 c1 & c2
 }

/ sum all safe entries
d2p1:{
 sum safe each x
 }

/ return safe if at least removing of one is safe: brute search
safe_1: {
 perm: til[count x] except/: til[count x];
 any safe each x @/: perm
 }

d2p2:{
 sum safe_1 each x
 }
