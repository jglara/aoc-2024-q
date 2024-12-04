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

//// Part 2

/ cross conv matrix (101;010;101)  in a coord
/x: coord
/m: matrix
cross:{[m;x]
 m ./: x +/: (-1 -1; -1 1; 0 0; 1 -1; 1 1)
 }

/ all crossed convolutions in the matrix
convs:{[m]
 conv[m;] each raze (1+til[-2+count m]) ,/:\: (1+til[-2+count m 0])
 }

/ find occurrences of different X-MAS in each convolution
d4p2:{[m]
 sum sum {{all y = x}[;x] each (convs y)}[;m] each ("MMASS"; "MSAMS"; "SSAMM"; "SMASM")
 }
