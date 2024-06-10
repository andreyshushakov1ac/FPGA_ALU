module deshifrALU
(
input [12:0] binary_in, 
output reg[6:0] decoder_out1, decoder_out2, decoder_out3
);


always @ (*)
begin

decoder_out1 = 0;
case (binary_in[3:0])
4'b0000 : decoder_out1 = ~7'b0111111;
4'b0001 : decoder_out1 = ~7'b0000110;
4'b0010 : decoder_out1 = ~7'b1011011;
4'b0011 : decoder_out1 = ~7'b1001111;
4'b0100 : decoder_out1 = ~7'b1100110;
4'b0101 : decoder_out1 = ~7'b1101101;
4'b0110 : decoder_out1 = ~7'b1111101;
4'b0111 : decoder_out1 = ~7'b0000111;
4'b1000 : decoder_out1 = ~7'b1111111;
4'b1001 : decoder_out1 = ~7'b1101111;
4'b1010 : decoder_out1 = ~7'b1110111;
4'b1011 : decoder_out1 = ~7'b1111100;
4'b1100 : decoder_out1 = ~7'b0111001;
4'b1101 : decoder_out1 = ~7'b1011110;
4'b1110 : decoder_out1 = ~7'b1111011;
4'b1111 : decoder_out1 = ~7'b1110001;
endcase

decoder_out2 = 0;
case (binary_in[7:4])
4'b0000 : decoder_out2 = ~7'b0111111;
4'b0001 : decoder_out2 = ~7'b0000110;
4'b0010 : decoder_out2 = ~7'b1011011;
4'b0011 : decoder_out2 = ~7'b1001111;
4'b0100 : decoder_out2 = ~7'b1100110;
4'b0101 : decoder_out2 = ~7'b1101101;
4'b0110 : decoder_out2 = ~7'b1111101;
4'b0111 : decoder_out2 = ~7'b0000111;
4'b1000 : decoder_out2 = ~7'b1111111;
4'b1001 : decoder_out2 = ~7'b1101111;
4'b1010 : decoder_out2 = ~7'b1110111;
4'b1011 : decoder_out2 = ~7'b1111100;
4'b1100 : decoder_out2 = ~7'b0111001;
4'b1101 : decoder_out2 = ~7'b1011110;
4'b1110 : decoder_out2 = ~7'b1111011;
4'b1111 : decoder_out2 = ~7'b1110001;
endcase

//decoder_out3 = ~7'b0111111;
if (binary_in[8]== 1'b1) //перенос 1 в самый старший раряд для сумматора
decoder_out3 = ~7'b0000110;

  else   if (binary_in[9]== 1'b1) // знак минус
	begin
  decoder_out3 = ~7'b1000000;
  
	end
  
 else   if (binary_in[10]==1'b1) //=
decoder_out3 = ~7'b1000001; //~7'b1000001;

	else	if (binary_in[11]==1'b1) //>
decoder_out3 = ~7'b1000011 ;

	else if (binary_in[12]==1'b1) //<
decoder_out3 = ~7'b1100001 ;

	else decoder_out3 = ~7'b0111111;

end


/*
deshifr seven4
(
	.binary_in (binary_in[3:0]),
	.decoder_out (decoder_out1)
);	

deshifr seven5
(
	.binary_in (binary_in[7:4]),
	.decoder_out (decoder_out2)
);	

*/


endmodule
