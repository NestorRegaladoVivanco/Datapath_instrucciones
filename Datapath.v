module Datapath(    
//Entrada
input clk,
//Salidas
	// intruccion
output [8:0]numero_intruccion,
output[31:0]intruccion,
	// Banco_Registros
output [4:0] Direccion_1,Direccion_2,Direccion_a_escribir,
output [31:0]Escribir_Dato,
output[31:0]Leer_direccion_1,Leer_direccion_2,
	//ALU
output [31:0]Entrada_ALU1,Entrada_ALU2,resultado,
output zero_flag,
	//Memoria de Datos
output [31:0] Direccion_MemDato,Escribir_MemDato
	
);

// ---------------Ciclo IF---------------------------------------
	// Cables de PC
wire[8:0]w1,w2; // Entrada pc - Salida pc

	// Cables de ALU_IF
wire [31:0]w3; // Resultado ALU_IF y Entrada 0 de Multiplexor_PC

	// Cables de Multiplexor_PC
wire[31:0]w4;	//Entrada 1
wire w5;			// Decide cual pasar

	// Cables de Memoria de intrucciones
wire [31:0] w6;	// Salida intruccion
//--------------Cliclo ID----------------------------------------
	// Cables del Buffer IF/ID
wire [31:0] w7;	// Resultado ALU_IF
wire [31:0] w8;	// Intruccion

	// Cables UC

		// Etapas .. asta WB
wire w9,w10;		// EnWR_BR - En_MultiPlexor_br
		// Etapas... asta MeM
wire w11,w12,w13;	// EnWR_R_MemDatos - EnWR_w_MemDatos - Branch
		// Etapas...asta Ex
wire w14,w15;		// En_MultiPlexor_w - En_MultiPlexor_ALU
wire [2:0] w16;	// ALUC
	
	// Cables BR	(no se utilizo---)
		//Entradas
//wire w17;			// Entrada_WoR  
//wire [5:0] w18;	// Direccion_a_escribir
//wire [31:0] w19;	// Escribir_Dato
		// Salidas
wire [31:0] w20,w21;	// Leer_direccion_1 - Leer_direccion_2

	// Cable Sign_Extended
wire [31:0] w22;// Salida
//--------------Cliclo EX----------------------------------------	
	// Cables del Buffer ID/EX
		// UC
			// Etapas... asta WB
wire w23;	// EnWR_BR
wire w24;	// En_MultiPlexor_br

			// Etapas... asta MeM
wire w25;	// EnWR_R_MemDatos
wire w26;	// EnWR_w_MemDatos
wire w27;	// Branch

			// Etapas...asta Ex
wire w28;	// En_MultiPlexor_w
wire w29;	// En_MultiPlexor_ALU
wire [2:0] w30;	// ALUC
	
		// ALU_IF
wire [31:0]w31;
		// Banco_de_Registros
wire [31:0] w32,w33; // Leer_direccion_1 - Leer_direccion_2
		// sign_extended
wire [31:0] w34;
		// Intrucion
wire [4:0] w35,w36;	// Direccion_2  Tipo I - Direccion_a_Escribir Tipo R
	
	// Multiplexor_BR
wire [4:0] w37; 	// Salida (Direccion_a_Escribir)

	// Multiplexor_ALU
wire [31:0] w38;	// Salida (OP2)
	
	// ALU_Control
wire [3:0] w39; // Selector

	// ALU
wire w40;			// zf
wire [31:0] w41;	// Res

	// Shift_Left_2
wire [31:0] w42;	// Salida_Shift_Left_2

	// ALU_Shift_Left_2
wire [31:0] w43; // Res_ALU_Shift_Left_2

//--------------Cliclo MeM----------------------------------------	
	// Buffer EX/MeM
		// UC
			// Etapas... asta WB
wire w44;	// EnWR_BR
wire w45;	// En_MultiPlexor_br
			// Etapas... asta MeM
