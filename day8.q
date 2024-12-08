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
 ps:c +/: c -/: as; // apply relative distance to center
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

// part 2
/ reflect as with c as center
reflect_multi:{[m;c;as]
 ds: raze (1+til[count[m]]) */:\: c -/: as; / deltas to apply to center. different multiplos of relative distance
 ps:c +/: ds;
 r: .[;;:;1]/[m;ps where all each within[ps;0, -1+count[m]]];
 r
 }

/ reflect all
reflectall_multi:{[m;as]
 reflect_multi[;;as]/[m;as]
 }

d8p2:{[m]
 as: locate[m;] each antennas[m];
 antinodes: (count[m], count[m]) # 0;

 sum sum reflectall_multi/[antinodes;as]
 }


(d8p1[i]; d8p2[i])
