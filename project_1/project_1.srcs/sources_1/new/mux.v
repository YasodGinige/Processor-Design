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


module mux ( 
             input clk,
             input reset,
             input en_op,
             input en_out,
             input [3:0] sel,
             input [15:0] str_pointer, 
             input [15:0] pc,                   
                       input [15:0] ir,                   
                       input [15:0] mar,                 
                       input [15:0] mdr,
                       input [15:0] pr1,
                       input [15:0] pr2,
                       input [15:0] pr3,
                       input [15:0] col,
                       input [15:0] row,
                       input [15:0] r1,
                       input [15:0] r2,                  
                       output reg [15:0] out);         // 4-bit output based on input sel  
  
    reg [15:0] temp;
    
   always @ (posedge clk) begin 
        if(en_op) begin
          case (sel)  
             4'b0001 : temp <= str_pointer;  
             4'b0010 : temp <= pc;  
             4'b0011 : temp <= ir;  
             4'b0100 : temp <= mar;
             4'b0101 : temp <= mdr;
             4'b0110 : temp <= pr1;
             4'b0111 : temp <= pr2;
             4'b1000 : temp <= pr3;
             4'b1001 : temp <= col;
             4'b1010 : temp <= row;
             4'b1011 : temp <= r1;
             4'b1100 : temp <= r2;           
          endcase
        end
        if (en_out)
            out <= temp; 
    end    
endmodule  
