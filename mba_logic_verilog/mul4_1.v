module mul4_1 (
input   d0_i,
input   d1_i,
input   d2_i,
input   d3_i,
input   sel0_i,
input   sel1_i,
output  out_o
);

wire mux_1_o, mux_2_o;

mux_2_1 MUX1(
.i0_i   (d0_i);
.i1_i   (d1_i); 
.sel_i  (sel0_i);
.out_o  (mux_1_o);
);

mux_2_1 MUX1(
.i0_i   (d2_i);
.i1_i   (d3_i); 
.sel_i  (sel0_i);
.out_o  (mux_2_o);
);

mux_2_1 MUX1(
.i0_i   (mux_1_o);
.i1_i   (mux_2_o); 
.sel_i  (sel1_i);
.out_o  (out_o);
);

endmodule