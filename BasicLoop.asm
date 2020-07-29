
// push constant 0 --line: 9
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0 --line: 10
@LCL
D=M
@0
D=D+A
@addr_10
M=D
@SP
M=M-1
A=M
D=M
@addr_10
A=M
M=D
// label LOOP_START --line: 11
(LOOP_START)
// push argument 0 --line: 12
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
// push local 0 --line: 13
@LCL
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
// add line:14
@SP
AM=M-1
D=M
A=A-1
M=D+M
// pop local 0 --line: 15
@LCL
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
// push argument 0 --line: 16
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
// push constant 1 --line: 17
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub line:18
@SP
AM=M-1
D=M
A=A-1
M=M-D
// pop argument 0 --line: 19
@ARG
D=M
@0
D=D+A
@addr_19
M=D
@SP
M=M-1
A=M
D=M
@addr_19
A=M
M=D
// push argument 0 --line: 20
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
// if_goto LOOP_START --line: 21
@SP
AM=M-1
D=M
@LOOP_START
D;JGT
// push local 0 --line: 22
@LCL
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