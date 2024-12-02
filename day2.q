/ parse input
i:"J"$(" "vs) each read0 `:data/day2.txt
/ test input
i0: (7 6 4 2 1;1 2 7 8 9;9 7 6 2 1;1 3 2 4 5;8 6 4 4 1;1 3 6 7 9)

d2p1:{
 ds:{1_ deltas x} each x;  / compute deltas
 c1:all each within[;1 3] each abs(ds);  / check cond1
 c2:{(all x < 0) | (all x > 0)} each ds; / check cond2
 sum c1 & c2
 }

d2p2:{
 ds:{1_ deltas x} each x;  / compute deltas
 c1:0 ,/: 1+where each within[;1 3] each abs(ds);  / find faults of cond1
 c21:0 ,/: 1+ where each {x > 0} each ds; / find faults of cond1 1
 c22:0 ,/: 1+ where each {x < 0} each ds; / find faults of cond1 2
 c2: ?[(count each c21) > (count each c22); c21; c22];
 tol:c1 inter' c2; / tolerations
 ff: 2> (count each x) -' count each tol;
 x2: (x where ff) @' (tol where ff);
 d2p1 x2
 }
