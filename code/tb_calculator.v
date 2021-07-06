`timescale 10ns/1ns
module tb_calculator();

  reg clk, rst, startX, startY, startS;
  reg [7:0] key;
  wire done;
  wire [2:0] y;
  wire [2:0] s;
  wire [7:0] Z;
  
  calculator dut (clk, rst, startX, startY, startS,key,done,y,s,Z);
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end
  
  initial begin
    clk=0;
    forever #10 clk=~clk;
  end
  
  initial begin
    rst=1;
    #10 rst=0; key=8'b10000100;
    #50 startX=1;
    #30 key=8'b01000100;
    #50 startY=1;
    #30 key=8'b10000001;
    #100 startS=1;
    #50 finish=1;
    #40 $finish;
  end
  
endmodule