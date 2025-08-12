module counter_2bit (
input   clk,
input   rst_n,
output  [1:0] count_o
);

reg [1:0] count;

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
       count <= 2'b00; 
    end
    else begin
        count <= count + 1;
    end
end

assign count_o = count;
    
endmodule