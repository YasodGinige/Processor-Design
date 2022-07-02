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


module ir_module(din, clk, rst, write_en, A, B,addrA, addrB, addrC,opcode);
input       [15:0] din;
input       rst, clk, write_en;

output [3:0] addrA;
output [3:0] addrB;
output [3:0] addrC;
output [3:0] opcode;
output reg  [15:0] A;
output reg  [15:0] B;

reg [15:0] IR;

// Mux sel outputs , address fields of the instruction

assign addrA = IR[11:8];
assign addrB = IR[7:4];
assign addrC = IR[3:0]; 

// opcode output
assign opcode = IR[15:12];

//Rest of the logic accomodates for reading immediate data
	
	always @(posedge clk)
    begin
    	if (rst == 1)
    		IR <= 16'b0;
    	else if (write_en) begin
				IR <= din;
			end
			
    	else begin                 //din is from instruction memory, if not in reset the    
		    A <= IR;
			B <= IR;
		end
		$display("IR=%b",IR);
    end
endmodule
