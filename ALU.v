module ALU(
input [3:0] sel, 			//Entradas
input [31:0] OP1,OP2,	
output reg zf,			//Salidas
output reg [31:0] Res	
);

always @(sel,OP1,OP2)
	begin
		case(sel)	//Salidas
		
			// Aritmicas
			4'b0000: Res= OP1 + OP2;//Suma				
			4'b0001: Res= OP1 - OP2;//Resta				
			4'b0010: Res= OP1 * OP2;//Multiplicacion				
			4'b0011: Res= OP1 / OP2;//Division
					
			// Logicas
			4'b0100: Res= OP1 & OP2;//AND			
			4'b0101: Res= ~(OP1 & OP2);//NAND				
			4'b0110: Res= OP1 | OP2;//OR				
			4'b0111: Res= OP1 ^ OP2;//XOR
					
			4'b1000: Res= OP1 < OP2;//Menorque
			
			4'b1001: Res= OP1 == OP2;//"No iguales"
		endcase
		
		case(Res)		//zf
			
			32'b0: zf= 1;
				
			default: zf= 0;
			
		endcase
				
	end	

endmodule 