module UC(
// Entrada
input [5:0]opcode,
// Salidas
	// Etapas .. asta WB
output reg EnWR_BR,En_MultiPlexor_br,Jump,
	// Etapas... asta MeM							
output reg EnWR_R_MemDatos,EnWR_w_MemDatos,Branch, 
	// Etapas...asta Ex
output reg En_MultiPlexor_w,En_MultiPlexor_ALU,
output reg [2:0]ALUC

);

always @(*)
	begin
		case(opcode)
					// Tipo R
		6'b000000: 	begin	
		
							// Etapas .. asta WB
							EnWR_BR=1;
							En_MultiPlexor_br=1;
							Jump=0;
							
							// Etapas... asta MeM		
							EnWR_R_MemDatos=0;
							EnWR_w_MemDatos=0;
							Branch=0;
							
							// Etapas...asta Ex
							En_MultiPlexor_w=1;
							En_MultiPlexor_ALU=0;
							ALUC=3'b010;	
							
						end
						
					// Tipos I
							
		6'b101011 : begin	// SW
		
							// Etapas .. asta WB
							EnWR_BR=0;
							//En_MultiPlexor_br=0;
							Jump=0;
							
							// Etapas... asta MeM
							EnWR_R_MemDatos=0;
							EnWR_w_MemDatos=1;
							Branch=0;
							
							// Etapas...asta Ex
							//En_MultiPlexor_w=1;
							En_MultiPlexor_ALU=1;
							ALUC=3'b000;
							
							
						end
		6'b100011: begin	// LW
		
							// Etapas .. asta WB
							EnWR_BR=1;
							En_MultiPlexor_br=0;
							Jump=0;
							
							// Etapas... asta MeM
							EnWR_R_MemDatos=1;
							EnWR_w_MemDatos=0;
							Branch=0;
							
							// Etapas...asta Ex
							En_MultiPlexor_w=0;
							En_MultiPlexor_ALU=1;
							ALUC=3'b000;
							
						end
					
		6'b001000: begin	// ADDI
							
							// Etapas .. asta WB
							EnWR_BR=1;
							En_MultiPlexor_br=1;
							Jump=0;
							
							// Etapas... asta MeM
							EnWR_R_MemDatos=0;
							EnWR_w_MemDatos=0;
							Branch=0;
							
							// Etapas...asta Ex
							En_MultiPlexor_w=0;
							En_MultiPlexor_ALU=1;
							ALUC=3'b000;
							
						end
		6'b001100: begin	// ANDI
							
							// Etapas .. asta WB
							EnWR_BR=1;
							En_MultiPlexor_br=1;
							Jump=0;
							
							// Etapas... asta MeM
							EnWR_R_MemDatos=0;
							EnWR_w_MemDatos=0;
							Branch=0;
							
							// Etapas...asta Ex
							En_MultiPlexor_w=0;
							En_MultiPlexor_ALU=1;
							ALUC=3'b011;
							
						end
		6'b001111: begin	// ORI
							
							// Etapas .. asta WB
							EnWR_BR=1;
							En_MultiPlexor_br=1;
							Jump=0;
							
							// Etapas... asta MeM
							EnWR_R_MemDatos=0;
							EnWR_w_MemDatos=0;
							Branch=0;
							
							// Etapas...asta Ex
							En_MultiPlexor_w=0;
							En_MultiPlexor_ALU=1;
							ALUC=3'b100;
							
						end
		6'b001010: begin	// SLTI
							
							// Etapas .. asta WB
							EnWR_BR=1;
							En_MultiPlexor_br=1;
							Jump=0;
							
							// Etapas... asta MeM
							EnWR_R_MemDatos=0;
							EnWR_w_MemDatos=0;
							Branch=0;
							
							// Etapas...asta Ex
							En_MultiPlexor_w=0;
							En_MultiPlexor_ALU=1;
							ALUC=3'b101;
							
						end
		6'b000100 : begin	// BEQ
							
							// Etapas .. asta WB
							EnWR_BR=0;
							En_MultiPlexor_br=0;
							Jump=0;
							
							// Etapas... asta MeM
							EnWR_R_MemDatos=0;
							EnWR_w_MemDatos=0;
							Branch=1;
							
							// Etapas...asta Ex
							//En_MultiPlexor_w=1;
							En_MultiPlexor_ALU=0;
							ALUC=3'b001;
							
						end
		6'b000101: begin	// BNE
							
							// Etapas .. asta WB
							EnWR_BR=0;
							En_MultiPlexor_br=0;
							Jump=0;
							
							// Etapas... asta MeM
							EnWR_R_MemDatos=0;
							EnWR_w_MemDatos=0;
							Branch=1;
							
							// Etapas...asta Ex
							//En_MultiPlexor_w=1;
							En_MultiPlexor_ALU=0;
							ALUC=3'b110;
							
						end
						
					// Tipos J
					
		6'b000010: begin	// J
							
							// Etapas .. asta WB
							//EnWR_BR=0;
							//En_MultiPlexor_br=0;
							Jump=1;
							
							// Etapas... asta MeM
							//EnWR_R_MemDatos=0;
							//EnWR_w_MemDatos=0;
							//Branch=0;
							
							// Etapas...asta Ex
							//En_MultiPlexor_w=1;
							//En_MultiPlexor_ALU=1;
							//ALUC=3'b000;
							
						end
						
		endcase 
	end 
endmodule 