module BR(
// Entadas
input	[4:0] Direccion_1,Direccion_2,Direccion_a_escribir,
input [31:0]Escribir_Dato,
input Entrada_WoR,clk,
// Salida
output reg[31:0]Leer_direccion_1,Leer_direccion_2

);
	
reg [31:0] Dato[0:31];	

always @(negedge clk)
	begin
		case(Entrada_WoR)
			1:Dato[Direccion_a_escribir]<=Escribir_Dato;
		endcase 
		
		Leer_direccion_1<=Dato[Direccion_1];
		Leer_direccion_2<=Dato[Direccion_2];
		
	end

initial 
		begin
			$readmemb("BancoRegistros.mif",Dato);
		end 
		
endmodule 