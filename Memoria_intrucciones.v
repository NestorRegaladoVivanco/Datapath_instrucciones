module Memoria_intrucciones(
// Entadas
input	[8:0] Direccion,
// Salida
output reg[31:0]Leer_Intruccion
);
	
reg [7:0] Instrucciones[0:511];	

always @(*)
	begin

		Leer_Intruccion<={Instrucciones[Direccion],Instrucciones[Direccion+1],Instrucciones[Direccion+2],Instrucciones[Direccion+3]};
		
	end

	initial 
		begin
			$readmemb("Intrucciones.mif",Instrucciones);
		end 
		
endmodule 