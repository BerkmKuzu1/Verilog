module rise_edge_detector_moore (
input   clk,
input   rst_n,
input   signal_i,
output  detect_o
);

localparam trigger_w = 2'b00;
localparam trigger_r = 2'b01;
localparam wait_     = 2'b10;

reg [1:0] state;
reg detect;

always @(posedge clk, negedge rst_n) begin
    if(rst_n == 1'b0) begin
        state <= trigger_w;
    end
    case (state)
        trigger_w: begin
            if (signal_i == 1'b0) begin
                state <= trigger_w;
            end
            else begin
                state <= trigger_r;
            end
        end
        trigger_r: begin
            state <= wait_;
        end
        wait_: begin
            if (signal_i == 1'b0) begin
                state <= trigger_w;
            end
            else begin
                state <= trigger_r;
            end
        end 
        default: begin
            state <= trigger_w;
        end
    endcase
end

always @(*) begin
    case (state)
        trigger_w: begin
            detect = 1'b0;
        end
        trigger_r: begin
            detect = 1'b1;
        end
        wait_: begin
            detect = 1'b0;
        end 
        default: begin
            detect = 1'b0;
        end
    endcase
end

assign detect_o = detect;

endmodule