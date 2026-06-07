`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2026 11:00:35 PM
// Design Name: 
// Module Name: tb_sequence_detection
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


module tb_sequence_detection ;

reg clk, in, reset;
wire out;

//moore_overlapping_11011 uut0(
//.in(in), .clk(clk), .reset(reset), .out(out)
//    );
    
//melay_overlapping_11011 uut1(
//.in(in), .clk(clk), .reset(reset), .out(out)
//    );
    
//moore_nonOverlapping_11011 uut2(
//.in(in), .clk(clk), .reset(reset), .out(out)
//    );
    
melay_nonOverlapping_11011 uut3(
.in(in), .clk(clk), .reset(reset), .out(out)
    );

always #5 clk = ~clk;

initial begin
{in, clk, reset} = 3'b001;

#3 reset = 1'b0;

repeat(20) begin
#10 in = $random;
end

#10 $finish;
end

endmodule
