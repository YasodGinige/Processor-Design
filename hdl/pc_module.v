`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2022 03:24:42 PM
// Design Name: 
// Module Name: pc_project_demo
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


module pc_project_demo(PCResult, Reset, Clk, PCWrite, PCRead, D);
    input       [15:0] D;
	input      Reset, Clk, PCWrite, PCRead;

	output reg  [15:0]  PCResult;

	initial begin
	
		PCResult <= 16'b0;
	end

    always @(posedge Clk)
    begin
    	if (Reset == 1)
    		PCResult <= 16'b0;
    	else if (PCWrite == 1) begin
				PCResult <= PCResult + 16'b1;
			end
    	else if (PCRead == 1) begin
				PCResult <= D;
			end

		$display("PC=%b",PCResult);
    end
endmodule
