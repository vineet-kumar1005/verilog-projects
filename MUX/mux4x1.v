module mux4x1(
	input i0, i1, i2, i3, s0, s1,
	output y
);
	wire s0bar, s1bar;
	wire and0, and1, and2, and3;
	not(s0bar, s0);
	not(s1bar, s1);

	and(and0, i0, s0bar, s1bar);
	and(and1, i1, s0bar, s1);
	and(and2, i2, s0, s1bar);
	and(and3, i3, s0, s1);
	or(y, and0, and1, and2, and3);
endmodule