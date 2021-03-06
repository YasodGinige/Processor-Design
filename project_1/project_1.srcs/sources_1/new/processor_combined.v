//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/06/2022 07:48:01 PM
// Design Name: 
// Module Name: processor_combined
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


module processor_combined(
    input enable,
    input clk,
    output [7:0] dram_output
    );   
parameter LEN_IRAM = 67;
parameter LEN_DRAM = 65535;

wire [15:0] c_bus;
wire [15:0] a_bus;
wire [15:0] b_bus;

//CONTROL UNIT CONNECTIONS
wire clock_en;
wire jump;
wire row_inc;
wire col_inc;
wire col_zero;
wire mar_inc;
wire pc_inc;
wire imem_read;
wire dmem_write;
wire dmem_read;
wire [3:0] alu_ctrl;
wire en_decCout;
wire en_decBout;
wire en_decAout;
wire en_decCop;
wire en_decBop;
wire en_decAop;
wire reset;
wire [15:0] irtocu;
wire done;
//
reg [15:0] ir;
reg [15:0] iram [LEN_IRAM:0];
reg [7:0] dram [LEN_DRAM:0];
//INSTRUCTION REGISTER CONNECTIONS
wire [3:0]addrA;
wire [3:0]addrB;
wire [3:0]addrC;

// WRITE ENABLE CONNECTIONS
wire str_pointer_wen;
wire ir_wen;
wire pr1_wen;
wire pr2_wen;
wire pr3_wen;
wire mar_wen;
wire mdr_wen;
wire col_wen;
wire row_wen;
wire r1_wen;
wire r2_wen;

//A BUS CONNECTIONS
wire [15:0] str_A;
wire [15:0] pc_A;
wire [15:0] ir_A;
wire [15:0] mar_A;
wire [15:0] mdr_A;
wire [15:0] pr1_A;
wire [15:0] pr2_A;
wire [15:0] pr3_A;
wire [15:0] col_A;
wire [15:0] row_A;
wire [15:0] r1_A;
wire [15:0] r2_A;

//B BUS CONNECTIONS
wire [15:0] str_B;
wire [15:0] pc_B;
wire [15:0] ir_B;
wire [15:0] mar_B;
wire [15:0] mdr_B;
wire [15:0] pr1_B;
wire [15:0] pr2_B;
wire [15:0] pr3_B;
wire [15:0] col_B;
wire [15:0] row_B;
wire [15:0] r1_B;
wire [15:0] r2_B;

//ALU CONNECTIONS
wire Z;

//MEMORY CONNECTIONS
wire [15:0] imem_addr;
wire [15:0] imem_dout;
wire [15:0] imem_din;
wire imem_wen;
wire [15:0] dmem_addr;
wire [15:0] dmem_dout;
wire [15:0] dmem_din;
wire dmem_wen; ///set to 1 bit
wire [15:0] imem_addr_pc;
wire [15:0] mdr_din;

//CONTROL UNIT INSTANTIATION
cu cu(
    .clock_en(clock_en),
    .jump(jump),
    .row_inc(row_inc),
    .col_inc(col_inc),
    .col_zero(col_zero),
    .mar_inc(mar_inc),
    .pc_inc(pc_inc),
    .imem_read(imem_read),
    .dmem_write(dmem_write ),
    .dmem_read(dmem_read),
    .alu_ctrl(alu_ctrl),
    .en_decCout(en_decCout),
    .en_decCop(en_decCop),
    .en_decBout(en_decBout),
    .en_decBop(en_decBop),
    .en_decAout(en_decAout),
    .en_decAop(en_decAop),
    .reset(reset),
    .ir(irtocu),
    .clk(clk),
    .enable(enable),
    .done(done)  
);

//ALU INSTANTIATION
alu_16bit #(
        .DWIDTH(16)
    )alu(
    .operand1(a_bus),
    .operand2(b_bus),
    .operation(alu_ctrl),
    .clk(clk),
    .dout(c_bus),
    .Z(Z)
    );

//DECODER C INSTANTIATION
Decoder dec_C(
    .clk(clk),
    .sel(addrC),
    .EN_OP(en_decCop),
    .EN_OUT(en_decCout ),
    .str_pointer(str_pointer_wen),
    .mar(mar_wen),
    .mdr(mdr_wen),
    .pr1(pr1_wen ),
    .pr2(pr2_wen ),
    .pr3(pr3_wen ),
    .col(col_wen),
    .row(row_wen),
    .r1(r1_wen),
    .r2(r2_wen)
    );

