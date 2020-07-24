
// push constant 10 --line: 7
@10
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop local 0 --line: 8
@LCL
D=M
@0
D=D+A
@addr_8
M=D
@SP
M=M-1
A=M
D=M
@addr_8
A=M
M=D
// push constant 21 --line: 9
@21
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 22 --line: 10
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop argument 2 --line: 11
@ARG
D=M
@2
D=D+A
@addr_11
M=D
@SP
M=M-1
A=M
D=M
@addr_11
A=M
M=D
// pop argument 1 --line: 12
@ARG
D=M
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
// push constant 36 --line: 13
@36
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop this 6 --line: 14
@THIS
D=M
@6
D=D+A
@addr_14
M=D
@SP
M=M-1
A=M
D=M
@addr_14
A=M
M=D
// push constant 42 --line: 15
@42
D=A
@SP
A=M
M=D
@SP
M=M+1
// push constant 45 --line: 16
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop that 5 --line: 17
@THAT
D=M
@5
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
// pop that 2 --line: 18
@THAT
D=M
@2
D=D+A
@addr_18
M=D
@SP
M=M-1
A=M
D=M
@addr_18
A=M
M=D
// push constant 510 --line: 19
@510
D=A
@SP
A=M
M=D
@SP
M=M+1
// pop temp 6 --line: 20
@5
D=A
@6
D=D+A
@addr_20
M=D
@SP
M=M-1
A=M
D=M
@addr_20
A=M
M=D
// push local 0 --line: 21
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
// push that 5 --line: 22
@THAT
D=M
@5
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// add line:23
@SP
AM=M-1
D=M
A=A-1
M=D+M
// push argument 1 --line: 24
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
// sub line:25
@SP
AM=M-1
D=M
A=A-1
M=M-D
// push this 6 --line: 26
@THIS
D=M
@6
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// push this 6 --line: 27
@THIS
D=M
@6
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// add line:28
@SP
AM=M-1
D=M
A=A-1
M=D+M
// sub line:29
@SP
AM=M-1
D=M
A=A-1
M=M-D
// push temp 6 --line: 30
@5
D=A
@6
D=D+A
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1
// add line:31
@SP
AM=M-1
D=M
A=A-1
M=D+M