wire w46;	// EnWR_R_MemDatos
wire w47;	// EnWR_w_MemDatos
wire w48;	// Branch

		// ALU_Shift_Left_2 ( no se utilizo)
//wire [31:0]w49; // Res

		// ALU
wire [31:0] w50;	 // Res
wire w51; 	// zf

		// BR
wire [31:0] w52;	// Leer_direccion_2

		// Multiplexor_BR
wire [4:0] w53; // Salida (Direccion_a_Escribir)

		// Memoria_Datos
wire [31:0] w54; // Salida

//--------------Cliclo WD----------------------------------------	
// Buffer EX/MeM
	// UC
		// Etapas... asta WB
wire w55;	// EnWR_BR
wire w56;	// En_MultiPlexor_br
		
	// Memoria_Datos	
wire [31:0]w57;	// Salida

	// ALU
wire [31:0]w58;	//Res

	// Multiplexor_BR
wire [4:0]w59;	// Salida

//	En_MultiPlexor_br
wire [31:0] w60;

// ALU_IF
wire [8:0] w61,w62,w63;// Extra-----

// Shift_Left_2_Jump
wire [27:0] w64,w65,w66,w67;
		    //-ID/EX--MEM--WB
wire			w68,w69,w70,w71;

// Observar----------------------------------------
//------------------intruccion---------------------
assign numero_intruccion = w2;
assign intruccion 	= w6;

// ------------------Banco_Registros---------------------
assign Direccion_1				=w8[25:21];
assign Direccion_2				=w8[20:16];
assign Direccion_a_escribir	=w59;
assign Escribir_Dato				=w60;
assign Leer_direccion_1			=w20;
assign Leer_direccion_2			=w21;


//----------------------ALU------------------------
assign Entrada_ALU1 	= w32;
assign Entrada_ALU2 	= w38;
assign resultado		= w41;
assign zero_flag		= w40;
//----------------Memoria de Datos-----------------
assign Direccion_MemDato= w50;
assign Escribir_MemDato= w52;	
//------------------------Instancias--------------------------------------------

PC PC(
// Entradas
.Entrada_1(w1),.clk(clk),
// Salidas
.Salida_1(w2)
);

