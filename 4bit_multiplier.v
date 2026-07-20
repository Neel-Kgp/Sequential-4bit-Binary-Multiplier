`timescale 1ns/1ns

module multiplier(
    input clk,
    input rst,
    input [3:0] multiplicand,
    input [3:0] multiplier,
    output reg [7:0] product
);

    reg [3:0] count;
    
    always@(posedge clk)
        begin
            if(rst)
                begin
                    product <= 8'b00000000;
                    count <= multiplier;
                end

            else if(count>0)
                begin
                    product <= product + multiplicand;
                    count <= count - 1;
                end    
        end   
endmodule             



