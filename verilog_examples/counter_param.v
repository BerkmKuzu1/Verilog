module counter_param 
#(
parameter N = 8
) 
(
input   clk,
input   rst_n,
output  [N-1:0] count_o
);

reg [N-1:0] count;

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        count <= {N{1'b0}};
    end
    else begin
        count <= count + 1;
    end
end

assign count_o = count;
    
endmodule