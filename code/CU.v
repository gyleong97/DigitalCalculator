module CU(
  input startX, startY, startS, clk, rst,
  input[1:0] sel,
  output reg [2:0] y,
  output reg [2:0] s,
  output reg ldX,clrX,ldY,clrY,done);
	
  reg[2:0] Y;
  parameter[2:0] S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;
	
  always@(posedge rst, posedge clk) 
    begin if (rst == 1) y <= S0; else y<=Y;end
		
  always@(y,startX,startY,startS,sel) begin
    case(y)
      S0: Y <= S1; 
      S1: if (startX==1) Y <= S2; else Y <= S0;
      S2: if (startY==1) Y <= S3; else Y <= S2;
      S3: if (startS==1) Y <= S4; else Y <= S3;
      S4: Y <= S1;
      default:Y<=S0;
    endcase
  end
	
  always@(y,startX, startY, startS, sel) begin
    {ldX,clrX,ldY,clrY,done}=0;
    case(y)
      S0: begin ldX=0; clrX=1; ldY=0; clrY=1; done=0;s = 3'b100; end
      S1: if (startX==1) begin ldX=1; clrX=0; ldY=0; clrY=0; done=0;s = 3'b100; end
      S2: if (startY==1) begin ldX=0; clrX=0; ldY=1; clrY=0; done=0;s = 3'b101; end
      S3: if (startS ==1)
        case(sel)
          2'b00: begin ldX=0; clrX=0; ldY=0; clrY=0; done=0;s = 3'b000; end
          2'b01: begin ldX=0; clrX=0; ldY=0; clrY=0; done=0;s = 3'b001; end
          2'b10: begin ldX=0; clrX=0; ldY=0; clrY=0; done=0;s = 3'b010; end
          2'b11: begin ldX=0; clrX=0; ldY=0; clrY=0; done=0;s = 3'b011; end
        endcase
      S4: begin ldX=0; clrX=0; ldY=0; clrY=0; done=1; end
    endcase
  end
endmodule
			