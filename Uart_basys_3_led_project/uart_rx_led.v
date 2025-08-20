`timescale 1ns / 1ps
module uart_rx_led (
    input wire clk,
    input wire rst,
    input wire rx_pin,
    output reg [7:0] data_out,
    output reg rx_done
);

    // 100MHz - 9600 baud
    localparam CLKS_PER_BIT = 10417;
    
    localparam [2:0] IDLE  = 3'b000;
    localparam [2:0] START = 3'b001;
    localparam [2:0] DATA  = 3'b010;
    localparam [2:0] STOP  = 3'b011;
    localparam [2:0] SYNC_DATA = 3'b100;

    reg [2:0] state;
    reg [13:0] clk_counter;
    reg [3:0]  bit_counter;
    reg [7:0] data_buffer;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            clk_counter <= 0;
            bit_counter <= 0;
            data_out <= 8'b0;
            rx_done <= 1'b0;
            data_buffer <= 8'b0;
        end else begin
            rx_done <= 1'b0;

            case (state)
                IDLE: begin
                    if (rx_pin == 1'b0) begin
                        clk_counter <= 0;
                        state <= START;
                    end
                end
                
                START: begin
                    clk_counter <= clk_counter + 1;
                    if (clk_counter == (CLKS_PER_BIT / 2) - 1) begin
                        state <= DATA;
                        clk_counter <= 0;
                        bit_counter <= 0;
                        data_buffer <= 8'b0;
                    end
                end

                DATA: begin
                    clk_counter <= clk_counter + 1;
                    if (clk_counter == CLKS_PER_BIT - 1) begin
                        data_buffer[bit_counter] <= rx_pin;
                        bit_counter <= bit_counter + 1;
                        clk_counter <= 0;
                        if (bit_counter == 7) begin
                            state <= STOP;
                        end
                    end
                end
                
                STOP: begin
                    clk_counter <= clk_counter + 1;
                    if (clk_counter == CLKS_PER_BIT - 1) begin
                        state <= IDLE;
                        rx_done <= 1'b1; 
                        data_out <= data_buffer;
                    end
                end
            endcase
        end
    end
endmodule
