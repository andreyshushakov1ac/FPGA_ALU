module d_t8
(
input clk, 
input [7:0] d,
output [7:0] q
);
d_t4 regist0
(
	.clk (clk),
	.d (d[3:0]),
	.q (q[3:0])
);
d_t4 regist1
(
	.clk (clk),
	.d (d[7:4]),
	.q (q[7:4])
);
endmodule 