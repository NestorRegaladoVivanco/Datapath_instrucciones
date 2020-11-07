module ALU_Control(
//Entradas
input [2:0]ALUC_aluc,
input [5:0]funct_aluc,
//Salida
output reg[3:0]Selector_aluc

);

always @(*)
	begin
		case (ALUC_aluc)
	// Tipo R
			3'b010:begin 
						case (funct_aluc)
							//Aritmeticas
							6'b100_000:Selector_aluc=4'b0000;	//Suma
							6'b100_010:Selector_aluc=4'b0001;	//Resta
							6'b011_000:Selector_aluc=4'b0010;	//Multiplicacion
							6'b011_010:Selector_aluc=4'b0011;	//Divicion
							//Logicas
							6'b100_100:Selector_aluc=4'b0100;	//AND
							6'b100_101:Selector_aluc=4'b0110;	//OR
							6'b100_110:Selector_aluc=4'b0111;	//XOR
							
							6'b101_010:Selector_aluc=4'b1000;	//slt
						endcase 
						
					end
	// Tipo I
			3'b000:Selector_aluc=4'b0000;	// Suma
							
			3'b001:Selector_aluc=4'b0001;	// Resta
						
			3'b011:Selector_aluc=4'b0100;	// AND
						
			3'b100:Selector_aluc=4'b0110;	// OR
		
			3'b101:Selector_aluc=4'b1000;	// slt
	
			3'b110:Selector_aluc=4'b1001;	// No iguales

		endcase 
	end 
endmodule 