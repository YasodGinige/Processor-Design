`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2022 09:07:44 PM
// Design Name: 
// Module Name: processor
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

parameter LEN_IRAM = 10;
reg clk;

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
//
reg [15:0] ir;
reg enable;
reg [15:0] iram [LEN_IRAM:0];
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
wire [15:0] dmem_wen;
wire [15:0]imem_addr_pc;


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
    .enable(enable)  
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
    // mar,
    // mdr,
    .pr1(pr1_wen ),
    .pr2(pr2_wen ),
    .pr3(pr3_wen )
    // col,
    // row,
    // r1,
    // r2
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
                     //  input [15:0] mdr,
          .pr1(pr1_A),
          .pr2(pr2_A),
          .pr3(pr3_A),
                     //  input [15:0] col,
                     //  input [15:0] row,
                     //  input [15:0] r1,
                     //  input [15:0] r2,                  
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
                     //  input [15:0] mdr,
          .pr1(pr1_B),
          .pr2(pr2_B),
          .pr3(pr3_B),
                     //  input [15:0] col,
                     //  input [15:0] row,
                     //  input [15:0] r1,
                     //  input [15:0] r2,                  
           .dout(b_bus));   

//INSTRUCTION MEMORY INSTANTIATION
imem_ram #(.DWIDTH(16), .ADDR_WIDTH(16))IMEM(
                .din(imem_din),
                .we(imem_wen),
                .addr(imem_addr ),
                .clk(clk),
                .dout(imem_dout)
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

generic_reg PR3(
        .clk(clk),
        .writeC(pr3_wen),
        .D(c_bus),
        .A(pr3_A),
        .B(pr3_B)
);

//CLOCK GENERATION
initial begin
    clk = 1; 
    forever begin
        #10 clk = ~clk;
        end 
    end
    
reg [15:0] c_bus_reg;
reg [15:0] pr1_wen_reg;
reg [15:0] pr2_wen_reg;
reg [15:0] imem_addr_reg;
reg [15:0] imem_din_reg;
reg [15:0] imem_dout_reg;
reg imem_wen_reg;

reg iload_done = 0;

//assign c_bus = c_bus_reg;
//assign pr1_wen = pr1_wen_reg;
//assign pr2_wen = pr2_wen_reg;
assign imem_addr = (~iload_done) ? imem_addr_reg:imem_addr_pc;
assign imem_din = imem_din_reg;
//assign imem_wen = (~iload_done) ? imem_wen_reg:(~imem_read);
assign imem_wen = imem_wen_reg;

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
initial begin
    enable = 0;
    $readmemh("imem.mem",iram); // read file from INFILE
    imem_wen_reg = 1;       
    imem_addr_reg = -1;
end


always@(posedge clk)begin
    if(~iload_done)begin
        imem_addr_reg = imem_addr_reg +1;
        imem_din_reg = iram[imem_addr_reg];
        end
        if (imem_addr_reg == LEN_IRAM+1)begin        //array length counted from 1
            iload_done = 1;
            enable = 1;
            imem_addr_reg = 16'hzzzz;
            imem_din_reg = 16'hzzzz;
            imem_wen_reg = 16'h0000;
            end
    end

endmodule