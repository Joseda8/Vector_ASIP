module imem(input logic [31:0] a,
				output logic [31:0] rd);

logic [31:0] RAM[1023:0];

initial
$readmemb("C://Users//jdmon//OneDrive//Escritorio//TEC//Proyecto2_arqui//Vector_ASIP//meminstr.txt", RAM);

assign rd = RAM[a[31:0]];

endmodule 
