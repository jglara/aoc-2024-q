input0:1 10 100 2024
input:"J"$ read0 `:data/day22.txt


xor:{ 0b sv (0b vs x) <> (0b vs y) }

nsec:{
 x: mod[xor[64*x;x];16777216];
 x: mod[xor[div[x;32];x];16777216];
 x: mod[xor[x*2048;x];16777216];
 x
 }


d22p1:{[input]
 sum { 2000 nsec/ x}  each input
 }
