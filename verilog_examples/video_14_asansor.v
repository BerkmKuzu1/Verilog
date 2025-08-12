`timescale 1ns / 1ps
module video_14_asansor(
input   sw_i,
input   clk,
input   rst_n,
output  led_red,
output  led_green
);

localparam floor_0 = 1'b0;
localparam floor_1 = 1'b1;

reg floor;
reg red, green;

always @(posedge clk, negedge rst_n) begin
    if(rst_n == 1'b0) begin
        floor <= floor_0;
    end
    else begin
        case (floor)
            floor_0: begin
                if (sw_i == 1'b0) begin
                    floor <= floor_0;
                end
                else begin
                    floor <= floor_1;
                end
            end
            floor_1: begin
                if (sw_i == 1'b0) begin
                    floor <= floor_0;
                end
                else begin
                    floor <= floor_1;
                end
            end 
            default: begin
                floor <= floor_0;
            end 
        endcase
    end
end

always @(*) begin
    if (floor == floor_0) begin
        red = 1'b1;
        green = 1'b0;
    end
    else begin
        red = 1'b0;
        green = 1'b1;
    end
end

assign led_red = red;
assign led_green = green;
    
endmodule