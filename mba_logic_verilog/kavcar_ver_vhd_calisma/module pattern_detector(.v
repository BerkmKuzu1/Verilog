module pattern_detector(
    input clk,
    input reset,
    input [15:0] data_in, // 16-bit input sequence
    output reg [13:0] match_indices // Stores the starting indices of "101" matches
);

    // Assuming the input sequence is 16 bits long as per the example.
    // The maximum number of possible "101" patterns is 14 (from index 0 to index 13).
    // So, a 14-bit register is sufficient to indicate matches.
    // Each bit in match_indices will correspond to a potential starting position.
    // For example, match_indices[0] means "101" found starting at index 0.

    // ************* HATA DÜZELTME BAŞLANGICI *************
    integer i; // 'int' yerine 'integer' kullanıyoruz ve döngünün dışında tanımlıyoruz.
               // Bu değişken 'always' bloğu içinde kullanılacak.
    // ************* HATA DÜZELTME SONU *************

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            match_indices <= 14'b0; // Reset all match indicators
        end else begin
            // Initialize match_indices for the current clock cycle (optional, could be combinatorial)
            match_indices <= 14'b0;

            // Loop through the input sequence to find "101" patterns
            // The pattern "101" is 3 bits long.
            // For a 16-bit sequence, the last possible starting index for "101" is 16 - 3 = 13.
            for (i = 0; i <= 13; i = i + 1) begin // 'int i = 0' yerine sadece 'i = 0'
                if (data_in[i+2] == 1'b1 && data_in[i+1] == 1'b0 && data_in[i] == 1'b1) begin
                    match_indices[i] <= 1'b1; // Set the bit if "101" is found starting at index i
                end
            end
        end
    end

endmodule