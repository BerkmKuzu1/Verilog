module d_flip_flop_n (
input   d_i,
input   clk,
output  q_o
);

reg q; //q burda uninitialized

always @(negedge clk) begin //negedge clock burda alçalan kenar
    q   <= d_i;
end

assign q_o  = q;
    
endmodule
