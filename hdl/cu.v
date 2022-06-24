module cu #(parameter BUS_WIDTH =16, 
		parameter OPCODE_LEN = 4,
		parameter ADDR_AW = 4,
		parameter ADDR_BW = 4,
		parameter DESTW = 4)(
	input [BUS_WIDTH-1:0] ir,
	input clk,

	output reg reset,
	output reg en_decAop,
	output reg en_decBop,
	output reg en_decCop,
	output reg en_decAout,
	output reg en_decBout,
	output reg en_decCout,	
	output reg [3:0]  alu_ctrl,
	output reg dmem_read,
	output reg dmem_write,
	output reg imem_read,
	output reg pc_inc,
	output reg jump
);
reg [OPCODE_LEN-1:0] opcode;
reg [ADDR_AW-1:0] addr_A;
reg [ADDR_BW-1:0] addr_B;
reg [DESTW-1:0] addr_dest;

/*          4'b0000 : out = operand1;
            4'b0001 : out = operand1 + operand2;
            4'b0010 : out = operand1 - operand2;
            4'b0011 : out = operand1 << 1;
            4'b0100 : out = operand1 << 2;
            4'b0101 : out = operand1 >> 4;
            4'b0110 : out = operand1 + 1; */

integer state = 0;

always@(posedge clk)begin
	opcode <= ir[BUS_WIDTH-1:BUS_WIDTH-OPCODE_LEN];
	//addr_A <= ir[BUS_WIDTH-1-OPCODE_LEN: BUS_WIDTH-OPCODE_LEN-ADDR_AW];
	//addr_B <= ir[BUS_WIDTH-OPCODE_LEN-ADDR_AW-1:BUS_WIDTH-OPCODE_LEN-ADDR_AW-ADDR_BW];
	//addr_dest <= ir[BUS_WIDTH-OPCODE_LEN-ADDR_AW-ADDR_BW-1:BUS_WIDTH-OPCODE_LEN-ADDR_AW-ADDR_BW-DESTW];
end

always@(posedge clk)
	begin
		case(state)
			h'00:begin
				reset <=0;
				state <= state +1;
				end
			h'01:begin
				en_decAop <=1;
				en_decAout <= 1;
				alu_ctrl <= 4'b0000;
				en_decCop <= 1;
				en_decCout <=1;
				state <= state +1;
				end 	
			h'02:begin
				pc_inc <=1;
				imem_read <=1;
				en_decAop <=0;
				en_decAout <= 0;
				en_decCop <=0;
				en_decCout <=0;
				state <= state + 1;
				end
			h'03:begin
				pc_inc <= 0;
				state <= state + 1;
				end
			h'04:begin
				
				end
		endcase	
	end	
end

