//dataflow
module full_subtractor(
	input a, b, c,
	output diff, br
);
	assign diff = a ^ b ^ c;
	assign br = (~a & b) | (~(a ^ b) & c);
endmodule

//structural
module full_subtractor(
	input a, b, c,
	output diff, br
);
	wire d1, b1, b2;
	half_subtractor ha1(a, b, d1, b1);
	half_subtractor ha2(d1, c, diff, b2);
	assign br = b1 | b2;
endmodule

module half_subtractor(
	input a, b,
	output diff, br
);
	assign diff = a ^ b;
	assign br = ~a & b;
endmodule