module reg_parameter 
#(
parameter N=32
)
(
input   [N-1:0] d_i,
input   clk, //active-low reset
input   rst_n, //reset
output  [N-1:0] q_o
);

reg [N-1:0] q; //q burda uninitialized

always @(posedge clk, negedge rst_n) begin 
    if (rst_n == 1'b0) begin 
        q <= {N(1'b0)};
    end
    else begin
        q <= d_i;
    end
end

assign q_o  = q;
    
endmodule