module Shift_Left_2(
//Entrada
input [31:0] Entrada_ShiftLesft,
//Salida
output reg[31:0] Salida_ShiftLesft
);

always @(*)
		Salida_ShiftLesft=Entrada_ShiftLesft<<2;
	
endmodule 