module decodern_2n #(parameter n = 4)(
	input [n-1:0]in,
	input en,
	output reg [(2**n)-1:0] y
);
	always@(*) begin
		y={ (2**n){1'b0} };
		if(en)
			y[in]=1'b1;
	end
endmodule