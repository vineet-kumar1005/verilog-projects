module half_subtractor(
	input a, b,
	output diff, br
);
	assign diff = a ^ b;
	assign br = ~a & b;
endmodule