
// note: cout still propagates when clear_l asserted low.
module rc_count (input clk, clear_l, cin, output value, cout);

  wire d, ns;

  xor g1 (ns, value, cin);
  and g2 (d, ns, clear_l);
  and g3 (cout, cin, value);

  dff s (value, clk, d);

endmodule

// good for counting patterns I think!
// 10 bit counter
module counter1024 (
output [9:0] value,
output cout, 
input clk, clear_l, inc);

  wire [8:0] co;

  rc_count c0 (clk, clear_l, inc, value[0], co[0]);
  rc_count c1 (clk, clear_l, co[0], value[1], co[1]);
  rc_count c2 (clk, clear_l, co[1], value[2], co[2]);
  rc_count c3 (clk, clear_l, co[2], value[3], co[3]);
  rc_count c4 (clk, clear_l, co[3], value[4], co[4]);
  rc_count c5 (clk, clear_l, co[4], value[5], co[5]);
  rc_count c6 (clk, clear_l, co[5], value[6], co[6]);
  rc_count c7 (clk, clear_l, co[6], value[7], co[7]);
  rc_count c7 (clk, clear_l, co[7], value[8], co[8]);
  rc_count c8 (clk, clear_l, co[8], value[9], cout);

endmodule
/*
module fsm_bist_behavioral (



);


endmodule
*/

// init (whenever BIST disabled)



