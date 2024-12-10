i: read0 `:data/day10.txt
i0: read0 `:data/day10_test.txt

locate:{[m;c]
 raze til[count m] ,/:' where each m=c
 }

/ next step from point p
step:{[m;p]
 ps: (0 1;0 -1;1 0;-1 0) +\: p; 
 ps: ps where (("J"$) (m . p)) = (-1+("J"$) each m ./: ps);
 distinct ps
 }

/ trailpaths starting at s
trailpath:{[m;s]
 ends: 9 {[m;ps] raze m step/: ps }[m;]/ enlist s;
 ends
 }


d9p1:{[m]
 start: locate[m;"0"];
 scores: distinct each m trailpath/: start;
 sum count each scores
 }


d9p2:{[m]
 start: locate[m;"0"];
 scores: m trailpath/: start;
 sum count each scores
 }
