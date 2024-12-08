i0: read0 `:data/day8_test.txt
i: read0 `:data/day8.txt

/ locate c in m
locate:{[m;c]
 raze til[count m] ,/:' where each m=c
 }

/ find different antennas
antennas:{[m]
 except[;"."] distinct raze distinct each m
 }

/ reflect as with c as center
reflect:{[m;c;as]
 cc:m . c;
 ps:c +/: c -/: as;
 r: .[;;:;1]/[m;ps where all each within[ps;0, -1+count[m]]];
 .[r;c;:;cc] / restore center
 }

/ reflect all
reflectall:{[m;as]
 reflect[;;as]/[m;as]
 }

d8p1:{[m]
 as: locate[m;] each antennas[m];
 antinodes: (count[m], count[m]) # 0;

 sum sum reflectall/[antinodes;as]
 }
