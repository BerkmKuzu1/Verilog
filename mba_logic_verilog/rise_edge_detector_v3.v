module rise_edge_detector_v3 (
input   clk,
input   rst_n,
input   signal_i,
output  detect_o
);

reg dff_1, dff_2;
reg detect;

always @(posedge clk, negedge rst_n) begin
    if(rst_n == 1'b0) begin
        dff_1 <= 1'b0;
        dff_2 <= 1'b0;
    end
    else begin
        dff_1 <= signal_i;
        dff_2 <= dff_1;
    end
end

always @(*) begin
    detect = 1'b0;
    if(dff_1 == 1'b1 && dff_2 == 1'b0) begin
        detect = 1'b1;
    end
end

assign detect_o = detect;

endmodule