//MUX A INSTANTIATION
mux MUX_A( 
          .clk(clk),
          .reset(reset),
          .en_op(en_decAop ),
          .en_out(en_decAout ),
          .sel(addrA ),
          .str_pointer(str_A), 
          .pc(pc_A),                   
          .ir(ir_A),
          .mar(mar_A),                 
          .mdr(mdr_B),
          .pr1(pr1_A),
          .pr2(pr2_A),
          .pr3(pr3_A),
          .col(col_A),
          .row(row_A),
          .r1(r1_A),
          .r2(r2_A),                  
           .dout(a_bus));   

//MUX A INSTANTIATION
mux MUX_B( 
          .clk(clk),
          .reset(reset),
          .en_op(en_decBop ),
          .en_out(en_decBout ),
          .sel(addrB),
          .str_pointer(str_B), 
          .pc(pc_B),                   
          .ir(ir_B),
          .mar(mar_B),                 
          .mdr(mdr_B),
          .pr1(pr1_B),
          .pr2(pr2_B),
          .pr3(pr3_B),
          .col(col_B ),
          .row(row_B),
          .r1(r1_B),
          .r2(r2_B),                  
           .dout(b_bus));   

//INSTRUCTION MEMORY INSTANTIATION
imem_ram #(.DWIDTH(16), .ADDR_WIDTH(16), .DEPTH(LEN_IRAM))IMEM(
                .din(imem_din),
                .we(imem_wen),
                .addr(imem_addr ),
                .clk(clk),
                .dout(imem_dout)
 );

//DATA MEMORY INSTANTIATION

data_ram #(.DWIDTH(8), .ADDR_WIDTH(16), .DEPTH(LEN_DRAM))DMEM(
            .din(dmem_din ),
            .we(dmem_wen),
            .addr(dmem_addr ),
            .clk(clk),
            .dout(dmem_dout),
            .done(done)
);

MDR_Mux mdr_mux( 
                .dmem_read(dmem_read),           //read from dmem, dmem_dout
                .C_Bus(c_bus),
                .Mem_Data_Bus(dmem_dout),
                .MDR_in(mdr_din)
        );
        
generic_reg MDR(
                .clk(clk),
                .writeC(mdr_wen),
                .D(mdr_din),
                .A(mdr_A),
                .B(mdr_B)
      
        );

MAR MAR( .clk(clk), 
            .rst(reset),
            .writeC(mar_wen),
            .D(c_bus),
            .inc(mar_inc),
            .A(mar_A),
            .B(mar_B)
            );
            
//INSTRUCTION REGISTER INSTANTIATION
ir_module I_REG(
        .din(imem_dout), 
        .clk(clk), 
        .rst(reset), 
        .write_en(imem_read), 
        .A(ir_A ), 
        .B(irtocu),
        .addrA(addrA), 
        .addrB(addrB), 
        .addrC(addrC)
            );

//STR POINTER INSTANTIATION
generic_reg str_pointer(
            .clk(clk),
            .writeC(str_pointer_wen),
            .D(c_bus),
            .A(str_A),
            .B(str_B),
            .reset(reset)
);

//PC INSTANTIATION
program_counter PC(
        .reset(reset), 
        .clk(clk), 
        .inc(pc_inc), 
        .Z(Z), 
        .jump(jump),
        .imem_addr(imem_addr_pc)); 

//PR1 INSTANTIATION
generic_reg PR1(
        .clk(clk),
        .writeC(pr1_wen),
        .D(c_bus),
        .A(pr1_A),
        .B(pr1_B)
);

//PR2 INSTANTIATION
generic_reg PR2(
        .clk(clk),
        .writeC(pr2_wen),
        .D(c_bus),
        .A(pr2_A),
        .B(pr2_B)
);

//PR3 INSTANTIATION
generic_reg PR3(
        .clk(clk),
        .writeC(pr3_wen),
        .D(c_bus),
        .A(pr3_A),
        .B(pr3_B)
);

//COL INSTANTIATION
COL COL(.clk(clk), 
        .rst(reset),
        .writeC(col_wen),
        .D(c_bus),
        .inc(col_inc),
        .zero(col_zero),
        .A(col_A),
        .B(col_B));

