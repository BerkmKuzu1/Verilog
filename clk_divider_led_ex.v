module clk_divider_led_ex (
    input clk,            //100 MHz
    input rst,            
    output reg led_out    
);

    parameter LED_OFF = 1'b0;
    parameter LED_ON  = 1'b1;

    reg current_state;
    reg [26:0] counter;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 27'd0;
            current_state <= LED_OFF;
            led_out <= 1'b0;
        end else begin
            counter <= counter + 1;

            if (counter == 27'd99999999) begin
                counter <= 27'd0;
                case (current_state)
                    LED_OFF: begin
                        current_state <= LED_ON;
                        led_out <= 1'b1;
                    end
                    LED_ON: begin
                        current_state <= LED_OFF;
                        led_out <= 1'b0;
                    end
                endcase
            end
        end
    end

endmodule