module fsm_bist (
output shift, load, run, init,
input clk, bist_en, 






// do not use
module fsm_bist_1h (
output shift,
output load,
output run,
output init,
output done,
input clk, bist_en, done_shifting, no_more_tests
);

  
  dff d0 (shift, clk, shift_ns);
  dff d1 (load, clk, load_ns);
  dff d2 (run, clk, run_ns);
  dff d3 (init, clk, init_ns);
 
  // assign init_ns = ~bist_en | done
  // assign load_ns = bist_en & ((init | (shift & done_shifting & ~no_more_tests))
  // assign run_ns = bist_en & load;
  // assign shift_ns = bist_en & (run | (shift & ~done_shifting));
  // assign done = bist_en & shift & no_more_tests & done_shifting;


 
endmodule


`default_nettype none
module lfsr247 (
input clk, next, init,
output [246:0] value);

  // init stuff
  wire s0_l;// set to zero, asserted low
  not g0 (s0_l, init);

  // tap stuff
  wire tapping165;
  xor g1 (tapping165, value[0], value[165]);

  // dff stuff

  dff0 d000 (value[  0], clk, value[  1], s0_l);
  dff0 d001 (value[  1], clk, value[  2], s0_l);
  dff0 d002 (value[  2], clk, value[  3], s0_l);
  dff0 d003 (value[  3], clk, value[  4], s0_l);
  dff0 d004 (value[  4], clk, value[  5], s0_l);
  dff0 d005 (value[  5], clk, value[  6], s0_l);
  dff0 d006 (value[  6], clk, value[  7], s0_l);
  dff0 d007 (value[  7], clk, value[  8], s0_l);
  dff0 d008 (value[  8], clk, value[  9], s0_l);
  dff0 d009 (value[  9], clk, value[ 10], s0_l);
  
  dff0 d010 (value[ 10], clk, value[ 11], s0_l);
  dff0 d011 (value[ 11], clk, value[ 12], s0_l);
  dff0 d012 (value[ 12], clk, value[ 13], s0_l);
  dff0 d013 (value[ 13], clk, value[ 14], s0_l);
  dff0 d014 (value[ 14], clk, value[ 15], s0_l);
  dff0 d015 (value[ 15], clk, value[ 16], s0_l);
  dff0 d016 (value[ 16], clk, value[ 17], s0_l);
  dff0 d017 (value[ 17], clk, value[ 18], s0_l);
  dff0 d018 (value[ 18], clk, value[ 19], s0_l);
  dff0 d019 (value[ 19], clk, value[ 20], s0_l);
  
  dff0 d020 (value[ 20], clk, value[ 21], s0_l);
  dff0 d021 (value[ 21], clk, value[ 22], s0_l);
  dff0 d022 (value[ 22], clk, value[ 23], s0_l);
  dff0 d023 (value[ 23], clk, value[ 24], s0_l);
  dff0 d024 (value[ 24], clk, value[ 25], s0_l);
  dff0 d025 (value[ 25], clk, value[ 26], s0_l);
  dff0 d026 (value[ 26], clk, value[ 27], s0_l);
  dff0 d027 (value[ 27], clk, value[ 28], s0_l);
  dff0 d028 (value[ 28], clk, value[ 29], s0_l);
  dff0 d029 (value[ 29], clk, value[ 30], s0_l);
  
  dff0 d030 (value[ 30], clk, value[ 31], s0_l);
  dff0 d031 (value[ 31], clk, value[ 32], s0_l);
  dff0 d032 (value[ 32], clk, value[ 33], s0_l);
  dff0 d033 (value[ 33], clk, value[ 34], s0_l);
  dff0 d034 (value[ 34], clk, value[ 35], s0_l);
  dff0 d035 (value[ 35], clk, value[ 36], s0_l);
  dff0 d036 (value[ 36], clk, value[ 37], s0_l);
  dff0 d037 (value[ 37], clk, value[ 38], s0_l);
  dff0 d038 (value[ 38], clk, value[ 39], s0_l);
  dff0 d039 (value[ 39], clk, value[ 40], s0_l);
  
  dff0 d040 (value[ 40], clk, value[ 41], s0_l);
  dff0 d041 (value[ 41], clk, value[ 42], s0_l);
  dff0 d042 (value[ 42], clk, value[ 43], s0_l);
  dff0 d043 (value[ 43], clk, value[ 44], s0_l);
  dff0 d044 (value[ 44], clk, value[ 45], s0_l);
  dff0 d045 (value[ 45], clk, value[ 46], s0_l);
  dff0 d046 (value[ 46], clk, value[ 47], s0_l);
  dff0 d047 (value[ 47], clk, value[ 48], s0_l);
  dff0 d048 (value[ 48], clk, value[ 49], s0_l);
  dff0 d049 (value[ 49], clk, value[ 50], s0_l);
  
  dff0 d050 (value[ 50], clk, value[ 51], s0_l);
  dff0 d051 (value[ 51], clk, value[ 52], s0_l);
  dff0 d052 (value[ 52], clk, value[ 53], s0_l);
  dff0 d053 (value[ 53], clk, value[ 54], s0_l);
  dff0 d054 (value[ 54], clk, value[ 55], s0_l);
  dff0 d055 (value[ 55], clk, value[ 56], s0_l);
  dff0 d056 (value[ 56], clk, value[ 57], s0_l);
  dff0 d057 (value[ 57], clk, value[ 58], s0_l);
  dff0 d058 (value[ 58], clk, value[ 59], s0_l);
  dff0 d059 (value[ 59], clk, value[ 60], s0_l);
  
  dff0 d060 (value[ 60], clk, value[ 61], s0_l);
  dff0 d061 (value[ 61], clk, value[ 62], s0_l);
  dff0 d062 (value[ 62], clk, value[ 63], s0_l);
  dff0 d063 (value[ 63], clk, value[ 64], s0_l);
  dff0 d064 (value[ 64], clk, value[ 65], s0_l);
  dff0 d065 (value[ 65], clk, value[ 66], s0_l);
  dff0 d066 (value[ 66], clk, value[ 67], s0_l);
  dff0 d067 (value[ 67], clk, value[ 68], s0_l);
  dff0 d068 (value[ 68], clk, value[ 69], s0_l);
  dff0 d069 (value[ 69], clk, value[ 70], s0_l);
  
  dff0 d070 (value[ 70], clk, value[ 71], s0_l);
  dff0 d071 (value[ 71], clk, value[ 72], s0_l);
  dff0 d072 (value[ 72], clk, value[ 73], s0_l);
  dff0 d073 (value[ 73], clk, value[ 74], s0_l);
  dff0 d074 (value[ 74], clk, value[ 75], s0_l);
  dff0 d075 (value[ 75], clk, value[ 76], s0_l);
  dff0 d076 (value[ 76], clk, value[ 77], s0_l);
  dff0 d077 (value[ 77], clk, value[ 78], s0_l);
  dff0 d078 (value[ 78], clk, value[ 79], s0_l);
  dff0 d079 (value[ 79], clk, value[ 80], s0_l);

  dff0 d080 (value[ 80], clk, value[ 81], s0_l);
  dff0 d081 (value[ 81], clk, value[ 82], s0_l);
  dff0 d082 (value[ 82], clk, value[ 83], s0_l);
  dff0 d083 (value[ 83], clk, value[ 84], s0_l);
  dff0 d084 (value[ 84], clk, value[ 85], s0_l);
  dff0 d085 (value[ 85], clk, value[ 86], s0_l);
  dff0 d086 (value[ 86], clk, value[ 87], s0_l);
  dff0 d087 (value[ 87], clk, value[ 88], s0_l);
  dff0 d088 (value[ 88], clk, value[ 89], s0_l);
  dff0 d089 (value[ 89], clk, value[ 90], s0_l);
   
  dff0 d090 (value[ 90], clk, value[ 91], s0_l);
  dff0 d091 (value[ 91], clk, value[ 92], s0_l);
  dff0 d092 (value[ 92], clk, value[ 93], s0_l);
  dff0 d093 (value[ 93], clk, value[ 94], s0_l);
  dff0 d094 (value[ 94], clk, value[ 95], s0_l);
  dff0 d095 (value[ 95], clk, value[ 96], s0_l);
  dff0 d096 (value[ 96], clk, value[ 97], s0_l);
  dff0 d097 (value[ 97], clk, value[ 98], s0_l);
  dff0 d098 (value[ 98], clk, value[ 99], s0_l);
  dff0 d099 (value[ 99], clk, value[100], s0_l);
   
 
  dff0 d100 (value[100], clk, value[101], s0_l);
  dff0 d101 (value[101], clk, value[102], s0_l);
  dff0 d102 (value[102], clk, value[103], s0_l);
  dff0 d103 (value[103], clk, value[104], s0_l);
  dff0 d104 (value[104], clk, value[105], s0_l);
  dff0 d105 (value[105], clk, value[106], s0_l);
  dff0 d106 (value[106], clk, value[107], s0_l);
  dff0 d107 (value[107], clk, value[108], s0_l);
  dff0 d108 (value[108], clk, value[109], s0_l);
  dff0 d109 (value[109], clk, value[110], s0_l);
  
  dff0 d110 (value[110], clk, value[111], s0_l);
  dff0 d111 (value[111], clk, value[112], s0_l);
  dff0 d112 (value[112], clk, value[113], s0_l);
  dff0 d113 (value[113], clk, value[114], s0_l);
  dff0 d114 (value[114], clk, value[115], s0_l);
  dff0 d115 (value[115], clk, value[116], s0_l);
  dff0 d116 (value[116], clk, value[117], s0_l);
  dff0 d117 (value[117], clk, value[118], s0_l);
  dff0 d118 (value[118], clk, value[119], s0_l);
  dff0 d119 (value[119], clk, value[120], s0_l);
  
  dff0 d120 (value[120], clk, value[121], s0_l);
  dff0 d121 (value[121], clk, value[122], s0_l);
  dff0 d122 (value[122], clk, value[123], s0_l);
  dff0 d123 (value[123], clk, value[124], s0_l);
  dff0 d124 (value[124], clk, value[125], s0_l);
  dff0 d125 (value[125], clk, value[126], s0_l);
  dff0 d126 (value[126], clk, value[127], s0_l);
  dff0 d127 (value[127], clk, value[128], s0_l);
  dff0 d128 (value[128], clk, value[129], s0_l);
  dff0 d129 (value[129], clk, value[130], s0_l);
  
  dff0 d130 (value[130], clk, value[131], s0_l);
  dff0 d131 (value[131], clk, value[132], s0_l);
  dff0 d132 (value[132], clk, value[133], s0_l);
  dff0 d133 (value[133], clk, value[134], s0_l);
  dff0 d134 (value[134], clk, value[135], s0_l);
  dff0 d135 (value[135], clk, value[136], s0_l);
  dff0 d136 (value[136], clk, value[137], s0_l);
  dff0 d137 (value[137], clk, value[138], s0_l);
  dff0 d138 (value[138], clk, value[139], s0_l);
  dff0 d139 (value[139], clk, value[140], s0_l);
  
  dff0 d140 (value[140], clk, value[141], s0_l);
  dff0 d141 (value[141], clk, value[142], s0_l);
  dff0 d142 (value[142], clk, value[143], s0_l);
  dff0 d143 (value[143], clk, value[144], s0_l);
  dff0 d144 (value[144], clk, value[145], s0_l);
  dff0 d145 (value[145], clk, value[146], s0_l);
  dff0 d146 (value[146], clk, value[147], s0_l);
  dff0 d147 (value[147], clk, value[148], s0_l);
  dff0 d148 (value[148], clk, value[149], s0_l);
  dff0 d149 (value[149], clk, value[150], s0_l);
  
  dff0 d150 (value[150], clk, value[151], s0_l);
  dff0 d151 (value[151], clk, value[152], s0_l);
  dff0 d152 (value[152], clk, value[153], s0_l);
  dff0 d153 (value[153], clk, value[154], s0_l);
  dff0 d154 (value[154], clk, value[155], s0_l);
  dff0 d155 (value[155], clk, value[156], s0_l);
  dff0 d156 (value[156], clk, value[157], s0_l);
  dff0 d157 (value[157], clk, value[158], s0_l);
  dff0 d158 (value[158], clk, value[159], s0_l);
  dff0 d159 (value[159], clk, value[160], s0_l);
  
  dff0 d160 (value[160], clk, value[161], s0_l);
  dff0 d161 (value[161], clk, value[162], s0_l);
  dff0 d162 (value[162], clk, value[163], s0_l);
  dff0 d163 (value[163], clk, value[164], s0_l);
  dff0 d164 (value[164], clk, tapping165, s0_l); // tap 165
  dff0 d165 (value[165], clk, value[166], s0_l);
  dff0 d166 (value[166], clk, value[167], s0_l);
  dff0 d167 (value[167], clk, value[168], s0_l);
  dff0 d168 (value[168], clk, value[169], s0_l);
  dff0 d169 (value[169], clk, value[170], s0_l);
  
  dff0 d170 (value[170], clk, value[171], s0_l);
  dff0 d171 (value[171], clk, value[172], s0_l);
  dff0 d172 (value[172], clk, value[173], s0_l);
  dff0 d173 (value[173], clk, value[174], s0_l);
  dff0 d174 (value[174], clk, value[175], s0_l);
  dff0 d175 (value[175], clk, value[176], s0_l);
  dff0 d176 (value[176], clk, value[177], s0_l);
  dff0 d177 (value[177], clk, value[178], s0_l);
  dff0 d178 (value[178], clk, value[179], s0_l);
  dff0 d179 (value[179], clk, value[180], s0_l);

  dff0 d180 (value[180], clk, value[181], s0_l);
  dff0 d181 (value[181], clk, value[182], s0_l);
  dff0 d182 (value[182], clk, value[183], s0_l);
  dff0 d183 (value[183], clk, value[184], s0_l);
  dff0 d184 (value[184], clk, value[185], s0_l);
  dff0 d185 (value[185], clk, value[186], s0_l);
  dff0 d186 (value[186], clk, value[187], s0_l);
  dff0 d187 (value[187], clk, value[188], s0_l);
  dff0 d188 (value[188], clk, value[189], s0_l);
  dff0 d189 (value[189], clk, value[190], s0_l);
   
  dff0 d190 (value[190], clk, value[191], s0_l);
  dff0 d191 (value[191], clk, value[192], s0_l);
  dff0 d192 (value[192], clk, value[193], s0_l);
  dff0 d193 (value[193], clk, value[194], s0_l);
  dff0 d194 (value[194], clk, value[195], s0_l);
  dff0 d195 (value[195], clk, value[196], s0_l);
  dff0 d196 (value[196], clk, value[197], s0_l);
  dff0 d197 (value[197], clk, value[198], s0_l);
  dff0 d198 (value[198], clk, value[199], s0_l);
  dff0 d199 (value[199], clk, value[200], s0_l);
   
   
  dff0 d200 (value[200], clk, value[201], s0_l);
  dff0 d201 (value[201], clk, value[202], s0_l);
  dff0 d202 (value[202], clk, value[203], s0_l);
  dff0 d203 (value[203], clk, value[204], s0_l);
  dff0 d204 (value[204], clk, value[205], s0_l);
  dff0 d205 (value[205], clk, value[206], s0_l);
  dff0 d206 (value[206], clk, value[207], s0_l);
  dff0 d207 (value[207], clk, value[208], s0_l);
  dff0 d208 (value[208], clk, value[209], s0_l);
  dff0 d209 (value[209], clk, value[210], s0_l);
  
  dff0 d210 (value[210], clk, value[211], s0_l);
  dff0 d211 (value[211], clk, value[212], s0_l);
  dff0 d212 (value[212], clk, value[213], s0_l);
  dff0 d213 (value[213], clk, value[214], s0_l);
  dff0 d214 (value[214], clk, value[215], s0_l);
  dff0 d215 (value[215], clk, value[216], s0_l);
  dff0 d216 (value[216], clk, value[217], s0_l);
  dff0 d217 (value[217], clk, value[218], s0_l);
  dff0 d218 (value[218], clk, value[219], s0_l);
  dff0 d219 (value[219], clk, value[220], s0_l);
  
  dff0 d220 (value[220], clk, value[221], s0_l);
  dff0 d221 (value[221], clk, value[222], s0_l);
  dff0 d222 (value[222], clk, value[223], s0_l);
  dff0 d223 (value[223], clk, value[224], s0_l);
  dff0 d224 (value[224], clk, value[225], s0_l);
  dff0 d225 (value[225], clk, value[226], s0_l);
  dff0 d226 (value[226], clk, value[227], s0_l);
  dff0 d227 (value[227], clk, value[228], s0_l);
  dff0 d228 (value[228], clk, value[229], s0_l);
  dff0 d229 (value[229], clk, value[230], s0_l);
  
  dff0 d230 (value[230], clk, value[231], s0_l);
  dff0 d231 (value[231], clk, value[232], s0_l);
  dff0 d232 (value[232], clk, value[233], s0_l);
  dff0 d233 (value[233], clk, value[234], s0_l);
  dff0 d234 (value[234], clk, value[235], s0_l);
  dff0 d235 (value[235], clk, value[236], s0_l);
  dff0 d236 (value[236], clk, value[237], s0_l);
  dff0 d237 (value[237], clk, value[238], s0_l);
  dff0 d238 (value[238], clk, value[239], s0_l);
  dff0 d239 (value[239], clk, value[240], s0_l);
  
  dff0 d240 (value[240], clk, value[241], s0_l);
  dff0 d241 (value[241], clk, value[242], s0_l);
  dff0 d242 (value[242], clk, value[243], s0_l);
  dff0 d243 (value[243], clk, value[244], s0_l);
  dff0 d244 (value[244], clk, value[245], s0_l);
  dff0 d245 (value[245], clk, value[246], s0_l);
  dff1 d246 (value[246], clk, value[  0], init); // tap 247 (tapping 0)
 
   
endmodule
`default_nettype wire
// cost 1.2
module dff0 (output q, input clock, data, set0_l);
  
  wire d;

  and (d, data, set0_l);
  dff f (q, clock, d);

endmodule

// cost 1.2
module dff1 (output q, input clock, data, set1);
  
  wire d;

  or (d, data, set1);
  dff f (q, clock, d);

endmodule



module xor250(
  input [249:0] x,
  output y
);

xor(
  y,

  x[  0],
  x[  1],
  x[  2],
  x[  3],
  x[  4],
  x[  5],
  x[  6],
  x[  7],
  x[  8],
  x[  9],

  x[ 10],
  x[ 11],
  x[ 12],
  x[ 13],
  x[ 14],
  x[ 15],
  x[ 16],
  x[ 17],
  x[ 18],
  x[ 19],

  x[ 20],
  x[ 21],
  x[ 22],
  x[ 23],
  x[ 24],
  x[ 25],
  x[ 26],
  x[ 27],
  x[ 28],
  x[ 29],

  x[ 30],
  x[ 31],
  x[ 32],
  x[ 33],
  x[ 34],
  x[ 35],
  x[ 36],
  x[ 37],
  x[ 38],
  x[ 39],

  x[ 40],
  x[ 41],
  x[ 42],
  x[ 43],
  x[ 44],
  x[ 45],
  x[ 46],
  x[ 47],
  x[ 48],
  x[ 49],

  x[ 50],
  x[ 51],
  x[ 52],
  x[ 53],
  x[ 54],
  x[ 55],
  x[ 56],
  x[ 57],
  x[ 58],
  x[ 59],

  x[ 60],
  x[ 61],
  x[ 62],
  x[ 63],
  x[ 64],
  x[ 65],
  x[ 66],
  x[ 67],
  x[ 68],
  x[ 69],

  x[ 70],
  x[ 71],
  x[ 72],
  x[ 73],
  x[ 74],
  x[ 75],
  x[ 76],
  x[ 77],
  x[ 78],
  x[ 79],

  x[ 80],
  x[ 81],
  x[ 82],
  x[ 83],
  x[ 84],
  x[ 85],
  x[ 86],
  x[ 87],
  x[ 88],
  x[ 89],

  x[ 90],
  x[ 91],
  x[ 92],
  x[ 93],
  x[ 94],
  x[ 95],
  x[ 96],
  x[ 97],
  x[ 98],
  x[ 99],


  x[100],
  x[101],
  x[102],
  x[103],
  x[104],
  x[105],
  x[106],
  x[107],
  x[108],
  x[109],

  x[110],
  x[111],
  x[112],
  x[113],
  x[114],
  x[115],
  x[116],
  x[117],
  x[118],
  x[119],

  x[120],
  x[121],
  x[122],
  x[123],
  x[124],
  x[125],
  x[126],
  x[127],
  x[128],
  x[129],

  x[130],
  x[131],
  x[132],
  x[133],
  x[134],
  x[135],
  x[136],
  x[137],
  x[138],
  x[139],

  x[140],
  x[141],
  x[142],
  x[143],
  x[144],
  x[145],
  x[146],
  x[147],
  x[148],
  x[149],

  x[150],
  x[151],
  x[152],
  x[153],
  x[154],
  x[155],
  x[156],
  x[157],
  x[158],
  x[159],

  x[160],
  x[161],
  x[162],
  x[163],
  x[164],
  x[165],
  x[166],
  x[167],
  x[168],
  x[169],

  x[170],
  x[171],
  x[172],
  x[173],
  x[174],
  x[175],
  x[176],
  x[177],
  x[178],
  x[179],

  x[180],
  x[181],
  x[182],
  x[183],
  x[184],
  x[185],
  x[186],
  x[187],
  x[188],
  x[189],

  x[190],
  x[191],
  x[192],
  x[193],
  x[194],
  x[195],
  x[196],
  x[197],
  x[198],
  x[199],

  x[200],
  x[201],
  x[202],
  x[203],
  x[204],
  x[205],
  x[206],
  x[207],
  x[208],
  x[209],

  x[210],
  x[211],
  x[212],
  x[213],
  x[214],
  x[215],
  x[216],
  x[217],
  x[218],
  x[219],

  x[220],
  x[221],
  x[222],
  x[223],
  x[224],
  x[225],
  x[226],
  x[227],
  x[228],
  x[229],

  x[230],
  x[231],
  x[232],
  x[233],
  x[234],
  x[235],
  x[236],
  x[237],
  x[238],
  x[239],

  x[240],
  x[241],
  x[242],
  x[243],
  x[244],
  x[245],
  x[246]
); // if it yells about fanin, have fun!
// I know n-input xor gates are okay, but n is pretty high here so you
// can just tone them down a bit if there's a problem, but you shouldn't need
// to go down to 2 inputs each.
endmodule