//ROW INSTANTIATION
ROW ROW(.clk(clk), 
        .rst(reset),
        .writeC(row_wen),
        .D(c_bus),
        .inc(row_inc),
        .A(row_A),
        .B(row_B));
        
//R1 INSTANTIATION
generic_reg R1(
        .clk(clk),
        .writeC(r1_wen),
        .D(c_bus),
        .A(r1_A),
        .B(r1_B)
);

//R2 INSTANTIATION
generic_reg R2(
        .clk(clk),
        .writeC(r2_wen),
        .D(c_bus),
        .A(r2_A),
        .B(r2_B)
);

    
reg [15:0] c_bus_reg;
reg [15:0] pr1_wen_reg;
reg [15:0] pr2_wen_reg;
reg [15:0] imem_addr_reg;
reg [15:0] imem_din_reg;
reg [15:0] imem_dout_reg;

reg [15:0] dmem_addr_reg;
reg [7:0] dmem_din_reg;
reg dmem_wen_reg;
reg imem_wen_reg;

//assign c_bus = c_bus_reg;
//assign pr1_wen = pr1_wen_reg;
//assign pr2_wen = pr2_wen_reg;
assign clock_en = (enable) ? 1'bz:0;
//assign imem_addr = (~iload_done) ? imem_addr_reg:imem_addr_pc;
//assign imem_din = imem_din_reg;
//assign imem_wen = (~iload_done) ? imem_wen_reg:(~imem_read);
//assign imem_wen = imem_wen_reg;
assign imem_addr = imem_addr_pc;
assign imem_din = imem_din_reg;
assign imem_wen = 0;
assign dram_output = dmem_dout;

//assign dmem_addr = (~(dload_done &&clock_en)) ? dmem_addr_reg:mar_A;
//assign dmem_din = (~dload_done) ? dmem_din_reg : mdr_A;
//assign dmem_wen = (~dload_done) ? dmem_wen_reg : dmem_write;
assign dmem_addr = mar_A;
assign dmem_din = mdr_A;
assign dmem_wen = dmem_write;

//assign enable = dload_done && iload_done;
//assign imem_addr_pc = (iload_done)? imem_addr: 16'hzzzz;
//initial begin                                      
//    enable = 0;
//    c_bus_reg  = 1444;
//    pr1_wen_reg  = 1;
//    #40
//    c_bus_reg = 154;
//    pr1_wen_reg  = 0;
//    pr2_wen_reg  = 1;
//    #40
//    pr2_wen_reg  = 0;
//    ir = 16'h2607;
//    enable = 1;
//    c_bus_reg = 16'hzzzz;
//    #100
//    ir = 16'd258;
//    #100
//    ir = 16'h1000;
//end

/*
//LOADING IMEM DATA
always@(posedge clk)begin
    if(~iload_done)begin
        imem_addr_reg <= imem_addr_reg +1;
        imem_din_reg <= iram[imem_addr_reg];
        end
        if (imem_addr_reg == LEN_IRAM+1)begin        //array length counted from 1
            iload_done = 1;
//            enable = 1;
            imem_addr_reg <= 16'hzzzz;
            imem_din_reg <= 16'hzzzz;
            imem_wen_reg <= 16'h0000;
            end
    end
/*
//LOADIND DMEM DATA
always@(posedge clk)begin
    if(~dload_done)begin
        dmem_addr_reg <= dmem_addr_reg +1;
        dmem_din_reg <= dram[dmem_addr_reg];
        end
        if(dmem_addr_reg == LEN_DRAM+1)begin
            dload_done <= 1;
            enable <= 1;
            dmem_addr_reg <= 16'hzzzz;
            dmem_din_reg <= 16'hzzzz;
            dmem_wen_reg <= 16'hzzzz;
        end
    end
*/
//WRITING TO A FILE
/*
always@(posedge clk)begin
      if ( clock_en  == 0 )begin
        //for (i = 0; i<16129; i=i+1) begin
          //$display("OUT %b", dram[i]);
          index <= index+1;
          dmem_addr_reg <= index;
          $fwrite(f,"%h\n",dmem_dout[7:0] ); //NOT DRAM < DMEM
          //end
      end
      if(index == 16129)begin
        $fclose(f);
        $finish;
      end
end
*/
endmodule
