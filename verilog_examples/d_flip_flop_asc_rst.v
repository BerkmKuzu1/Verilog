module d_flip_flop_asc_rst (
input   d_i,
input   clk, //active-low reset
input   rst_n, //reset
output  q_o
);

reg q; //q burda uninitialized

//always @(posedge clk) begin //synchronous reset burda reseti alması için edge lazım baboli
always @(posedge clk, negedge rst_n) begin //asynchronous reset kanka reseti aldımı direk sıfırlıyor risingedge falan hikaye yani
    if (rst_n == 1'b0) begin //hoca derse yanlış yazmış 0 olacak
        q <= 1'b0;
    end
    else begin
        q <= d_i;
    end
end

assign q_o  = q;
    
endmodule