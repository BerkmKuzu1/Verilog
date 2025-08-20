`timescale 1ns / 1ps
module uart_tx_led (
    input wire clk,
    input wire rst,
    input wire tx_start,
    input wire [7:0] data_in,
    output wire tx_pin,
    output wire tx_done
);

    // 100MHz - 9600 baud
    localparam CLKS_PER_BIT = 10417;

    //states
    localparam [2:0] IDLE  = 3'b000;
    localparam [2:0] START = 3'b001;
    localparam [2:0] DATA  = 3'b010;
    localparam [2:0] STOP  = 3'b011;

    reg [2:0] state, next_state;
    reg [13:0] clk_counter;
    reg [3:0]  bit_counter;
    reg [7:0]  data_to_send;
    reg        tx_done_reg;
    reg        tx_pin_reg;

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: begin
                if (tx_start) next_state = START;
            end
            START: begin
                if (clk_counter == CLKS_PER_BIT - 1) next_state = DATA;
            end
            DATA: begin
                if (clk_counter == CLKS_PER_BIT - 1 && bit_counter == 7) next_state = STOP;
            end
            STOP: begin
                if (clk_counter == CLKS_PER_BIT - 1) next_state = IDLE;
            end
        endcase
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            clk_counter <= 0;
            bit_counter <= 0;
            data_to_send <= 8'b0;
            tx_done_reg <= 1'b0;
            tx_pin_reg <= 1'b1;
        end else begin
            state <= next_state;
            tx_done_reg <= 1'b0;
            case (next_state)
                IDLE: begin
                    if (tx_start) begin
                        data_to_send <= data_in;
                        clk_counter <= 0;
                        bit_counter <= 0;
                    end
                end
                START: begin
                    clk_counter <= clk_counter + 1;
                    tx_pin_reg <= 1'b0;
                end
                DATA: begin
                    if (clk_counter == CLKS_PER_BIT - 1) begin
                        bit_counter <= bit_counter + 1;
                        clk_counter <= 0;
                    end else begin
                        clk_counter <= clk_counter + 1;
                    end
                    tx_pin_reg <= data_to_send[bit_counter];
                end
                STOP: begin
                    clk_counter <= clk_counter + 1;
                    tx_pin_reg <= 1'b1;
                    if (clk_counter == CLKS_PER_BIT - 1) begin
                        tx_done_reg <= 1'b1;
                    end
                end
            endcase
        end
    end

    assign tx_pin = tx_pin_reg;
    assign tx_done = tx_done_reg;
endmodule
