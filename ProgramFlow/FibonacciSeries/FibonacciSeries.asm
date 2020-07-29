
// push argument 1 --line: 11
@ARG
D=M
@1
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// pop pointer 1 --line: 12
@3
D=A
@1
D=D+A
@addr_12
M=D
@SP
M=M-1
A=M
D=M
@addr_12
A=M
M=D
// push constant 0 --line: 14
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop that 0 --line: 15
@THAT
D=M
@0
D=D+A
@addr_15
M=D
@SP
M=M-1
A=M
D=M
@addr_15
A=M
M=D
// push constant 1 --line: 16
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop that 1 --line: 17
@THAT
D=M
@1
D=D+A
@addr_17
M=D
@SP
M=M-1
A=M
D=M
@addr_17
A=M
M=D
// push argument 0 --line: 19
@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 2 --line: 20
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub line:21
@SP
AM=M-1
D=M
A=A-1
M=M-D
// pop argument 0 --line: 22
@ARG
D=M
@0
D=D+A
@addr_22
M=D
@SP
M=M-1
A=M
D=M
@addr_22
A=M
M=D
// label MAIN_LOOP_START --line: 24
(MAIN_LOOP_START)
// push argument 0 --line: 26
@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// if_goto COMPUTE_ELEMENT --line: 27
@SP
AM=M-1
D=M
@COMPUTE_ELEMENT
D;JGT
// goto END_PROGRAM --line: 28
@END_PROGRAM
0;JMP
// label COMPUTE_ELEMENT --line: 30
(COMPUTE_ELEMENT)
// push that 0 --line: 32
@THAT
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push that 1 --line: 33
@THAT
D=M
@1
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// add line:34
@SP
AM=M-1
D=M
A=A-1
M=D+M
// pop that 2 --line: 35
@THAT
D=M
@2
D=D+A
@addr_35
M=D
@SP
M=M-1
A=M
D=M
@addr_35
A=M
M=D
// push pointer 1 --line: 37
@3
D=A
@1
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1 --line: 38
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// add line:39
@SP
AM=M-1
D=M
A=A-1
M=D+M
// pop pointer 1 --line: 40
@3
D=A
@1
D=D+A
@addr_40
M=D
@SP
M=M-1
A=M
D=M
@addr_40
A=M
M=D
// push argument 0 --line: 42
@ARG
D=M
@0
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push constant 1 --line: 43
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub line:44
@SP
AM=M-1
D=M
A=A-1
M=M-D
// pop argument 0 --line: 45
@ARG
D=M
@0
D=D+A
@addr_45
M=D
@SP
M=M-1
A=M
D=M
@addr_45
A=M
M=D
// goto MAIN_LOOP_START --line: 47
@MAIN_LOOP_START
0;JMP
// label END_PROGRAM --line: 49
(END_PROGRAM)