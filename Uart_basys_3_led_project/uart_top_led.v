`timescale 1ns / 1ps
module uart_top_led (
    input wire clk,        
    input wire rst,        
    input wire rx_pin,     
    output wire tx_pin,    
    output wire [7:0] led  
);

    wire [7:0] rx_data;
    wire rx_done_rx;
    wire tx_done_tx;
    
    reg [7:0] tx_data_reg;
    reg tx_start_reg;

    localparam BUFFER_SIZE = 16;
    reg [7:0] command_buffer [0:BUFFER_SIZE-1];
    reg [3:0] char_count;
    reg command_ready;
    
    reg [7:0] led_reg;
    
    integer i;

    reg [1:0] state;
    localparam WAIT_FOR_COMMAND = 2'b00;
    localparam PROCESS_COMMAND = 2'b01;
    localparam SEND_RESPONSE = 2'b10;

    uart_rx_led rx_module (
        .clk(clk),
        .rst(rst),
        .rx_pin(rx_pin),
        .data_out(rx_data),
        .rx_done(rx_done_rx)
    );

    uart_tx_led tx_module (
        .clk(clk),
        .rst(rst),
        .tx_start(tx_start_reg),
        .data_in(tx_data_reg),
        .tx_pin(tx_pin),
        .tx_done(tx_done_tx)
    );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= WAIT_FOR_COMMAND;
            char_count <= 0;
            command_ready <= 1'b0;
            led_reg <= 8'h00;
            tx_start_reg <= 1'b0;
            for (i=0; i < BUFFER_SIZE; i=i+1) begin
                command_buffer[i] <= 8'h00;
            end
        end else begin
            case (state)
                WAIT_FOR_COMMAND: begin
                    if (rx_done_rx) begin
                        if (rx_data == 8'd13) begin 
                            command_ready <= 1'b1;
                            state <= PROCESS_COMMAND;
                        end else if (char_count < BUFFER_SIZE) begin
                            command_buffer[char_count] <= rx_data;
                            char_count <= char_count + 1;
                            tx_data_reg <= rx_data;
                            tx_start_reg <= 1'b1;
                        end
                    end else begin
                        tx_start_reg <= 1'b0;
                    end
                end
                
                PROCESS_COMMAND: begin
                    if (command_buffer[0] == 8'h31) begin 
                        led_reg <= 8'hff; 
                    end else if (command_buffer[0] == 8'h30) begin 
                        led_reg <= 8'h00; 
                    end else if (command_buffer[0] == 8'h54 && char_count > 1) begin et
                        if (command_buffer[1] >= 8'h30 && command_buffer[1] <= 8'h37) begin
                            led_reg <= led_reg ^ (8'd1 << (command_buffer[1] - 8'h30));
                        end
                    end

                    command_ready <= 1'b0;
                    char_count <= 0;
                    for (i=0; i < BUFFER_SIZE; i=i+1) begin
                        command_buffer[i] <= 8'h00;
                    end
                    state <= WAIT_FOR_COMMAND;
                end
            endcase
        end
    end
    
    assign led = led_reg;

endmodule 
