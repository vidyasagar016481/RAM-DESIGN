module ram_tb;

    reg clk, we;
    reg [3:0] addr;
    reg [7:0] din;
    wire [7:0] dout;

    ram_design uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock generation
    end

    initial begin
        $display("Starting RAM Test...");

        // Write data AA to address 2
        we = 1; addr = 4'b0010; din = 8'hAA; #10;

        // Read data from address 2
        we = 0; addr = 4'b0010; #10;

        $display("Read Data: %h", dout); // Should print AA
        $finish;
    end

endmodule
