
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq 
AM=M-1
D=M
A=A-1
D=M-D
@EQ_10
D;JEQ
@SP
A=M-1
M=0
@END_10
0;JMP
(EQ_10)
@SP
A=M-1
M=-1
(END_10)
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq 
AM=M-1
D=M
A=A-1
D=M-D
@EQ_13
D;JEQ
@SP
A=M-1
M=0
@END_13
0;JMP
(EQ_13)
@SP
A=M-1
M=-1
(END_13)
// push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// eq 
AM=M-1
D=M
A=A-1
D=M-D
@EQ_16
D;JEQ
@SP
A=M-1
M=0
@END_16
0;JMP
(EQ_16)
@SP
A=M-1
M=-1
(END_16)
// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt 
AM=M-1
D=M
A=A-1
D=M-D
@LT_19
D;JLT
@SP
A=M-1
M=0
@END_19
0;JMP
(LT_19)
@SP
A=M-1
M=-1
(END_19)
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt 
AM=M-1
D=M
A=A-1
D=M-D
@LT_22
D;JLT
@SP
A=M-1
M=0
@END_22
0;JMP
(LT_22)
@SP
A=M-1
M=-1
(END_22)
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// lt 
AM=M-1
D=M
A=A-1
D=M-D
@LT_25
D;JLT
@SP
A=M-1
M=0
@END_25
0;JMP
(LT_25)
@SP
A=M-1
M=-1
(END_25)
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt 
AM=M-1
D=M
A=A-1
D=M-D
@GT_28
D;JGT
@SP
A=M-1
M=0
@END_28
0;JMP
(GT_28)
@SP
A=M-1
M=-1
(END_28)
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt 
AM=M-1
D=M
A=A-1
D=M-D
@GT_31
D;JGT
@SP
A=M-1
M=0
@END_31
0;JMP
(GT_31)
@SP
A=M-1
M=-1
(END_31)
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// gt 
AM=M-1
D=M
A=A-1
D=M-D
@GT_34
D;JGT
@SP
A=M-1
M=0
@END_34
0;JMP
(GT_34)
@SP
A=M-1
M=-1
(END_34)
// push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 53
@53
D=A
@SP
A=M
M=D
@SP
M=M+1
// add line:38
@SP
AM=M-1
D=M
A=A-1
M=D+M
// push constant 112
@112
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub line:40
@SP
AM=M-1
D=M
A=A-1
M=M-D
// neg line:41
@SP
A=M-1
M=-M
// and line:42
@SP
AM=M-1
D=M
A=A-1
M=D&M
// push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// or line:44
@SP
AM=M-1
D=M
A=A-1
M=D|M
// not line:45
@SP
A=M-1
M=!M