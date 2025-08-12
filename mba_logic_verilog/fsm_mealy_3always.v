module moduleName (
input   x_i,
input   rst_n,
input   clk,
output  y_o
);

reg y;
reg A_reg, B_reg, A_next, B_next;

// always block #1 for assignment D to Q
always @(negedge rst_n, posedge clk) begin
    if (rst_n == 1b'0) begin
        A_reg = 1'b0;
        B_reg = 1'b0;
    end
    else begin
        A_reg = A_next;
        B_reg = B_next;
    end
end

// always block #2 for evaluating next state
always @(*) begin
    A_next = (A_reg & x_i) | (B_reg & x_i);
    B_next = (!A_reg & x_i);
end

// always block #3 for evaluating output
always @(*) begin
    y = (A_reg | B_reg) & !x_i;
end

assign y_o = y;

endmodule