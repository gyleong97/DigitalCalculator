module pulser(
	input clk, rst,
	output reg R1,R2,R3,R4);
	
	reg [1:0] counter;
	
	always @(posedge rst, posedge clk)
		if (rst == 1) counter <= 0;
		else if (counter == 2'b11) counter <= 0;
		else counter <= counter + 1;
		
	always@(counter)
		case (counter)			
			2'b00: {R1,R2,R3,R4} = 4'b1000;
			2'b01: {R1,R2,R3,R4} = 4'b0100;
			2'b10: {R1,R2,R3,R4} = 4'b0010;
			2'b11: {R1,R2,R3,R4} = 4'b0001;
		endcase
endmodule
