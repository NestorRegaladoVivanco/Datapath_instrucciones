module Buffer(
// Entradas
input clk,
input [31:0]Entrada_1,Entrada_2,Entrada_3,Entrada_4,Entrada_5,
				Entrada_6,Entrada_7,Entrada_8,Entrada_9,Entrada_10,
				Entrada_11,Entrada_12,Entrada_13,Entrada_14,Entrada_15,
				Entrada_16,
// Salidas
output reg[31:0]	Salida_1,Salida_2,Salida_3,Salida_4,Salida_5,
						Salida_6,Salida_7,Salida_8,Salida_9,Salida_10,
						Salida_11,Salida_12,Salida_13,Salida_14,Salida_15,
						Salida_16
);

always @(posedge clk) 
	begin 
	Salida_1=Entrada_1;
	
	Salida_2=Entrada_2;
	
	Salida_3=Entrada_3;
	
	Salida_4=Entrada_4;
	
	Salida_5=Entrada_5;
	
	Salida_6=Entrada_6;
	
	Salida_7=Entrada_7;
	
	Salida_8=Entrada_8;
	
	Salida_9=Entrada_9;
	
	Salida_10=Entrada_10;
	
	Salida_11=Entrada_11;
	
	Salida_12=Entrada_12;
	
	Salida_13=Entrada_13;
	
	Salida_14=Entrada_14;
	
	Salida_15=Entrada_15;
	
	Salida_16=Entrada_16;
	end 
endmodule 