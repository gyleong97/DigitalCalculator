module decoder (
  input clk,rst,
  input R1,R2,R3,R4,C1,C2,C3,C4,
  output [3:0] Xin_o, Yin_o,
  output reg [1:0] sel_o);
  
  wire [7:0] key;
  reg [3:0] out;
	
  assign key = {R1,R2,R3,R4,C1,C2,C3,C4};
  assign Xin_o = out;
  assign Yin_o = out;
	
  always @ (posedge clk) begin
      out <= out; sel_o <= sel_o;
      case (key)
        8'b10001000: out<=1;
        8'b10000100: out<=2;
        8'b10000010: out<=3;
        8'b01001000: out<=4;
        8'b01000100: out<=5;
        8'b01000010: out<=6;
        8'b00101000: out<=7;
        8'b00100100: out<=8;
        8'b00100010: out<=9;
        8'b00010100: out<=0;
        
        8'b10000001: sel_o<=2'b00;
        8'b01000001: sel_o<=2'b01;
        8'b00100001: sel_o<=2'b10;
        8'b00010001: sel_o<=2'b11;
      endcase
    end
endmodule

				
			