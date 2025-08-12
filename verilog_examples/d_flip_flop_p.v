module d_flip_flop_p (
input   d_i,
input   clk,
output  q_o
);

reg q; //q burda uninitialized

always @(posedge clk) begin //posedge clock burda yükselen kenar
    q   <= d_i;
end

assign q_o  = q;
    
endmodule

