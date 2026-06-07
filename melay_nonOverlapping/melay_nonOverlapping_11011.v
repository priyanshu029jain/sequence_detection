`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2026 01:49:46 AM
// Design Name: 
// Module Name: melay_nonOverlapping_11011
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


module melay_nonOverlapping_11011(
input in, clk, reset,
output reg out
    );
    
    parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;
    reg [2:0] PS , NS;
    
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
         NS = in ? s2 : s0;
         end
    s2 : begin
         out = 1'b0;
         NS = in ? s2 : s3;
         end
    s3 : begin
         out = 1'b0;
         NS = in ? s4 : s0;
         end  
    s4 : begin
         out = in ? 1'b1 : 1'b0;
         NS = in ? s0 : s0;
         end
    default : begin
         out = 1'b0;
         NS = s0;
         end
    endcase
    end
    
endmodule
