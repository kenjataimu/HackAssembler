//push constant 10
@10
D=A
@SP
M=M+1
A=M-1
M=D

//pop local 0
@LCL
D=M
@0
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

//push constant 21
@21
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 22
@22
D=A
@SP
M=M+1
A=M-1
M=D

//pop argument 2
@ARG
D=M
@2
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

//pop argument 1
@ARG
D=M
@1
D=D+A
@R13
M=D
@SP
M=M-1
A=M
D=M
@R13
A=M
M=D

//push constant 36
//pop this 6
//push constant 42
//push constant 45
//pop that 5
//pop that 2
//push constant 510
//pop temp 6
//push local 0
//push that 5
//add
//push argument 1
//sub
//push this 6
//push this 6
//add
//sub
//push temp 6
//add
