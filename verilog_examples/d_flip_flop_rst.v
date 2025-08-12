module d_flip_flop_rst (
input   d_i,
input   clk,
input   rst_n, //ACTIVE -LOW RESET: 0 resetle 1 anında resetleme (genelde active-low kullanılıyormuş)
output  q_o
);

reg q; //q burda uninitialized 

always @(posedge clk) begin //posedge clock burda yükselen kenar
    if (rst_n == 1'b0) begin
        q <= 1'b0;
    end
    else begin
        q <= d_i;
    end
end

assign q_o  = q;
    
endmodule

//Bir sayısal tasarımda en önemli sinyal clk'dur. Clocktan sonra resetdir.