`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vineet Kumar
// 
// Create Date: 09.06.2025 12:41:58
// Design Name: 
// Module Name: bt
// Project Name: 
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


module bt(
    input wire clk,
    input wire btn_0,
    output reg led
    );
    reg btn_1 = 0,btn_2 = 1;
    reg btn_d = 0,btn_dp = 0;
    reg [19:0] btn_c = 20'd0;
    wire btn_check;
    
    //to remove noise
    always@(posedge clk) begin
        btn_2 <= btn_1;
        btn_1 <= btn_0;
    end
    
    //count on pressing
    always@(posedge clk) begin
        if(btn_d == btn_2)begin
            btn_c <= 0;
        end
        else begin
            btn_c <= btn_c + 1;
            if(btn_c >= 20'd99999) begin
                btn_d <= btn_2;
                btn_c <= 20'd0;
            end
        end
    end
  
    //update
    always@(posedge clk) begin
        btn_dp <= btn_d;
    end
    
    assign btn_check = (btn_d == 1 && btn_dp == 0);
    
    //toggles led
    always@(posedge clk) begin
        if(btn_check)begin
            led <= ~led;
        end
    end
    
endmodule
