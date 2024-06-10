module subt
(
  input clk,
  //input  [15:0] in,
  input   [7:0] x,
  input   [7:0] y,
  output [12:0] Csubt
);
reg [7:0] wsubt;
wire dev;
//wire [7:0] dev1; 
//wire [15:0] xy;

/*
d_t8 regifst0
(
	.clk (clk),
	.d (subt[7:0]),
	.q (wsubt[7:0])
); 

d_flip_flop d_0g
(
.clk (clk),
.d (subt[9]),
.q (dev)
); */

/*
d_t4 tffggg
(
.clk (clk),
.d (subt[11:8]),
.q (Csubt[11:8])
);

d_flip_flop d_0gvdzh
(
.clk (clk),
.d (subt[12]),
.q (Csubt[12])
); */

assign Csubt[8] = 1'b0;
assign Csubt[12:10] = 3'b000;

//assign Csubt[7:0]= x-y;
assign dev = (x < y);



always @ (*)
begin
if (dev==1'b1) wsubt= y-x;
else  wsubt= x-y; 
end

d_flip_flop d_0g
(
.clk (clk),
.d (dev),
.q (Csubt[9])
); 

d_t8 regifst0
(
	.clk (clk),
	.d (wsubt),
	.q (Csubt[7:0])
); 
 
 //assign Csubt[7:0]= wsubt; // dev1;
 //assign  dev1= wsubt [7:0] ;
 
 /*
d_t8 regifst0fgn
(
	.clk (clk),
	.d (wsubt[7:0]),
	.q (Csubt[7:0])
); */

/*
d_t8 regifst0
(
	.clk (clk),
	.d (subt[7:0]),
	.q (Csubt[7:0])
);

d_t4 tffggg
(
.clk (clk),
.d (subt[11:8]),
.q (Csubt[11:8])
);

d_flip_flop d_0g
(
.clk (clk),
.d (subt[12]),
.q (Csubt[12])
);

*/





endmodule
