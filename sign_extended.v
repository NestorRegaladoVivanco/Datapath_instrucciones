module sign_extended(
//Entrada
input [15:0] Entrada16b,
//Salida
output reg[31:0] Salida32b
);

always @(*)
		Salida32b={{16{Entrada16b[15]}},Entrada16b};
	
endmodule 