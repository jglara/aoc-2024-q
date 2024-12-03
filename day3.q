i:raze read0`:data/day3.txt


d1p1:{
 / parse input
 i: ^[0;] each ("J"$) each vs[","] each first each vs[")"] each "mul(" vs x;
 sum prd each i
 }

d1p2:{
 / remove everything betweent don't() and do
 i1: raze  raze first each vs["don't()";] each "do()" vs x;
 d1p1 i1
 }

(d1p1 i; d1p2 i)
