module PC(
// Entradas
input clk,
input [8:0]Entrada_1,
// Salidas
output reg[8:0]Salida_1

);

always @(posedge clk) 
	begin 
	
	Salida_1=Entrada_1;
	
	end 
	
initial
	begin 
	
	Salida_1=9'b0;
	
	end
	
endmodule 