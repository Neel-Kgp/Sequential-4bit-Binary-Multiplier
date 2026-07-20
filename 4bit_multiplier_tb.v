`timescale 1ns/1ns

module multiplier_tb;

    reg clk;
    reg rst;
    reg [3:0] multiplicand;
    reg [3:0] multiplier;
    wire [7:0] product;

    // Instantiate DUT
    multiplier DUT(
        .clk(clk),
        .rst(rst),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    // Clock generation

    always #5 clk = ~clk;

    initial 
        begin
            clk = 0;
            rst = 0;
            multiplicand = 0;
            multiplier = 0;

            // Generate VCD file
            $dumpfile("multiplier.vcd");
            $dumpvars(0, multiplier_tb);

            // Display values
            $monitor("Time=%0t  Multiplicand=%d  Multiplier=%d  Product=%d",$time, multiplicand, multiplier, product);

            // Test Case : 3 × 4 = 12
            multiplicand = 4'd3;
            multiplier   = 4'd4;

            rst = 1;
            #10;
            rst = 0;

            // Wait for four clock cycles
            repeat(4) @(posedge clk);

            #10;
            $finish;

        end

endmodule