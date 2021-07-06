module DU (
  input clk,rst,ldX,ldY,clrX,clrY,
  input[2:0] s,
  input [3:0] Xin,Yin,
  output [7:0] Z);
		
  reg [7:0] ALUout;
  reg [3:0] Yout,Xout;
	
  always @ (posedge clk, posedge rst) begin
    if (rst) Xout <= 0;
    else if (clrX) Xout <= 0;
    else if (ldX) Xout <= Xin; 
    else Xout <= Xout;
  end
	
  always @ (posedge clk, posedge rst) begin
    if (rst) Yout <= 0;
    else if (clrY) Yout <= 0; 
    else if (ldY) Yout <= Yin; 
    else Yout <= Yout;
  end	
	
  always @ (Xout,Yout,s)
    case (s)
      3'b000:  ALUout = Xout + Yout; 
      3'b001:  ALUout = Xout - Yout;
      3'b010:  ALUout = Xout * Yout;
      3'b011:  ALUout = Xout / Yout;
      3'b100:	ALUout = Xout;
      3'b101:	ALUout = Yout;
    endcase
	
  assign Z = ALUout;
endmodule
