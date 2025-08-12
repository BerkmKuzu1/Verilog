module (

);

reg clk;
reg rst_n;
reg signal_i;
wire detect_o;

localparam c_clk_period = 20;

rise_edge_detector_moore DUT
(
.clk        (clk)
.rst_n      (rst_n),
.signal_i   (signal_i),
.detect_o   (detect_o)
);

always begin
    #10 clk = !clk;
end

initial begin
    clk = 1'b0;
    signal_i = 1'b0;
    rst_n = 1'b0;
    #40;
    rst_n = 1'b1;
    #60;
    signal_i = 1'b0;
    #40;
    signal_i = 1'b1;
    #80;
    signal_i = 1'b0;
    #40;
    $finish;
end

endmodule