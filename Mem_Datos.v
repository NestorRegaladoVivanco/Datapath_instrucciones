module Mem_Datos (
// Entradas
input	[31:0]Direccion,
input [31:0]Dato_entrada,
input Entrada_Escribir,Entrada_Leer,
//Salida
output reg[31:0]Dato_salida

);

reg [31:0] Dato[0:127];	

always @(*)
	begin
		if(Entrada_Escribir)
			Dato[Direccion]<=Dato_entrada;
			
		if(Entrada_Leer)	
		Dato_salida<=Dato[Direccion];
		
	end

endmodule 