ALU ALU_IF(
// Entradas
.OP1({23'd0,w2}),.OP2(32'd4),.sel(4'b0000),
// Salidas
.Res(w3)
);

Memoria_intrucciones Memoria_intrucciones(
// Entrada
.Direccion(w2),
// Salida
.Leer_Intruccion(w6)
);

Buffer Buffer_IFaID(
// Entradas
.clk(clk),
.Entrada_1(w3), 	// Entra Resultado ALU_IF
.Entrada_2(w6),	// Entra Intruccion
// Salidas----------------------------------------------------------------
.Salida_1(w7),		// Sale Resultado ALU_IF
.Salida_2(w8)		// Sale Intruccion
);

Shift_Left_2 Shift_Left_2_Jump(
//Entrada
.Entrada_ShiftLesft(w8[25:0]),
//Salida
.Salida_ShiftLesft(w64)
);

UC Unidad_de_Control(
// Entrada
.opcode(w8[31:26]),
// Salidas
	// Etapas... asta WB
.EnWR_BR(w9),.En_MultiPlexor_br(w10),.Jump(w68),
	// Etapas... asta MeM
.EnWR_R_MemDatos(w11),.EnWR_w_MemDatos(w12),.Branch(w13),
	// Etapas asta EX
.En_MultiPlexor_w(w14),.En_MultiPlexor_ALU(w15),.ALUC(w16)
);

BR Banco_de_Registros(
// Entradas
.clk(clk),
	//Leer
.Direccion_1(w8[25:21]),.Direccion_2(w8[20:16]),
	// Escribir
.Direccion_a_escribir(w59),.Escribir_Dato(w60),.Entrada_WoR(w55),
// Salidas
.Leer_direccion_1(w20),.Leer_direccion_2(w21)
);

sign_extended sign_extended(
// Entrada
.Entrada16b(w8[15:0]),
// Salida
.Salida32b(w22)

);

Buffer Buffer_IDaEX(
// Entradas----------------
.clk(clk),
	// UC
		// Etapas... asta WB
.Entrada_1(w9),	// EnWR_BR
.Entrada_2(w10),	// En_MultiPlexor_br
		// Etapas... asta MeM
.Entrada_3(w11),		// EnWR_R_MemDatos
.Entrada_4(w12),		// EnWR_w_MemDatos
.Entrada_5(w13),		// Branch
		// Etapas asta EX
.Entrada_6(w14),		// En_MultiPlexor_w
.Entrada_7(w15),		// En_MultiPlexor_ALU
.Entrada_8(w16),		// ALUC

	// ALU_IF
.Entrada_9(w7),
	// Banco_de_Registros
.Entrada_10(w20),		// Leer_direccion_1
.Entrada_11(w21),		// Leer_direccion_2
	// sign_extended
.Entrada_12(w22),
	// Intrucion
.Entrada_13(w8[20:16]),	// Direccion_2  Tipo I (Entrada 0 en multiplexor)
.Entrada_14(w8[15:11]),	// Direccion_a_Escribir Tipo R (Entrada 1 en multiplexor)


	//Shift_Left_2_Jump
.Entrada_15(w64),	
	// Jump
.Entrada_16(w68),
// Salidas------------------------------------------------------------------------
	// UC
		// Etapas... asta WB
.Salida_1(w23),		// EnWR_BR
.Salida_2(w24),		// En_MultiPlexor_br
		// Etapas... asta MeM
.Salida_3(w25),		// EnWR_R_MemDatos
.Salida_4(w26),		// EnWR_w_MemDatos
.Salida_5(w27),		// Branch
		// Etapas asta EX
.Salida_6(w28),		// En_MultiPlexor_w
.Salida_7(w29),		// En_MultiPlexor_ALU
.Salida_8(w30),		// ALUC

	// ALU_IF
.Salida_9(w31),
	// Banco_de_Registros
.Salida_10(w32),		// Leer_direccion_1
.Salida_11(w33),		// Leer_direccion_2
	// sign_extended
.Salida_12(w34),
	// Intrucion
.Salida_13(w35),		// Direccion_2  Tipo I (Entrada 0 en multiplexor)
.Salida_14(w36),		// Direccion_a_Escribir Tipo R (Entrada 1 en multiplexor)

	//Shift_Left_2_Jump
.Salida_15(w65),
	//	Jump
.Salida_16(w69)
);

Mux1 Multiplexor_BR(
//Entradas
.Entrada_0(w35),.Entrada_1(w36),.En_MultiPlexor(w28),
//Salidas
.Salida(w37)
);

Mux1 Multiplexor_ALU(
//Entradas
.Entrada_0(w33),.Entrada_1(w34),.En_MultiPlexor(w29),
//Salidas
.Salida(w38)
);

ALU_Control ALU_Control(
// Entradas
.ALUC_aluc(w30),.funct_aluc(w34),
// Salida
.Selector_aluc(w39)
);

ALU ALU(
// Entradas
.sel(w39),.OP1(w32),.OP2(w38),
// Salidas
.zf(w40),.Res(w41)
);

Shift_Left_2 Shift_Left_2(
// Entrada
.Entrada_ShiftLesft(w34),
// Salida
.Salida_ShiftLesft(w42)
);

ALU ALU_Shift_Left_2(
// Entradas
.OP1(w31),.OP2(w42),.sel(4'b0000),
// Salidas
.Res(w43)

);

Buffer Buffer_EXaMeM(
// Entradas
.clk(clk),
	// UC
		// Etapas... asta WB
.Entrada_1(w23),	// EnWR_BR
.Entrada_2(w24),	// En_MultiPlexor_br
		// Etapas... asta MeM
.Entrada_3(w25),	// EnWR_R_MemDatos
.Entrada_4(w26),	// EnWR_w_MemDatos
.Entrada_5(w27),	// Branch

	// ALU_Shift_Left_2
.Entrada_6(w43), // Res

	// ALU
.Entrada_7(w41),	// Res
.Entrada_8(w40),	// zf

	// BR
.Entrada_9(w33),	// Leer_direccion_2

	// Multiplexor_BR
.Entrada_10(w37),	// Salida

//-----------Extra------------
	//ALU_IF 
.Entrada_11(w31),// Resultado

	//Shift_Left_2_Jump
.Entrada_12(w65),
	
	//Jump
.Entrada_13(w69),

//----------------------------

// Salidas-----------------------------------------------------------------------
	// UC
		// Etapas... asta WB
.Salida_1(w44),	// EnWR_BR
.Salida_2(w45),	// En_MultiPlexor_br
		// Etapas... asta MeM
.Salida_3(w46),	// EnWR_R_MemDatos
.Salida_4(w47),	// EnWR_w_MemDatos
.Salida_5(w48),	// Branch

	// ALU_Shift_Left_2
.Salida_6(w4),	// Res

	// ALU
.Salida_7(w50),	// Res
.Salida_8(w51),	// zf

	// BR
.Salida_9(w52),	// Leer_direccion_2

	// Multiplexor_BR
.Salida_10(w53),	// Salida

//-----------Extra------------
	//ALU_IF
.Salida_11(w61),// Resultado

	//Shift_Left_2_Jump
.Salida_12(w66),
	// Jump
.Salida_13(w70)


);

Mux1 Multiplexor_PC(
//Entradas
.Entrada_0(w61),.Entrada_1(w4),.En_MultiPlexor(w5),
//Salidas
.Salida(w62)
);


Branch_AND AND(
// Entradas
.Entrada1(w48),.Entrada2(w51),
// Salida
.Salida(w5)	
);

Mem_Datos Memoria_Datos(
// Entradas
.Direccion(w50),.Dato_entrada(w52),
.Entrada_Escribir(w47),.Entrada_Leer(w46),
// Salida
.Dato_salida(w54)

);

Buffer Buffer_MeMaWB(
// Entradas
.clk(clk),
	// UC
		// Etapas... asta WB
.Entrada_1(w44),	// EnWR_BR
.Entrada_2(w45),	// En_MultiPlexor_br

	// Memoria_Datos
.Entrada_3(w54),	// Salida

	// ALU
.Entrada_4(w50),	// Res

	// Multiplexor_BR
.Entrada_5(w53),	// Salida


	// Multiplexor_PC (Extra)----
.Entrada_6(w62),	//Salida


	//Shift_Left_2_Jump
.Entrada_7(w66),
	//Jump
.Entrada_8(w70),

// Salidas-----------------------------------------------------------------------
	// UC
		// Etapas... asta WB
.Salida_1(w55),	// EnWR_BR
.Salida_2(w56),	// En_MultiPlexor_br

	// Memoria_Datos
.Salida_3(w57),	// Salida

	// ALU
.Salida_4(w58),	// Res

	// Multiplexor_BR
.Salida_5(w59),	// Salida
	
	// Multiplexor_PC (Extra)----
.Salida_6(w63),//Salida

	//Shift_Left_2_Jump
.Salida_7(w67),
	//Jump
.Salida_8(w71)

);

Mux1 Multiplexor_Jump(
//Entradas
.Entrada_0(w63),.Entrada_1(w67),.En_MultiPlexor(w71),
//Salidas
.Salida(w1)
);


Mux1 Multiplexor_w_BR(
//Entradas
.Entrada_0(w57),.Entrada_1(w58),.En_MultiPlexor(w56),
//Salidas
.Salida(w60)
);

endmodule 