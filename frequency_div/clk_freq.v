`timescale 1ns / 1ps
module clk_freq(
    input wire clk,
    output wire clk_out
    );
    parameter divisor = 1000;
    reg[15:0] counter = 0;
    always@(posedge clk) begin
        counter <= counter + 1;
        if(counter >= (divisor - 1))
            counter <= 0;
        end
    assign clk_out = (counter < (divisor/2)) ? 1 : 0;
endmodule
