module lab5ALU
#(
parameter WIDTH = 8
)
(
input clk,
input [WIDTH - 1:0] x, y, //8b числа на вход
output reg [6:0] inx1, inx2, iny1, iny2, //их же на семисегмент
input [2:0] sel, //выбор операций: 1.сравнение (cmp), 2.сложение (adder), 3.вычитание  (subt)
output  [6:0] res1, res2, res3 //результат на семисегменты
);
wire [15:0] in;
wire [12:0] ALUtemp;  //wire [2:0] ALUtemp;
wire [12:0] ALUadd; //wire [7:0] ALUsum; //wire ALUcarry;
wire [12:0] ALUsubt;  //wire [7:0] ALUsubt; //wire ALUminus;
reg [12:0] outMux;




d_t8 regist0
(
	.clk (clk),
	.d (x),
	.q (in[7:0])
);
d_t8 regist1
(
	.clk (clk),
	.d (y),
	.q (in[15:8])
);


deshifr seven0oim
(
	.binary_in (in[3:0]),
	.decoder_out (inx1)
);	
deshifr seven0r
(
	.binary_in (in[7:4]),
	.decoder_out (inx2)
);	
deshifr seven0kjh
(
	.binary_in (in[11:8]),
	.decoder_out (iny1)
);	
deshifr seven1
(
	.binary_in (in[15:12]),
	.decoder_out (iny2)
);	

/////////////////////////////////

cmpIN16bOUT7b cmp0 
(
   .clk (clk),
	.in (in[15:0]),
	.ctemp (ALUtemp[12:0])
);	

adder ad0
(
   .clk (clk),
	.x (in[7:0]),
	.y (in[15:8]),
	.cadd (ALUadd[12:0]),
);

subt vfvdf
(
   .clk (clk),
	//.in (in[15:0]),
	.x (in[7:0]),
	.y (in[15:8]),
	.Csubt (ALUsubt[12:0]),
);

///////////////////////////

always @(posedge clk)
	case (~sel)   
		3'b000: outMux = 0;
		3'b001: outMux = ALUtemp;
		3'b010: outMux = ALUadd;
		3'b100: outMux = ALUsubt;
	endcase

deshifrALU ghghfj
(
	.binary_in (outMux),
	.decoder_out1 (res1),
	.decoder_out2 (res2),
	.decoder_out3 (res3)
);




/*
always @(posedge clk)
begin

if (sel == 3'b001) 
begin
deshifrCMP sevfen2
(
	.binary_in (ctemp),
	.decoder_out1 (res1),
	.decoder_out2 (res2),
	.decoder_out3 (res3),
	.decoder_out4 (res4)
);		
end


else if (sel == 3'b010)
begin
deshifradd sevefn3
(
	.binary_in (ALUsum),
	.binary_inn (ALUcarry),
	.decoder_out1 (res1),
	.decoder_out2 (res2),
	.decoder_out3 (res3),
	.decoder_out4 (res4)
);		
end


else if (sel == 3'b100)
begin
deshifrsubt seveffn3
(
	.binary_in (ALUsubt),
	.binary_inn (ALUminus),
	.decoder_out1 (res1),
	.decoder_out2 (res2),
	.decoder_out3 (res3),
	.decoder_out4 (res4)
);		
end


end
*/



endmodule
