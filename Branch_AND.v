module Branch_AND(
// Entradas
input Entrada1,Entrada2,
// salida
output reg Salida
);

always @(*)
 Salida= Entrada1 & Entrada2;

endmodule 