
/ parse input
i:"J"$("   "vs) each read0 `:data/day1.txt
/ test input
i0: (3 4; 4 3; 2 5; 1 3; 3 9; 3 3)

/ part 1: sum differences after ordering
d1p1:{
 sum abs (asc x[;0]) - (asc x[;1])
 }


/ part 2: count each different value in second column and multiply key by value if it appears in column 1
d1p2:{
 k: count each group x[;1];
 sum x[;0] * k x[;0]
 }

(d1p1 i; d1p2 i)
