module counter_up_down_load
(
parameter N = 8;
);
(
inout   clk, 
input   rst_n,
input   load_i,
input   en_i,
input   up_i,
input   [N-1:0] load_val_i,
output  [N-1:0] count_o
);

reg [N-1:0] count;

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        count <= {N{1'b0}};
    end
    else begin
        if (load_i == 1'b1) begin
            count <= load_val_i
        end
        else if (en_i == 1'b1) begin
            if (up_i == 1'b1) begin
                count <= count + 1;
            end
            else begin
                count <= count - 1;
            end
        end
        else begin
            count <= count;
        end
    end
end

assign count_o = count;

endmodule