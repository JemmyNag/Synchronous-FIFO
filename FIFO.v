`timescale 1ns / 1ps

module FIFO(data_in,wt_en,rd_en,clk,rst,data_out,mem_empty,mem_full);
input [3:0]data_in,wt_en,rd_en,clk,rst;
output reg [3:0]data_out;
output mem_empty,mem_full;
reg [3:0]mem[0:15];
reg count;
integer write_p=0;
integer read_p=0;

assign mem_full = ( (write_p == 16) & (read_p == 0) ? 1 : 0 );
assign mem_empty = ( (write_p == 0) & (read_p == 0) ? 1 : 0 );
  
always@(posedge clk)
    begin
    if(wt_en || (wt_en & !mem_full))
      begin
      mem[write_p] = data_in;
      write_p =write_p+1;
      end
    if(rd_en || (rd_en & !mem_empty))
      begin
      data_out = mem[read_p];
      read_p = read_p+1;      
      end
end
always@(posedge clk)
begin
     if(rst)
     begin
         write_p <= 0;
         read_p <= 0;   
     end
end 
always@(posedge clk)
begin
    if(mem_full)
        $display("Memory Full");
end                         
endmodule
