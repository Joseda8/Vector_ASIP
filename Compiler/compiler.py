import util

zeros = "0000000000000000000000000000"
nop = "01010000000000000000000000000000"

isa = {"INCRI" : "0000", "INCRJ" : "0001", "SET" : "0010",
            "SUMFV": "0011", "MULFV": "0100", "NOP": "0101", "LDV": "0110", "CYCLE": "0111"}


util.replace_cycle("code_user.txt")

code = list(util.generator("code.txt"))
code_exe = open(".././meminstr.txt", "w")

for index, instr in enumerate(code):
    if(instr == "INCR"):
        next_instr = code[index+1]
        if(next_instr=="Ri"):
            code_exe.write(isa[instr+"I"]+zeros+"\n")
        elif(next_instr=="Rj"):
            code_exe.write(isa[instr+"J"]+zeros+"\n")
        else:
            print(f"El registro {next_instr} que intenta acceder no existe")
    elif(instr == "SET"):
        imm = util.get_imm(code[index+2])
        code_exe.write(isa[instr]+imm+"\n")
    elif(instr == "SUMFV" or instr == "MULFV"):
        if(instr == "MULFV"):
            code_exe.write(isa[instr]+code[index+1]+code[index+2]+zeros[:-2]+"\n")
        elif(instr == "SUMFV"):
            code_exe.write(isa[instr]+zeros+"\n")
        i = 0
        while(i<30):
            code_exe.write(nop+"\n")
            i+=1
    elif(instr == "LDV"):
        code_exe.write(isa[instr]+code[index+1]+zeros[:-1]+"\n")
        code_exe.write(isa[instr]+code[index+1]+zeros[:-1]+"\n")

code_exe.close()
