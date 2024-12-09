i: raze read0 `:data/day9.txt
i0: "2333133121414131402"

compact:{[i]
 sz: ("J"$) each i;
 ids0: til[ceiling .5 * count i];
 ids: -1_ raze ids0 ,\: (-1);
 mem: raze sz {x # y}' ids;
 hs: sum (-1) = mem;
 idsr: first hs cut reverse[mem] where not (-1)  = reverse mem; // ids to realloc
 ixr: where (-1) = mem; // idx where to realloc
 mem: @[mem;ixr;:;idsr]; / realloc memory

 /es: (count[mem]-count[ixr]) + til[count ixr];
 mem: first (count[mem] - hs) cut mem;
 
 mem
 }


d9p1:{[i]
 c: compact[i];
 sum til[count c] *' c
 }


// part 2
compact1f:{[state;id_idx_sz]
 hs_sz: state 0;
 
 idx: id_idx_sz 1;
 sz: id_idx_sz 2;

 hi: first where (hs_sz[;0] >=sz)& hs_sz[;1] <idx;
 if[null hi; :enlist[hs_sz], enlist[state[1], enlist[id_idx_sz]]];

 /0N!hs_sz[hi];
 hidx: hs_sz[hi;1];
 hsz: hs_sz[hi;0];

 state: enlist[@[hs_sz;hi;:;((hsz-sz), hidx+sz)]], enlist[state[1], enlist[(id_idx_sz[0], hidx, sz)]];
 state
 }

// compact files
compactf:{[i]
 sz: ("J"$) each i;
 ids0: til[ceiling .5 * count i];
 idxs: 0, 0 +\sz;

 ids_sz: ids0 ,' {[idxs;sz;i] idxs[i],sz[i]}[idxs;sz;] each 2*til[count ids0];
 hs_sz: {[idxs;sz;i] sz[i],idxs[i]}[idxs;sz;] each -2_ 1+2*til[count ids0];

 state:enlist[hs_sz], enlist[()];

 state compact1f/reverse ids_sz

 }


d9p2:{[i]
 cc: compactf[i] 1;
 sum sum each cc[;0] *' cc[;1] +' (til each cc[;2])
 }
