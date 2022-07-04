module cu #(parameter BUS_WIDTH =16, 
		parameter OPCODE_LEN = 4,
		parameter ADDR_AW = 4,
		parameter ADDR_BW = 4,
		parameter DESTW = 4)(
	input [BUS_WIDTH-1:0] ir,
	input clk,
    input enable,
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
	output reg mar_inc,
	output reg col_zero,
	output reg col_inc,
	output reg row_inc,
	output reg jump,
	output reg clock_en
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
	addr_A <= ir[BUS_WIDTH-1-OPCODE_LEN: BUS_WIDTH-OPCODE_LEN-ADDR_AW];
	addr_B <= ir[BUS_WIDTH-OPCODE_LEN-ADDR_AW-1:BUS_WIDTH-OPCODE_LEN-ADDR_AW-ADDR_BW];
	addr_dest <= ir[BUS_WIDTH-OPCODE_LEN-ADDR_AW-ADDR_BW-1:BUS_WIDTH-OPCODE_LEN-ADDR_AW-ADDR_BW-DESTW];
end

 
always@(posedge clk)
    if (enable)  begin 
    //begin
        case(state)
              // START
            'h0:begin           
                reset <=1;          //ACTIVE HIGH RESET
                state <= state +1;
                en_decAop <=0;
                en_decBop <=0;
                en_decCop <=0;
                en_decAout <= 0;
                en_decBout <= 0;
                en_decCout <= 0;	
                alu_ctrl <=0;
                dmem_read <= 0;
                dmem_write <= 0;
                imem_read <= 0;
                pc_inc <= 0;
                mar_inc <=0;
                col_zero <=0;
                col_inc <= 0;
                row_inc <= 0;
                jump <= 0;
                end
            
            // FETCH	
            'h01:begin
//                reset <= 0;
//                en_decAop <= 1;
//                en_decAout <= 1;
//                alu_ctrl <= 4'b0000;
//                en_decCop <= 1;
//                en_decCout <=1;
//                state <= state +1;
                    reset <=0;
                    imem_read <=1;
                    state <= state +1;
                end 	
            'h02:begin
                pc_inc <=1;
                imem_read <=0;
                state <= state + 1;
                end
            'h03:begin
                pc_inc <= 0;
                imem_read <= 0;
                state <= state + 1;
                //state <= opcode;
                end
            
            //SELECTING THE INSTRUCTION STATE FROM OPCODE	
            'h04:begin
                case(opcode)
                    'h0:state<='h00;    //START
                    'h1:state<='h01;    //FETCH
                    'h2:state<='h05;    //LOADIM
                    'h3:state<='h09;    //LOAD
                    'h4:state<='h0b;    //LSHIFT1
                    'h5:state<='h0e;    //LSHIFT2
                    'h6:state<='h11;    //RSHIFT4
                    'h7:state<='h14;    //ADD
                    'h8:state<='h17;    //SUB
                    'h9:state<='h1a;    //STORE
                    'ha:state<='h1c;    //MOVE
                    'hb:state<='h1f;    //JUMPNZ
                    'hc:state<='h24;    //MAR INCREMENT
                    'hd:state<='h26;    //COL INCREMENT
                    'he:state<='h28;    //ROW INCREMENT
                    'hf:state<='h0b;    //END
                    
                    
                    
                    
                    endcase
                end
            
            // LOAD IMMEDIATE~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
            'h05:begin
                 en_decAop <= 1;
                 en_decCop <= 1;
                 //imem_read <= 1;
                 state <= state + 1;
                 end
             'h06:begin
                 imem_read <= 1;
                 en_decAop <= 0;
                 en_decCop <= 0;
                 state <= state + 1;
                 end
                 
             'h07:begin
                 imem_read <=0;
                 en_decAout <= 1;
                 en_decCout <= 1;
                 //pc_inc <= 1;
                 state <= state + 1;
                 end
             'h08:begin
                 en_decAout <= 0;
                 en_decCout <= 0;
                 pc_inc <= 1;
                 state <= 1; 
                 end  
             
             //LOAD~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             //'h09:begin
             //    dmem_read <=1;
             //    state <= state +1;
             //    end
             'h0a:begin
                 dmem_read <=0;
                 state <=1;
                 end
                 
             //LSHIFT1~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             'h0b:begin
                state <= state +1;
                en_decAop <= 1;
                en_decCop <= 1;
                end
             'h0c:begin
                 alu_ctrl <= 4'b0011;
                 state <= state +1;
                 en_decAop <= 0;
                 en_decAout <= 1;
                 en_decCop <= 0;
                 en_decCout <= 1;
                 end
             'h0d:begin
                 alu_ctrl  <= 0;
                 en_decAout <=0;
                 en_decCout <=0;
                 state <= 1;
                 end
             //LSHIFT2~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             'h0e:begin
                  state <= state + 1;
                  en_decAop <= 1;
                  en_decCop <= 1;
                  end
             'h0f:begin
                 alu_ctrl <= 4'b0100;
                 state <= state +1;
                 en_decAop <= 0;
                 en_decCop <= 0;
                 en_decAout  <= 1;
                 en_decCout <= 1;
                 end
             'h10:begin
                 alu_ctrl  <= 0;
                 state <= 1;
                 en_decAout  <= 0;
                 en_decCout <= 0;
                 end
                 
             //RSHIFT4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    
             'h11:begin
                 state <= state +1;
                 en_decAop <=1;
                 en_decCop  <= 1;
                 end
             'h12:begin
                 alu_ctrl <= 4'b0101;
                 state <= state +1;
                 en_decAop <= 0;
                 en_decCop <= 0;
                 en_decAout <= 1;
                 en_decCout <= 1;
                 end
             'h13:begin
                 alu_ctrl <=0;
                 state <= 1;
                 en_decAout <= 0;
                 en_decCout <= 0;
                 end
                 
             //ADD~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             'h14:begin
                 en_decAop <= 1;
                 en_decBop <= 1;
                 en_decCop <= 1;             
                 state <= state +1;
                 end
             'h15:begin
                 alu_ctrl <= 4'b0001;
                 state <= state + 1;
                 en_decAop <= 0;
                 en_decAout <=1;
                 en_decBop <= 0;
                 en_decBout<=1;
                 en_decCop <= 0;
                 en_decCout <=1;
                 end
             //'h16:state <= state+1;
             'h16:begin
                 alu_ctrl  <= 0;
                 en_decAout <= 0;
                 en_decBout <= 0;
                 en_decCout <= 0;
                 state <= 1;
                 end
                 
             //SUB~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             'h17:begin
                 state <= state + 1;  
                 en_decAop <= 1;
                 en_decBop <= 1;
                 en_decCop <= 1;
             end
             'h18:begin
                 alu_ctrl <= 4'b0010;
                 state <= state + 1;
                 en_decAop <= 0;
                 en_decAout <=1;
                 en_decBop <= 0;
                 en_decBout<=1;
                 en_decCop <= 0;
                 en_decCout <=1;
                 end
             'h19:begin
                 alu_ctrl <= 0;
                 en_decAout <= 0;
                 en_decBout <= 0;
                 en_decCout <= 0;
                 state <= 1;
                 end
             
             //STORE~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             'h1a:begin
                 dmem_write <= 1;
                 state <= state + 1;
                 end
             'h1b:begin
                 dmem_write <= 0;
                 state <= 1;
                 end
             
             //MOVE~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             'h1c:begin
                  state <= state + 1;
                  en_decAop <=1;
                  en_decCop <=1;
                  end
             'h1d:begin
                 alu_ctrl <= 4'b0000;
                 state <= state + 1;
                 en_decAop <=0;
                 en_decCop <=0;
                 en_decAout <=1;
                 en_decCout <=1;
                 end
             'h1e:begin
                 state <= 1;
                 en_decAout <=0;
                 en_decCout <=0;
                 end
                 
             //JUMPNZ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
             'h1f:begin          
                 en_decAop <= 1;
                 en_decBop <= 1;     //Now addresses are saved in mux
                 state <= state + 1;
                 end
             'h20:begin
                 en_decAop <= 0;
                 en_decBop <= 0;
                 imem_read  <= 1;
                 state <= state + 1;
                 end
             'h21:begin
                 //jump <= 1;
                 en_decAout <=1;
                 en_decBout <=1;
                 alu_ctrl <= 4'b0010;
                 state <= state + 1;
                 end
             'h22:begin 
                  jump <=1;
                  state <= state + 1;             
                  end               
             'h23:begin
                  state <= 1;
                  jump <=0;
                  end
             ///////////////////////////
             //MAR INCREMENT
             'h24:begin
                 mar_inc <=1;
                 state <= state + 1;
                 end
             'h25:begin
                 mar_inc <= 0;
                 state <= 1;
             end
             
             //COL INCREMENT
             'h26:begin
                 col_inc <=1;
                 state <= state + 1;
                 end
             'h27:begin
                 col_inc <= 0;
                 state <= 1;
             end
             
             //ROW INCREMENT
             'h28:begin
                 row_inc <=1;
                 state <= state + 1;
                 col_zero <=1;
                 end
                 
             'h29:begin
                 row_inc <= 0;
                 col_zero <= 0;
                 state <= 1;
                 state <= 1;
             end
            
            'h2a:begin
                clock_en <=0;
            end
             
             //////////////////////////
        endcase	
    //end
end	
endmodule
    
