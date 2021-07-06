module calculator(
	input clk, rst, startX, startY, startS,
	input Ri1,Ri2,Ri3,Ri4,Ci1,Ci2,Ci3,Ci4,
	output done,
	output[2:0] y,
	output[2:0] s,
	output[7:0] Z,
	output[6:0] segment1,segment2,
	output Ro1,Ro2,Ro3,Ro4
	);

	wire [3:0] Xin,Yin;
	wire [1:0] sel;
	wire ldX,ldY,clrX,clrY;
	wire clkout;
	
		
	decoder_prescaler u7(.clkin(clk),.clkout(clkout));
	
	DU u1(.clk(clk),.rst(rst),.ldX(ldX),.ldY(ldY),
			.clrX(clrX),.clrY(clrY),.s(s),
			.Xin(Xin),.Yin(Yin),.Z(Z));
			
	CU u2(.startX(startX),.startY(startY),
			.startS(startS),.clk(clk),.rst(rst),
			.sel(sel),.y(y),.s(s),.ldX(ldX), .clrX(clrX), 
			.ldY(ldY), .clrY(clrY),.done(done));
	
	pulser u3(.clk(clkout), .rst(rst),.R1(Ro1),
				 .R2(Ro2), .R3(Ro3), .R4(Ro4));
		
	decoder u4 (
		.clk(clkout),.rst(rst),
		.R1(Ri1),.R2(Ri2),.R3(Ri3),.R4(Ri4),
		.C1(Ci1),.C2(Ci2),.C3(Ci3),.C4(Ci4),
		.Xin_o(Xin),.Yin_o(Yin),.sel_o(sel));
	
	hexseg u5(
		.in(Z),.segment1(segment1),.segment2(segment2));	
endmodule
