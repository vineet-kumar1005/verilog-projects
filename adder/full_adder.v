//dataflow
module full_adder(
	input a, b, c,
	output s, cout
);
	assign s = a ^ b ^ c;
	assign cout = (a & b) | (b & c) | (c & a); 
endmodule


//structural
module full_adder(
	input a, b, c,
	output s, cout
);
	wire s1, c1, c2;
	half_adder ha1(a, b, s1, c1);
	half_adder ha2(c, s1, s, c2);
	
	assign cout = c1 | c2;
endmodule

module half_adder(
	input a, b,
	output s, c
);
	assign s = a ^ b;
	assign c = a & b;
endmodule
