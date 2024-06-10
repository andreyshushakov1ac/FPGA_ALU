module cmpIN16bOUT7b //OK.
(
input clk,
input [15:0] in,
output [12:0] ctemp   //[2:0] ctemp
//output equal, greater, less
);
wire [12:0] temp;//, temp;





//always @ (posedge clk) 
//begin
assign temp[12:3] = 0;//10'b0;
assign temp[0] = (in[7:0] == in[15:8]);
assign temp[1] = (in[7:0] > in[15:8]);
assign temp[2] = (in[7:0] < in[15:8]);
//end


d_t8 tff
(
.clk (clk),
.d (temp[7:0]),
.q (ctemp[7:0])
);

d_t4 tffg
(
.clk (clk),
.d (temp[11:8]),
.q (ctemp[11:8])
);


d_flip_flop d_0
(
.clk (clk),
.d (temp[12]),
.q (ctemp[12])
);




/*

d_flip_flop d_0
(
.clk (clk),
.d (temp[0]),
.q (ctemp[0])//temp[0])
);
d_flip_flop d_1
(
.clk (clk),
.d (temp[1]),
.q (ctemp[1])//temp[1])
);
d_flip_flop d_2
(
.clk (clk),
.d (temp[2]),
.q (ctemp[2])//temp[2])
);

*/

/*
deshifrCMP seven2
(
	.binary_in (temp[0]),
	.decoder_out (equal)
);	
deshifrCMP seven3
(
	.binary_in (temp[1]),
	.decoder_out (greater)
);	
deshifrCMP seven4
(
	.binary_in (temp[2]),
	.decoder_out (less)
);	
*/


endmodule 