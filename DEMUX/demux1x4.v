module demux1x4(
	input d, s0, s1,
	output y0, y1, y2, y3
);
	assign y0 = d & (~s1) & (~s0);
	assign y1 = d & (~s1) & (s0);
	assign y2 = d & (s1) & (~s0);
	assign y3 = d & (s1) & (s0);
endmodule