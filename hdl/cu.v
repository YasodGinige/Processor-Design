module cu #(parameter BUS_WIDTH =16, 
		parameter OPCODE_LEN = 4,
		parameter ADDR_AW = 4,
		parameter ADDR_BW = 4,
		parameter DESTW = 4)(
	input [BUS_WIDTH-1:0] ir,
	input clk,
	output reg reset,
	output reg en_decA;
	output reg en_decB;	

);
reg [OPCODE_LEN-1:0] opcode;
reg [ADDR_AW-1:0] addr_A;
reg [ADDR_BW-1:0] addr_B;
reg [DESTW-1:0] addr_dest;

always@(posedge clk)begin
	opcode <= ir[BUS_WIDTH-1:BUS_WIDTH-OPCODE_LEN];
	//addr_A <= ir[BUS_WIDTH-1-OPCODE_LEN: BUS_WIDTH-OPCODE_LEN-ADDR_AW];
	//addr_B <= ir[BUS_WIDTH-OPCODE_LEN-ADDR_AW-1:BUS_WIDTH-OPCODE_LEN-ADDR_AW-ADDR_BW];
	//addr_dest <= ir[BUS_WIDTH-OPCODE_LEN-ADDR_AW-ADDR_BW-1:BUS_WIDTH-OPCODE_LEN-ADDR_AW-ADDR_BW-DESTW];
end

always@(posedge clk)
	begin
		if(opcode==0)
			reset = 0;
		else
			reset =	1;			
		end


		case(opcode)
		h'01:begin
			en_decA<=1
			
		end
			

		endcase	
	end	
end

