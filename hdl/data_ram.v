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


module data_ram #(parameter DWIDTH = 16, parameter ADDR_WIDTH= 16, parameter DEPTH = 65535)(
 input [DWIDTH-1:0] din,
 input [ADDR_WIDTH-1:0] addr,
 
 input we,clk,
 output reg [DWIDTH-1:0] dout
 );

// parameter DEPTH = 1<< ADDR_WIDTH; 
 reg [7:0] ram [DEPTH:0];
 //reg [ADDR_WIDTH:0] addr_reg;
  initial begin
    $readmemh("dmem.mem",ram,0,6); // read file from INFILE
end

 always @ (posedge clk)
 begin
  if(we)begin
   ram[addr]<=din;
   dout <= 16'hzzzz;
  end
  else
   //addr_reg<=addr;
   ram[addr] <= ram[addr];
   dout <= ram[addr];
 end

// assign dout = (~we) ? ram[addr] : 0;
endmodule

