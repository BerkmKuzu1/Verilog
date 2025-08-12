module mux_2_1 (
input   i0_i,
input   i1_i,
input   sel_i,
output  out_o   
);

wire    sel_not, and_1, and_2;
not     G4(sel_not,sel_i);
and     G1(and_1,sel_not,i0_i);
and     G2(and_2,sel_i,i1_i);
or      G3(out_o,and_1,and_2);
    
endmodule