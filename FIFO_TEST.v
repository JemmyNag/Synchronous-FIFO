`timescale 1ns / 1ps

module FIFO_TEST();
reg clk;
reg [3:0]d_in;
reg wen;
reg ren;
reg rst;
wire [3:0]d_out;
wire m_em;
wire m_full;
initial rst = 1'b0;
initial clk = 1'b0;
FIFO f1(.clk(clk),.data_in(d_in),.data_out(d_out),.wt_en(wen),.rd_en(ren),.rst(rst),.mem_empty(m_em),.mem_full(m_full));
initial
forever #10 clk=~clk;
initial
    begin
        wen = 1'b1; ren = 1'b0;
    #20 d_in = 4'b0000;
    #20 d_in = 4'b0011;
    #20 d_in = 4'b0110;
    #20 d_in = 4'b1000;
    #20 d_in = 4'b0010;
    #20 d_in = 4'b0100;
    #20 d_in = 4'b1010;
    #20 d_in = 4'b0111;
    #20 d_in = 4'b1011;
    #20 d_in = 4'b0110;
    #20 d_in = 4'b1000;
    #20 d_in = 4'b0010;
    #20 d_in = 4'b0100;
    #20 d_in = 4'b1010;
    #20 d_in = 4'b0111;
    #20 d_in = 4'b1011;
    #20 wen = 1'b0;
    #20 ren = 1'b1;
    #500 rst = 1'b1;
    end
initial
#2000 $finish;                         
endmodule
