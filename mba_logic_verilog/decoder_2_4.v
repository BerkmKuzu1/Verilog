module decoder_2_4 (
input   [1:0] a_i,
output  [3:0] d_o 
);

reg [3:0] d;

always @(a_i) begin
    case (a_i)
        2'b00   : d = 4'b0001;
        2'b01   : d = 4'b0010;
        2'b01   : d = 4'b0100;
        default : d = 4'b1000;
    endcase
end

assign d_o  = d;
    
endmodule