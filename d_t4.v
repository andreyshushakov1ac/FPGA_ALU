module d_t4
(
	input clk,
	input [3:0] d,
	output [3:0] q
);
d_flip_flop d_0
(
.clk (clk),
.d (d[0]),
.q (q[0])
);
d_flip_flop d_1
(
.clk (clk),
.d (d[1]),
.q (q[1])
);
d_flip_flop d_2
(
.clk (clk),
.d (d[2]),
.q (q[2])
);
d_flip_flop d_3
(
.clk (clk),
.d (d[3]),
.q (q[3])
);
endmodule