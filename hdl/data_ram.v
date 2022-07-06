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
 input done,
 input we,clk,
 output reg [DWIDTH-1:0] dout
 );

// parameter DEPTH = 1<< ADDR_WIDTH; 
 reg [7:0] ram [DEPTH:0];
 reg [ADDR_WIDTH-1:0] index;
 integer f;
 //reg [ADDR_WIDTH:0] addr_reg;
 initial begin
    $readmemh("dmem.mem",ram); // read file from INFILE
    f = $fopen("C:\\Users\\menuw\\Documents\\Processor-Design\\output.txt","w");
    index = 0;
end

always@(posedge clk)begin
      if ( done  == 1 )begin
        //for (i = 0; i<16129; i=i+1) begin
          //$display("OUT %b", dram[i]);
          index <= index+1;
          $fwrite(f,"%h\n",ram[index] ); //NOT DRAM < DMEM
          //end
      end
      if(index == 16129)begin
        $fclose(f);
        $finish;
      end
end
always @ (posedge clk)
 begin
  if(we === 1)begin
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

