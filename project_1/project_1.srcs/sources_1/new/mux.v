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
  
   // This always block gets executed whenever a/b/c/d/sel changes value  
   // When it happens, output is assigned to either a/b/c/d  
   always @ (posedge clk) begin  
      case (sel)  
         4'b0001 : out <= str_pointer;  
         4'b0010 : out <= pc;  
         4'b0011 : out <= ir;  
         4'b0100 : out <= mar;
         4'b0101 : out <= mdr;
         4'b0110 : out <= pr1;
         4'b0111 : out <= pr2;
         4'b1000 : out <= pr3;
         4'b1001 : out <= col;
         4'b1010 : out <= row;
         4'b1011 : out <= r1;
         4'b1100 : out <= r2;           
      endcase  
   end  
endmodule  
