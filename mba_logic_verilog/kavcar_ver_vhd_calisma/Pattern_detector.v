module kavcar_ex (

input   data_i[15:0],
input   clk,
input   rst,
output  q[15:0]

);
    
integer i;
reg match[15:0];

always @(posedge clk) begin
    for (i = 0; i <= 15; i = i + 1) begin
        if(data_i[i] == 1'b1) begin
            match[i] = 1'b0;
            if (data_i[i+1] == 1'b0) begin
                match[i+1] = 1'b0;
                if (data_i[i+2] == 1'b1) begin
                    match[i+2] = 1'b1;
                end else begin
                    match[i+2] = 1'b0;
                end
            end else begin
                match[i+1] = 1'b0;
            end 
        end else begin
            match[i] = 1'b0;
        end
    end
end

assign q[15:0] = match[15:0] // check ettim ama seriden emin değilim

endmodule