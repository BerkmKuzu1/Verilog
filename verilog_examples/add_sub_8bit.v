module moduleName (
input   [7:0] a_i,
input   [7:0] b_i,
input   op_i,
output  [7:0] result_o 
);

reg [7:0] result;

always @(a_i, b_i, op_i) begin
    if (op_i == 1'b0) begin
        result = a_i + b_i;
    end
    else begin
        result = a_i - b_i;
    end
end

assign result_o = result;
    
endmodule