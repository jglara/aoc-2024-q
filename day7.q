i0: read0 `:data/day7_test.txt
i: read0 `:data/day7.txt


/ test values
tvs: {
 "J"$ first each (": "vs) each x
 }

eqs: {
 ("J"$) each vs[" ";] each first each (1_) each (": "vs) each x
 }

/ join numbers
jn:{
 "J"$ raze string x, string y
 }

/ test single eq
test:{[tv;eq]
 tv in ({(x + y), (x * y)}/) eq
 }


d1p1:{[tv;eq]
 sum tv where tv test' eq
 }


// part2
testp2:{[tv;eq]
 tv in ({(x + y), (x * y), (x jn\: y) }/) eq
 }


d1p2:{[tv;eq]
 sum tv where tv testp2' eq
 }
