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
    assign str_pointer = out[0];//1
    assign mar = out[3];        //4
    assign mdr = out[4];        //5
    assign pr1 = out[5];        //6
    assign pr2 = out[6];        //7
    assign pr3 = out[7];        //8
    assign col = out[8];        //9
    assign row = out[9];        //a
    assign r1 = out[10];        //b
    assign r2 = out[11];        //c
    
    always@(posedge EN_OUT)begin
          case (temp_sel)
          4'b0001: out=12'b000000000001;
          4'b0100: out=12'b000000001000;
          4'b0101: out=12'b000000010000;
          4'b0110: out=12'b000000100000;
          4'b0111: out=12'b000001000000;
          4'b1000: out=12'b000010000000;
          4'b1001: out=12'b000100000000;
          4'b1010: out=12'b001000000000;
          4'b1011: out=12'b010000000000;
          4'b1100: out=12'b100000000000;
          default: out=12'b000000000000;
        endcase
    end
    always@(posedge EN_OP)begin
        if (EN_OP==1)
            temp_sel = sel;
        end
    //always@(posedge EN_OUT)
            //out = temp;
    always@(negedge EN_OUT)
            out = 12'h0000;
endmodule
