module half_adder_assign (
input   a_i,
input   b_i,
output  s_o,
output  c_o
);

assign  s_o     = a_i ^ b_i;
assign  c_o     = a_i & b_i;
    
endmodule