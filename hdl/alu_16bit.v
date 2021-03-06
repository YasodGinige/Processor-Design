`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2022 08:03:35 PM
// Design Name: 
// Module Name: alu_16bit
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


module alu_16bit #(
        parameter DWIDTH = 16
    )(
    input [DWIDTH-1:0] operand1,
    input [DWIDTH-1:0] operand2,
    input [3:0] operation,
    input clk,
    output reg [DWIDTH-1:0] dout,
    output reg Z
    );
    
    
    
    always@(*) begin        
        case(operation)
            4'b0000 : dout = operand1;
            4'b0001 : dout = operand1 + operand2;
            4'b0010 : dout = operand1 - operand2;
            4'b0011 : dout = operand1 << 1;
            4'b0100 : dout = operand1 << 2;
            4'b0101 : dout = operand1 >> 4;
            4'b0110 : dout = operand1 + 1;
            default : dout = 16'hzzzz;
            endcase
    end   
    always@(dout)begin
        if(dout == 0)
            Z <= 0;
        else
            Z <= 1;
    end
endmodule
