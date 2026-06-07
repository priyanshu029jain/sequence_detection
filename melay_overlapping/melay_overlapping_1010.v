`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2026 10:35:07 PM
// Design Name: 
// Module Name: melay_overlapping_1010
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


module melay_overlapping_1010(
input in, clk, reset,
output reg out
    );
    
    parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
    reg [1:0] PS , NS;
    
    always @(posedge clk) begin
    if(reset) PS <= s0;
    else PS <= NS;
    end
    
    always @(*) begin
    case(PS) 
    s0 : begin
         out = 1'b0;
         NS = in ? s1 : s0;
         end
    s1 : begin
         out = 1'b0;
         NS = in ? s1 : s2;
         end
    s2 : begin
         out = 1'b0;
         NS = in ? s3 : s0;
         end
    s3 : begin
         out = in ? 1'b0 : 1'b1;
         NS = in ? s1 : s2;
         end
    default : begin
         out = 1'b0;
         NS = s0;
         end
    endcase
    end
    
endmodule
