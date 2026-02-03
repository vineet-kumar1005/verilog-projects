`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vineet Kumar
// 
// Create Date: 14.06.2025 10:13:59
// Design Name: 
// Module Name: disp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: This is for Xilinx FPGA boards with onboard multiplexed 7-segment displays.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module disp(
    input  clk,             
    input  [3:0] binary_in,         
    output reg [6:0] seg,            
    output reg [7:0] an               
);


    reg [16:0] clk_div = 0;
    reg mux_clk = 0;

    always @(posedge clk) begin
        clk_div <= clk_div + 1;
        if (clk_div == 17'd99999) begin
            clk_div <= 0;
            mux_clk <= ~mux_clk;
        end
    end


    reg [3:0] tens;
    reg [3:0] ones;

    always @(posedge clk) begin
        tens <= binary_in / 10;
        ones <= binary_in % 10;
    end


    function [6:0] seven_seg;
        input [3:0] digit;
        begin
            case (digit)
                4'd0: seven_seg = 7'b1000000;
                4'd1: seven_seg = 7'b1111001;
                4'd2: seven_seg = 7'b0100100;
                4'd3: seven_seg = 7'b0110000;
                4'd4: seven_seg = 7'b0011001;
                4'd5: seven_seg = 7'b0010010;
                4'd6: seven_seg = 7'b0000010;
                4'd7: seven_seg = 7'b1111000;
                4'd8: seven_seg = 7'b0000000;
                4'd9: seven_seg = 7'b0010000;
                default: seven_seg = 7'b1111111;
            endcase
        end
    endfunction

    always @(posedge clk) begin
        if (mux_clk == 1'b0) begin
            seg <= seven_seg(ones);
            an  <= 8'b11111110;   // enable digit 0
        end else begin
            seg <= seven_seg(tens);
            an  <= 8'b11111101;   // enable digit 1
        end
    end

endmodule

