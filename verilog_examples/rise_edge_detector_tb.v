module rise_edge_detector_tb (

);

reg clk;
reg rst_n;
reg signal_i;
wire detect_o;

localparam c_clk_period = 20;

rise_edge_detector DUT
(
.clk        (clk)
.rst_n      (rst_n),
.signal_i   (signal_i),
.detect_o   (detect_o)
);

always begin
    #(c_clk_period/2) clk = !clk;
end

initial begin
    clk = 1'b0;
    signal_i = 1'b0;
    rst_n = 1'b0;
    #40;
    rst_n = 1'b1;
    #20;
    signal_i = 1'b0;
    #20;
    signal_i = 1'b0;
    #20;
    signal_i = 1'b0;
    #20;
    signal_i = 1'b0;
    #20;
    $finish;
end

endmodule