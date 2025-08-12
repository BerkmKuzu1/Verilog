module reg_8 (
input   [7:0] d_i,
input   clk, //active-low reset
input   rst_n, //reset
output  [7:0] q_o
);

reg [7:0] q; //q burda uninitialized

//always @(posedge clk) begin //synchronous reset burda reseti alması için edge lazım baboli
always @(posedge clk, negedge rst_n) begin //asynchronous reset kanka reseti aldımı direk sıfırlıyor risingedge falan hikaye yani
    if (rst_n == 1'b0) begin //hoca derse yanlış yazmış 0 olacak
        q <= 8'b00000000;
    end
    else begin
        q <= d_i;
    end
end

assign q_o  = q;
    
endmodule