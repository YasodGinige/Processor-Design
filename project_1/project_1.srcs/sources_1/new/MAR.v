`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2022 01:16:43 AM
// Design Name: 
// Module Name: MAR
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


module MAR(input clk, rst,writeC,
        input [15:0] D,
        input inc,
        output reg[15:0] A,
        output reg[15:0] B);
        
        reg[15:0] Register; 
        always @(posedge clk, posedge rst)   
            if (rst)    
                Register <= 16'b0; 
            else if (writeC) begin   
                Register <= D;//if load is high  
                A <= 4'hzzzz;
                B <= 4'hzzzz;
            end
            else if (inc) 
                Register <= Register + 1;
            else begin 
                A <= Register;//Read to the A Bus   
                B <= Register;//Read to the B Bus 
            end
endmodule

