module add_sub_8bit_sync (
input   [7:0] a_i,
input   [7:0] b_i,
input   clk,
input   rst_n,
input   op_i,
output  [7:0] result_o 
);

reg [7:0] result;

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        result <= 8'b00000000;
    end
    else begin
       if (op_i == 1'b0) begin
        result <= a_i + b_i;
       end
       else begin
        result <= a_i - b_i;
       end  
    end
end

assign result_o = result;
    
endmodule 