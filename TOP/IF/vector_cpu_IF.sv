module vector_cpu_IF(clk, rst, instr_out);

input logic clk, rst;
output logic [31:0] instr_out;

logic [31:0] instr;

IF fetch(clk, rst, instr);

pipeFetchDecode pipeIFID(clk, rst, instr, instr_out);


endmodule 
