`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2022 10:02:55 PM
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input [3:0]in,
    input EN_OP,
    input EN_OUT,
    output reg OUT [11:0]
    );
    
    reg [11:0]temp;
    always@(in)
    begin
    if (EN_OP==1)begin
    case (in)
      4'b0001: temp=12'b000000000001;
      4'b0010: temp=12'b000000000010;
      4'b0011: temp=12'b000000000100;
      4'b0100: temp=12'b000000001000;
      4'b0101: temp=12'b000000010000;
      4'b0110: temp=12'b000000100000;
      4'b0111: temp=12'b000001000000;
      4'b1000: temp=12'b000010000000;
      4'b1001: temp=12'b000100000000;
      4'b1010: temp=12'b001000000000;
      4'b1011: temp=12'b010000000000;
      4'b1100: temp=12'b100000000000;
    endcase
    end
    if (EN_OUT==1)begin
        OUT = temp;
    end
    end
endmodule
