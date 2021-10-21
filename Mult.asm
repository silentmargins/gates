@R1
D=M
@inc
M=D

(LOOP)
@R1
D=M
@END
D;JEQ

@R1
M=M-1
@inc
D=M
@R0
M=D+M
@LOOP
0;JMP

@END
0;JMP
