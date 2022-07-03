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


module PC(
	input      reset, 
	input clk, 
	input inc,
    input       jump,
    input       Z,
	output reg  [15:0]  pc_result
    );
    wire sel;
    assign sel = jump & Z;
        
    always @(posedge clk)
    begin
    	if (reset == 1)
    		pc_result <= 16'b0;
    	else begin
    	   case(sel)
    	       1'b0:begin 
    	            if(inc)
    	               pc_result <= pc_result + 1;
    	            else if (inc ==0)
    	               pc_result <= pc_result;
    	            end
    	            
    	       1'b1:pc_result <= 16'h0003; // LOOP Start PC number
    	   endcase
		  end
		end
		//$display("PC=%b",PC_result);
endmodule
