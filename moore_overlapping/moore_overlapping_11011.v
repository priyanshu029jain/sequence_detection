`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2026 01:48:20 AM
// Design Name: 
// Module Name: moore_overlapping_11011
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


module moore_overlapping_11011(
input in, clk, reset,
output out
    );
    
    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11, s4 = 3'b100, s5 = 3'b101;
    reg [2:0] PS , NS;
    
    always @(posedge clk) begin
    if(reset) PS <= s0;
    else PS <= NS;
    end
    
    always @(*) begin
    case(PS) 
    s0 : begin
         NS = in ? s1 : s0;
         end
    s1 : begin
         NS = in ? s2 : s0;
         end
    s2 : begin
         NS = in ? s2 : s3;
         end
    s3 : begin
         NS = in ? s4 : s0;
         end
    s4 : begin
         NS = in ? s5 : s0;
         end
    s5 : begin
         NS = in ? s2 : s3;
         end
    default : begin
         NS = s0;
         end
    endcase
    end
    
    assign out = (PS == s5) ? 1'b1 : 1'b0; 
    
endmodule
