`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2022 06:41:06 PM
// Design Name: 
// Module Name: mux
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


module mux_c ( 
             input clk,
             input reset,
             input en_op,
             input en_out,
             input [3:0] sel,
             output reg [15:0] str_pointer, 
             //output reg [15:0] pc,                   
             output reg [15:0] ir,                   
             output reg [15:0] mar,                 
             output reg [15:0] mdr,
             output reg [15:0] pr1,
             output reg [15:0] pr2,
             output reg [15:0] pr3,
             output reg [15:0] col,
             output reg [15:0] row,
             output reg [15:0] r1,
             output reg [15:0] r2,                  
             input reg [15:0] alu_in);         // 4-bit output based on input sel  
  
    reg [15:0] temp;
    reg [3:0] temp_sel;
   always @ (posedge clk) begin 
        if(en_op) begin
          temp_sel <= sel;
        end
        case (temp_sel)  
             4'b0001 : str_pointer;  
             4'b0010 : pc;  
             4'b0011 : ir;  
             4'b0100 : mar;
             4'b0101 : mdr;
             4'b0110 : pr1;
             4'b0111 : pr2;
             4'b1000 : pr3;
             4'b1001 : col;
             4'b1010 : row;
             4'b1011 : temp <= r1;
             4'b1100 : temp <= r2;           
          endcase
        if (en_out)
            temp <= temp; 
        else
            temp <= 4'hzzzz;
    end    
endmodule  
