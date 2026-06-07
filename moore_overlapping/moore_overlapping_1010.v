`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2026 10:33:35 PM
// Design Name: 
// Module Name: moore_overlapping_1010
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


module moore_overlapping_1010(
input in, clk, reset,
output out
    );
    
    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11, s4 = 3'b100;
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
         NS = in ? s1 : s2;
         end
    s2 : begin
         NS = in ? s3 : s0;
         end
    s3 : begin
         NS = in ? s1 : s4;
         end
    s4 : begin
         NS = in ? s3 : s0;
         end
    default : begin
         NS = s0;
         end
    endcase
    end
    
    assign out = (PS == s4) ? 1'b1 : 1'b0; 
    
endmodule