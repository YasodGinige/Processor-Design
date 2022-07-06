`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2022 07:51:57 PM
// Design Name: 
// Module Name: processor_tb
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


module processor_tb(

    );
 reg enable;
 reg clk;
processor_combined downsampling_processor(.enable(enable), .clk(clk));
 
initial begin
    enable = 0;
    #20;
    enable =1;
end

//CLOCK GENERATION
initial begin
    clk = 1; 
    forever begin
        #5 clk = ~clk;
        end 
    end

endmodule
