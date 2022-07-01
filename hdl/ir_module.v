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


module ir_module(din, clk, rst, writeC, A, B,addrA, addrB, addrC);
input       [15:0] din;
input       rst, clk, writeC;

output reg [3:0] addrA;
output reg [3:0] addrB;
output reg [3:0] addrC;
output reg [3:0] opcode;
output reg  [15:0] A;
output reg  [15:0] B;

reg [15:0] Reg_IR;

// Mux sel outputs , address fields of the instruction

assign addrA = Reg_IR[11:8];
assign addrB = Reg_IR[7:4];
assign addrC = Reg_IR[3:0]; 

// opcode output
assign opcode = Reg_IR[15:12];

//Rest of the logic accomodates for reading immediate data
	
	always @(posedge clk)
    begin
    	if (rst == 1)
    		Reg_IR <= 16'b0;
    	else if (writeC == 1) begin
				Reg_IR <= din;
				A <= 4'hzzzz;
				B <= 4'hzzzz;
			end
    	else begin
		    A <= Reg_IR;
			B <= Reg_IR;
		end
		$display("IR=%b",Reg_IR);
    end
endmodule
