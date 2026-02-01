`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vineet Kumar
// 
// Create Date: 10.06.2025 11:14:13
// Design Name: 
// Module Name: calc
// Project Name: Basic Calculator
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module calc(
    input signed [3:0] a,
    input signed [3:0] b,
    input [1:0] c,
    input clk,
    output reg signed [3:0] led
    );
    
    always @(posedge clk) begin
        case(c)
            2'b00: led <= a + b;
            2'b01: led <= a - b;
            2'b10: led <= a * b;
            2'b11: begin
                if (b != 0)
                    led <= a / b;
                else
                    led <= 4'b0000;
            end
        endcase
    end
endmodule

