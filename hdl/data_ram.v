//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2022 11:25:19 PM
// Design Name: 
// Module Name: data_ram
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


module data_ram #(parameter DWIDTH = 16, parameter ADDR_WIDTH= 17)(
 input [DWIDTH-1:0] data,
 input [ADDR_WIDTH-1:0] addr,
 
 input we,clk,
 output [DWIDTH-1:0] dout
 );

parameter DEPTH = 1<< ADDR_WIDTH; 
 reg [DEPTH:0] ram [255:0];
 reg [ADDR_WIDTH:0] addr_reg;
 
 always @ (posedge clk)
 begin
  if(we)
   ram[addr]<=data;
  else
   addr_reg<=addr;
   
 end

 assign dout = ram[addr_reg];
endmodule
