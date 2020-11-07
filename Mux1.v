module Mux1(
//Entradas
input [31:0] Entrada_0,Entrada_1,
input En_MultiPlexor,
//Salida
output reg[31:0] Salida

);

always @(*)
	begin
		case (En_MultiPlexor)
			// Entra Memoria de Datos
			0:Salida=Entrada_0;	
			
			//	Entra Resultado de ALU
			1:Salida=Entrada_1;
		
		endcase
	end 
	
endmodule 