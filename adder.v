module adder
(
  input clk,
  input wire [7:0] x,
  input wire [7:0] y,
  output [12:0] cadd
 
);
//wire carry; 
wire [12:0] add;
//wire [7:0] Csum,
//wire Ccarry;


//always @ (posedge clk) 
//begin
assign add[12:9] = 0;
assign add[8:0] = x+y;
//assign {Ccarry, Csum} = x + y;
//assign add = {Ccarry, Csum} ;
//end

d_t8 regifst0
(
	.clk (clk),
	.d (add[7:0]),
	.q (cadd[7:0])
);

d_t4 tffggg
(
.clk (clk),
.d (add[11:8]),
.q (cadd[11:8])
);

d_flip_flop d_0g
(
.clk (clk),
.d (add[12]),
.q (cadd[12])
);
 

endmodule
