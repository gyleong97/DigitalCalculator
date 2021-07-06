module decoder_prescaler(input clkin, output clkout);

	reg[25:0] count;
	always@(posedge clkin)
		count <= count +1;
		
	assign clkout=count[23];
endmodule
