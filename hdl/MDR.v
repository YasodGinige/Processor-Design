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


module MDR(input clk, rst, readA,readB,writeC,
        input [15:0] D,
        output reg[15:0] A,
        output reg[15:0] B);
        
        reg[15:0] Reg_MDR; 
        always @(posedge clk, posedge rst)    
            if (rst)    
                Reg_MDR <= 16'b0; 
            else if (writeC)    
                Reg_MDR <= D;//if load is high      A and C both active at once???? else if??
            else if (readA)    
                A <= Reg_MDR;//Read to the A Bus
            else if (readB)    
                B <= Reg_MDR;//Read to the B Bus    
            else    
                Reg_MDR <= Reg_MDR;//Refreshing.... Is this needed??????
endmodule
