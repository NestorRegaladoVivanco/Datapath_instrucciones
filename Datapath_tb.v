`timescale 1ns/1ps
module Datapath_tb();
// Entrada
reg clk_tb;
// Salidas
	// Intruccion
wire [8:0]numero_intruccion_tb;
wire [31:0]intruccion_tb;
	// ALU
wire [31:0]Entrada_ALU1_tb,Entrada_ALU2_tb,resultado_tb;
wire zero_flag_tb;
	//Memoria de Datos
wire [31:0] Direccion_MemDato_tb,Escribir_MemDato_tb;

Datapath Datapath(
// Entrada
.clk(clk_tb),
// Salidas
	// Intruccion
.numero_intruccion(numero_intruccion_tb),
.intruccion(intruccion_tb),	
	// ALU
.Entrada_ALU1(Entrada_ALU1_tb),
.Entrada_ALU2(Entrada_ALU2_tb),
.resultado(resultado_tb),
.zero_flag(zero_flag_tb),
	// Memoria de datos
.Direccion_MemDato(Direccion_MemDato_tb),
.Escribir_MemDato(Escribir_MemDato_tb)
); 
// Reloj
initial clk_tb=0;
always #5 clk_tb=~clk_tb;

initial 	
	begin
	#700;// Se Agregan datos "INICIO"
	$stop;
	
	#250;//	Representación las de “Acciones” con cliente 1
	$stop;
	
	#250;//	Representación las de “Acciones” con cliente 2
	$stop;
	
	#250;//	Representación las de “Acciones” con cliente 3
	$stop;
	
	#250;//	Representación de compra chimichanga
	$stop;
	
	#900;//	Representación de Robo a Shrek
	$stop;
	
	end


endmodule 

