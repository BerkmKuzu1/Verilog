module rise_edge_detector ( //mealy
input   clk,
input   rst_n,
input   signal_i,
output  detect_o
);

localparam trigger_wait = 1'b0;
localparam trigger_recieved = 1'b1;

reg detect;
reg state;

always @(posedge clk, negedge rst_n) begin
    if (rst_n == 1'b0) begin
        state <= trigger_wait;
    end
    else begin
        case (state)
            trigger_wait: begin
                if (signal_i == 1'b0) begin
                    state <= trigger_wait;
                end
                else begin
                    state <= trigger_recieved;
                end
            end
            trigger_recieved: begin
                if (signal_i == 1'b0) begin
                    state <= trigger_wait;
                end
                else begin
                    state <= trigger_recieved;
                end
            end 
            default: begin
                state <= trigger_wait;
            end
        endcase
    end
end

always @(*) begin
    if (state == trigger_wait) begin
        if (signal_i == 1'b0) begin
            detect = 1'b0;
        end
        else begin
            detect = 1'b1;
        end
    end
    else begin
        detect = 1'b0;
    end
end

assign detect_o = detect;

endmodule