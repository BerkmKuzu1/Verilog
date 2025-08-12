module d_latch (
input   d_i,
input   clk,
output  q_o 
);

reg  q;

always @(d_i, clk) begin
    if (clk == 1'b1) begin
        q   <= d_i; // <= non-blocking assignment
    end
end
    
assign  q_o = q; //continuous assignment

endmodule