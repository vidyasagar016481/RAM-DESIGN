module ram_design (
    input clk,
    input we,
    input [3:0] addr,
    input [7:0] din,
    output reg [7:0] dout
);

    reg [7:0] mem [15:0]; // 16x8-bit RAM

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;      // Write operation
        else
            dout <= mem[addr];     // Read operation
    end

endmodule
