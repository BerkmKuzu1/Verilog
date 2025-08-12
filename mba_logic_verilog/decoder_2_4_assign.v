module decoder_2_4_assign(
input [1:0] a_i,
output [3:0] d_o
);

assign  =   (a_i == 2'b00)  ?   4'b0001 :
            (a_i == 2'b01)  ?   4'b0010 :
            (a_i == 2'b10)  ?   4'b0100 :
                                4'b1000;
                                
endmodule