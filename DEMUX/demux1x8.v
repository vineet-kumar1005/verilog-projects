module demux1x4(
	input d, s0, s1,
	output y0, y1, y2, y3
);
	assign y0 = d & (~s1) & (~s0);
	assign y1 = d & (~s1) & (s0);
	assign y2 = d & (s1) & (~s0);
	assign y3 = d & (s1) & (s0);
endmodule

module demux1x2(
	input d, s0,
	output y0, y1
);
	assign y0 = d & (~s0);
	assign y1 = d & (s0);
endmodule

module demux1x8(
	input d, s0, s1, s2,
	output y0, y1, y2, y3, y4, y5, y6, y7
);
	wire w1, w2;
	demux1x2 d1(d, s2, w1, w2);
	demux1x4 d2(d, s1, s0, y0, y1, y2, y3);
	demux1x4 d3(d, s1, s0, y4, y5, y6, y7);
endmodule