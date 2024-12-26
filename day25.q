input0: read0 `:data/day25_test.txt
input: read0 `:data/day25.txt

day25p1:{[input]
 input: enlist[""],input;
 cts: where 0 = count each input;
 schs: (1_) each _[;input] cts;
 locks: {sum each flip "#" = x} each schs where "#" = schs[;0;0];
 lkeys: {sum each flip "." = x} each schs where "." = schs[;0;0];

 sum sum each lkeys {all 0 <=x - y}/:\: locks
 }
