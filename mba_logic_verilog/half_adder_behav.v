/*module moduleName (
input       a_i,
input       b_i,
output  reg s_o,
output  reg c_o
);

always @(a_i, b_i) begin
    {c_o, s_o} = a_i + b_i;
end
    
endmodule

            Methode 1

*/ 


//Methode 2
module half_adder_behav (
input       a_i,
input       b_i,
output  reg s_o,
output  reg c_o
);

reg s, cout;

always @(a_i, b_i) begin
    {cout, s} = a_i + b_i;
end

assign c_o  = cout;
assign s_o  = s;  
    
endmodule
