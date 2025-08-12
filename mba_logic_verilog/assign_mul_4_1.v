module assign_mul_4_1(
input   d0_i,
input   d1_i,
input   d2_i,
input   d3_i,
input   sel0_i,
input   sel1_i,
output  out_o
);

assign  =   (out_o  == 1'b0) ? 
            (sel1_i == 1'b0) ? d0_i : d2_i :
            (sel1_i == 1'b1) ? d1_i : d4_i;

endmodule