module fsm_mealy_1always (
input   x_i,
input   rst_n,
input   clk,
output  y_o
);

reg A_reg, B_reg;

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        A_reg = 1'b0;
        B_reg = 1'b0;
    end 
    else begin
        A_reg = (A_reg & x_i) | (B_reg & x_i);
        B_reg = (!A_reg & x_i);;
    end
end

assign y_o = (A_reg | B_reg) & !x_i;;
    
endmodule