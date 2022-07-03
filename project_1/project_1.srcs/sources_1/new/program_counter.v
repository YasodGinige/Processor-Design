`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2022 04:42:00 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input clk,
    input reset,
    input inc,
    input Z,
    input jump,
    output reg [15:0] imem_addr
    );
    
    wire sel;
    assign sel = Z && jump;
    reg [15:0] incValue = 0;
always@(posedge inc)
    begin
    incValue = imem_addr + 1;
end

always@(posedge clk)begin
    if(reset)
        imem_addr <= 0;
    else
        imem_addr <= incValue;
    if(sel == 0)
        imem_addr = incValue;
    else if(sel == 1)begin
        imem_addr = 16'h0003;
        incValue = 16'h0003;
        end
    end  
endmodule
