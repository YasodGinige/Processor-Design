`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2022 02:54:41 PM
// Design Name: 
// Module Name: MDR
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


module MDR_Mux(
        input dmem_read,
        input [15:0] C_Bus,
        input [15:0] Mem_Data_Bus,
        output reg[15:0] MDR_in);
    
        always @(posedge dmem_read)
                MDR_in <= Mem_Data_Bus; 
        always@(negedge dmem_read)
                MDR_in <= C_Bus;//if load is high                            
endmodule
