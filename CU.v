module CU(
	input startX, startY, clk, rst,
	input[1:0] sel,
	output reg [1:0] y,
	output reg [2:0] s,
	//output reg ldX, clrX, ldY, clrY, ldZ, clrZ, done
	output reg ldX,clrX,ldY,clrY,done
	);
	
	reg[1:0] Y;
	parameter[1:0] S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;
	
	always@(posedge rst, posedge clk) begin
		if (rst == 1) y <= S0;
		else y<=Y;
	end
		
	always@(y,startX,startY,sel)
	begin
		case(y)
			S0: Y <= S1; 
			S1: if (startX==1) Y <= S2;
				 else Y <= S0;
			S2: if (startY==1) Y <= S3;
				 else Y <= S2;
			S3: Y<= S1;
					
			default:Y<=S0;
			//S3: Y <= S1;
		endcase
	end
	
	always@(y,startX, startY,sel)
	begin
		//{ldX, clrX, ldY, clrY, ldZ, clrZ, done} = 0;
		{ldX,clrX,ldY,clrY,done}=0;
		//s = 2'bxx;
		case(y)
			S0: begin 
					//ldX=0; clrX=1; ldY=0; clrY=1; ldZ=0; clrZ=1; done=0;
					ldX=0; clrX=1; ldY=0; clrY=1; done=0;s = 3'b100;
				 end
			S1: if (startX==1) begin
					//ldX=1; clrX=0; ldY=1; clrY=0; ldZ=0; clrZ=0; done=0;
					ldX=1; clrX=0; ldY=0; clrY=0; done=0;s = 3'b100;
				 end
			S2: if (startY==1) begin
					//ldX=1; clrX=0; ldY=1; clrY=0; ldZ=0; clrZ=0; done=0;
					ldX=0; clrX=0; ldY=1; clrY=0; done=0;s = 3'b101;
				 end
			S3: case(sel)
					2'b00: begin
								//ldX=1; clrX=0; ldY=1; clrY=0; ldZ=1; clrZ=0; done=1;
								ldX=0; clrX=0; ldY=0; clrY=0; done=1;
								s = 3'b000;
						    end
					2'b01: begin
								//ldX=1; clrX=0; ldY=1; clrY=0; ldZ=1; clrZ=0; done=1;
								ldX=0; clrX=0; ldY=0; clrY=0; done=1;
								s= 3'b001;
						    end
					2'b10: begin
								//ldX=1; clrX=0; ldY=1; clrY=0; ldZ=1; clrZ=0; done=1;
								ldX=0; clrX=0; ldY=0; clrY=0; done=1;
								s = 3'b010;
						    end
					2'b11: begin
								//ldX=1; clrX=0; ldY=1; clrY=0; ldZ=1; clrZ=0; done=1;
								ldX=0; clrX=0; ldY=0; clrY=0; done=1;
								s = 3'b011;
						    end
				endcase
			//S3: begin done=1; ldZ=1; end
		endcase
	end
endmodule

			