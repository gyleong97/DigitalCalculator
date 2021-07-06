module hexseg(
	input[7:0] in,
	output reg[6:0] segment1,
	output reg[6:0] segment2
	);
	
	reg[3:0]digit1,digit2;
	
	always@(in) begin 
		digit2 =in/10;
		digit1=in%10;end
		
	always @(digit1,segment1)
		begin
			case (digit1)
				4'b0000: segment1 <= 7'b1000000; //0
				4'b0001: segment1 <= 7'b1111001; //1
				4'b0010: segment1 <= 7'b0100100; //2
				4'b0011: segment1 <= 7'b0110000; //3
				4'b0100: segment1 <= 7'b0011001; //4
				4'b0101: segment1 <= 7'b0010010; //5
				4'b0110: segment1 <= 7'b0000010; //6
				4'b0111: segment1 <= 7'b1111000; //7
				4'b1000: segment1 <= 7'b0000000; //8
				4'b1001: segment1 <= 7'b0010000; //9
				default:  segment1 <= 7'b0111111; //-
			endcase
		end
	
	always @(digit2,segment2)
		begin
			case (digit2)
				4'b0000: segment2 <= 7'b1000000; //0
				4'b0001: segment2 <= 7'b1111001; //1
				4'b0010: segment2 <= 7'b0100100; //2
				4'b0011: segment2 <= 7'b0110000; //3
				4'b0100: segment2 <= 7'b0011001; //4
				4'b0101: segment2 <= 7'b0010010; //5
				4'b0110: segment2 <= 7'b0000010; //6
				4'b0111: segment2 <= 7'b1111000; //7
				4'b1000: segment2 <= 7'b0000000; //8
				4'b1001: segment2 <= 7'b0010000; //9
				default:  segment2 <= 7'b0111111; //-
			endcase
		end

endmodule
