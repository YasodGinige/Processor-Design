`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2022 08:45:12 PM
// Design Name: 
// Module Name: sim1
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


module sim1(
    );

reg [15:0] ir;
reg clk;

cu dut(
        .ir(ir),
        .clk(clk)
);

    initial begin
        clk = 0; 
        forever begin
            #10 clk = ~clk;
        end 
    end
    
    initial begin
        ir = 'h2000;
        #200;
    end    

endmodule
