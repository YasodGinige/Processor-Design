`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2022 03:49:06 PM
// Design Name: 
// Module Name: R1
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


module generic_reg(input clk, reset,writeC,
        input [15:0] D,
        output reg[15:0] A,
        output reg[15:0] B);
        
        reg[15:0] Register; 
        always @(posedge clk, posedge reset)   
            if (reset)    
                Register <= 16'b0; 
            else if (writeC) begin   
                Register <= D;//if load is high  
                A <= 16'hzzzz;
                B <= 16'hzzzz;
            end
            else begin 
                A <= Register;//Read to the A Bus   
                B <= Register;//Read to the B Bus 
            end
endmodule
