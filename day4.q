i: read0 `:data/day4.txt

i0:("MMMSXXMASM";
 "MSAMXMSMSA" ;
 "AMXSXMAAMM" ;
 "MSAMASMSMX" ;
 "XMASAMXAMM" ;
 "XXAMMXXAMA" ;
 "SMSMSASXSS" ;
 "SAXAMASAAA" ;
 "MAMMMXMMMM" ;
 "MXMXAXMASX")

/ count xmas appareance in horizontal
xmas:{
 count raze raze  ss\:[x;] each ("SAMX";"XMAS")
 }

/ diagonals
diag:{
 nr: count x;
 nc: count[x 0];
 coord: {[x;nr;nc] (x+ til[nr]) ,' til[nc]}[;nr;nc] each til[nr];
 coord2: {[x;nr;nc] til[nr] ,' (1+x+til[nc])}[;nr;nc] each til[nr];
 (x ./:) each (coord, coord2)
 }

d4p1:{
 xmas[x] + xmas[flip x] + xmas[diag x] + xmas[diag flip reverse x]
 }
