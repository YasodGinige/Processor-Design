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


module pc_project_demo(PC_result, Reset, Clk, inc, write, Z, jump, D);
    input       [15:0] D;
	input      Reset, Clk, inc;

	output reg  [15:0]  PC_result;
    wire sel;
    assign sel = jump & Z;
        
    always @(posedge Clk)
    begin
    	if (Reset == 1)
    		PC_result <= 16'b0;
    	else begin
    	   case(sel)
    	       1'b0 : PC_result <= PC_result + 16'b1;
    	       1'b1 : PC_result <= 4'h0003; // LOOP Start PC number
    	   endcase
		  end
		end
		//$display("PC=%b",PC_result);
endmodule
