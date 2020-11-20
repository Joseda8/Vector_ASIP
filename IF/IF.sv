module IF(clk, rst, instr);

input logic clk, rst;
output logic [31:0] instr;


//FETCH
logic[31:0] pc_next = 0;
logic[31:0] pc_new;

pc_reg pcreg(clk, rst, pc_next, pc_new);
plus_1 pc_plus(pc_new, pc_next);
imem memi(pc_new, instr);

endmodule 
