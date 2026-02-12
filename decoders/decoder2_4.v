module decoder2_4(
	input a, b,
	input en,
	output reg [3:0]y
);
	always@(a or b or en) begin
		if(en == 1) begin
			case({a, b})
			2'b00: y = 4'b0001;
			2'b01: y = 4'b0010;
			2'b10: y = 4'b0100;
			2'b11: y = 4'b1000;
		end
		else
			y = 4'b0000;
	end
endmodule

