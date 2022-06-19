`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2022 07:01:55 PM
// Design Name: 
// Module Name: ir_module
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


module ir_module(D, clk, rst, read, writeA, writeB, A, B);
input       [15:0] D;
input       rst, clk, read, writeA, writeB;

output reg  [15:0] A;
output reg  [15:0] B;

reg [15:0] Reg_IR;

    initial begin
	
		Reg_IR <= 16'b0;
	end
	
	always @(posedge clk)
    begin
    	if (rst == 1)
    		Reg_IR <= 16'b0;
    	else if (read == 1) begin
				Reg_IR <= D;
			end
    	else if (writeA == 1) begin
				A <= Reg_IR;
			end
		else if (writeB == 1) begin
				B <= Reg_IR;
			end
		$display("IR=%b",Reg_IR);
    end
endmodule
