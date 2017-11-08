//push constant 17
@17
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 17
@17
D=A
@SP
M=M+1
A=M-1
M=D

//eq
@SP
M=M-1
A=M
D=M
A=A-1
D=D-M
@StackTest.False.3
D;JNE
D=-1
@StackTest.End.3
0;JMP
(StackTest.False.3)
D=0
(StackTest.End.3)
@SP
A=M-1
M=D

//push constant 17
@17
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 16
@16
D=A
@SP
M=M+1
A=M-1
M=D

//eq
@SP
M=M-1
A=M
D=M
A=A-1
D=D-M
@StackTest.False.6
D;JNE
D=-1
@StackTest.End.6
0;JMP
(StackTest.False.6)
D=0
(StackTest.End.6)
@SP
A=M-1
M=D

//push constant 16
@16
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 17
@17
D=A
@SP
M=M+1
A=M-1
M=D

//eq
@SP
M=M-1
A=M
D=M
A=A-1
D=D-M
@StackTest.False.9
D;JNE
D=-1
@StackTest.End.9
0;JMP
(StackTest.False.9)
D=0
(StackTest.End.9)
@SP
A=M-1
M=D

//push constant 892
@892
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 891
@891
D=A
@SP
M=M+1
A=M-1
M=D

//lt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@StackTest.True.12
D;JLT
D=0
@StackTest.End.12
0;JMP
(StackTest.True.12)
D=-1
(StackTest.End.12)
@SP
A=M-1
M=D

//push constant 891
@891
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 892
@892
D=A
@SP
M=M+1
A=M-1
M=D

//lt
@SP
M=M-1
A=M
D=M
A=A-1
D=D-M
@StackTest.False.15
D;JLE
D=-1
@StackTest.End.15
0;JMP
(StackTest.False.15)
D=0
(StackTest.End.15)
@SP
A=M-1
M=D

//push constant 891
@891
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 891
@891
D=A
@SP
M=M+1
A=M-1
M=D

//lt
@SP
M=M-1
A=M
D=M
A=A-1
D=D-M
@StackTest.False.18
D;JLE
D=-1
@StackTest.End.18
0;JMP
(StackTest.False.18)
D=0
(StackTest.End.18)
@SP
A=M-1
M=D

//push constant 32767
@32767
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 32766
@32766
D=A
@SP
M=M+1
A=M-1
M=D

//gt
@SP
M=M-1
A=M
D=M
A=A-1
D=D-M
@StackTest.False.21
D;JGE
D=-1
@StackTest.End.21
0;JMP
(StackTest.False.21)
D=0
(StackTest.End.21)
@SP
A=M-1
M=D

//push constant 32766
@32766
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 32767
@32767
D=A
@SP
M=M+1
A=M-1
M=D

//gt
@SP
M=M-1
A=M
D=M
A=A-1
D=D-M
@StackTest.False.24
D;JGE
D=-1
@StackTest.End.24
0;JMP
(StackTest.False.24)
D=0
(StackTest.End.24)
@SP
A=M-1
M=D

//push constant 32766
@32766
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 32766
@32766
D=A
@SP
M=M+1
A=M-1
M=D

//gt
@SP
M=M-1
A=M
D=M
A=A-1
D=D-M
@StackTest.False.27
D;JGE
D=-1
@StackTest.End.27
0;JMP
(StackTest.False.27)
D=0
(StackTest.End.27)
@SP
A=M-1
M=D

//push constant 57
@57
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 31
@31
D=A
@SP
M=M+1
A=M-1
M=D

//push constant 53
@53
D=A
@SP
M=M+1
A=M-1
M=D

//add
@SP
M=M-1
A=M
D=M
A=A-1
M=D+M

//push constant 112
@112
D=A
@SP
M=M+1
A=M-1
M=D

//sub
@SP
M=M-1
A=M
D=M
A=A-1
M=M-D

//neg
@SP
A=M-1
M=-M

//and
@SP
M=M-1
A=M
D=M
A=A-1
M=D&M

//push constant 82
@82
D=A
@SP
M=M+1
A=M-1
M=D

//or
@SP
M=M-1
A=M
D=M
A=A-1
M=D|M

//not
@SP
A=M-1
M=!M
