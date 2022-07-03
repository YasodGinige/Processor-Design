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
    input clk,
    input [3:0]sel,
    input EN_OP,
    input EN_OUT,
    output str_pointer,
    output mar,
    output mdr,
    output pr1,
    output pr2,
    output pr3,
    output col,
    output row,
    output r1,
    output r2
    );
    
    reg [3:0]temp_sel;
    reg [11:0] temp;
    reg [11:0] out;
    assign str_pointer = out[0];
    assign mar = out[3];
    assign mdr = out[4];
    assign pr1 = out[5];
    assign pr2 = out[6];
    assign pr3 = out[7];
    assign col = out[8];
    assign row = out[9];
    assign r1 = out[10];
    assign r2 = out[11];
    
    always@(posedge clk)
        begin
            if (EN_OP==1)
                temp_sel = sel;
        
        case (temp_sel)
          4'b0001: temp=12'b000000000001;
          4'b0100: temp=12'b000000001000;
          4'b0101: temp=12'b000000010000;
          4'b0110: temp=12'b000000100000;
          4'b0111: temp=12'b000001000000;
          4'b1000: temp=12'b000010000000;
          4'b1001: temp=12'b000100000000;
          4'b1010: temp=12'b001000000000;
          4'b1011: temp=12'b010000000000;
          4'b1100: temp=12'b100000000000;
          default: temp=12'b000000000000;
        endcase
        if (EN_OUT==1)
            out = temp;
        else
            out = 12'h0000;      
        end
endmodule
