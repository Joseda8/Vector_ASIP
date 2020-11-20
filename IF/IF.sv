module IF(clk, rst, instr_out);

input logic clk, rst;
output logic [31:0] instr_out;


//FETCH
logic[31:0] pc_next = 0;
logic[31:0] pc_new, instr;

pc_reg pcreg(clk, rst, pc_next, pc_new);
plus_1 pc_plus(pc_new, pc_next);
imem memi(pc_new, instr);

pipeFetchDecode pipeIFID(clk, rst, instr, instr_out);

endmodule 
