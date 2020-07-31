
// Function SimpleFunction.test --line: 7
(SimpleFunction.test)

// push constant 0 --line: 8
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop local 0 --line: 9
@LCL
D=M
@0
D=D+A
@addr_9
M=D
@SP
M=M-1
A=M
D=M
@addr_9
A=M
M=D

// push constant 0 --line: 10
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

// pop local 1 --line: 11
@LCL
D=M
@1
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
// push local 0 --line: 8
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
// push local 1 --line: 9
@LCL
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
// add line:10
@SP
AM=M-1
D=M
A=A-1
M=D+M
// not line:11
@SP
A=M-1
M=!M
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
// add line:13
@SP
AM=M-1
D=M
A=A-1
M=D+M
// push argument 1 --line: 14
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
// sub line:15
@SP
AM=M-1
D=M
A=A-1
M=M-D
// return --line: 16
@LCL
D=M
@endFrame
M=D
@endFrame
D=M
@5
D=D-A
A=D
D=M
@retAddr
M=D
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
@ARG
D=M
D=D+1
@SP
M=D
@endFrame
D=M
D=D-1
A=D
D=M
@THAT
M=D
@endFrame
D=M
@2
D=D-A
A=D
D=M
@THIS
M=D
@endFrame
D=M
@3
D=D-A
A=D
D=M
@ARG
M=D
@endFrame
D=M
@4
D=D-A
A=D
D=M
@LCL
M=D
@retAddr
A=M
0;JMP