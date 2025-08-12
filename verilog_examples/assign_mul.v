module assign_mul (
input   i0_i,
input   i1_i,
input   sel_i,
output  out_o    
);

assign  out_o = (sel_i == 1'b0) ? i0_i : i1_i;
    
endmodule