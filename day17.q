input0: read0 `:data/day17_test.txt
input: read0 `:data/day17.txt

combo:{[x;state]
 ?[x <4 ; x; state[`a`b`c x-4]]
 }

adv:{[operand;state]
 operand: combo[operand;state];
 state[`a]: div[state `a; prd operand # 2];
 state[`pc] +: 2;
 state
 }

bdv:{[operand;state]
 operand: combo[operand;state];
 state[`b]: div[state `a; prd operand # 2];
 state[`pc] +: 2;
 state
 }

cdv:{[operand;state]
 operand: combo[operand;state];
 state[`c]: div[state `a; prd operand # 2];
 state[`pc] +: 2;
 state
 }


bxl:{[operand;state]
 state[`b]: 0b sv (0b vs state[`b]) <> (0b vs operand);
 state[`pc] +: 2;
 state
 }

bst:{[operand;state]
 operand: combo[operand;state];
 state[`b]: mod[operand;8];
 state[`pc] +: 2;
 state
 }

jnz:{[operand;state]
 state[`pc]: ?[state[`a]=0; state[`pc]+2; operand];
 state
 }

bxc:{[operand;state]
 state[`b]: 0b sv (0b vs state[`b]) <> (0b vs state[`c]);
 state[`pc] +: 2;
 state
 }

out:{[operand;state]
 operand: combo[operand;state];
 state[`o] ,: ",", string mod[operand;8];
 state[`pc] +: 2;
 state
 }

halted:{[prog;state]
 state[`pc] < count[prog]
 }

run1:{[prog;state]
 opcode: prog[ state[`pc] ];
 lit: prog[ 1+state[`pc] ];
 (adv;bxl;bst;jnz;bxc;out;bdv;cdv) [opcode;lit;state]
 }

d17p1:{[input]
 rxs: raze "J"$ (1_ ": "vs) each _[0, where 0 = count each input;input] 0;
 prog: raze "J"$ (","vs) raze 1_":"vs _[0, where 0 = count each input;input] [1;1];
 
 state: (`a`b`c`pc`o!rxs,0,enlist "");

 halted[prog] run1[prog]/state
 }
