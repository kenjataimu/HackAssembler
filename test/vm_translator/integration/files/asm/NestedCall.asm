//function Sys.init 0
(Sys.init)

//push constant 4000	// test THIS and THAT context save
@4000
D=A
@SP
M=M+1
A=M-1
M=D

//pop pointer 0
@SP
M=M-1
A=M
D=M
@THIS
M=D

//push constant 5000
@5000
D=A
@SP
M=M+1
A=M-1
M=D

//pop pointer 1
@SP
M=M-1
A=M
D=M
@THAT
M=D

//call Sys.main 0
  //push return address
  @Sys$ret.1
  D=A
  @SP
  M=M+1
  A=M-1
  M=D
  //push LCL
  @LCL
  D=M
  @SP
  M=M+1
  A=M-1
  M=D
  //push ARG
  @ARG
  D=M
  @SP
  M=M+1
  A=M-1
  M=D
  //push THIS
  @THIS
  D=M
  @SP
  M=M+1
  A=M-1
  M=D
  //push THAT
  @THAT
  D=M
  @SP
  M=M+1
  A=M-1
  M=D
  //ARG = SP - 5 - 0
  @5
  D=A
  @0
  D=D+A
  @SP
  D=M-D
  @ARG
  M=D
  //LCL = SP
  @SP
  D=M
  @LCL
  M=D
  //goto Sys.main
  @Sys.main
  0;JMP  

//return address
(Sys$ret.1)

//pop temp 1
@SP
M=M-1
A=M
D=M
@6
M=D

//label LOOP
(LOOP)

//goto LOOP
@LOOP
0;JMP

//function Sys.main 5
(Sys.main)

//push 0
@SP
M=M+1
A=M-1
M=0

//push 0
@SP
M=M+1
A=M-1
M=0

//push 0
@SP
M=M+1
A=M-1
M=0

//push 0
@SP
M=M+1
A=M-1
M=0

//push 0
@SP
M=M+1
A=M-1
M=0

//push constant 4001
@4001
D=A
@SP
M=M+1
A=M-1
M=D

//pop pointer 0
@SP
M=M-1
A=M
D=M
@THIS
M=D

//push constant 5001
@5001
D=A
@SP
M=M+1
A=M-1
M=D

//pop pointer 1
@SP
M=M-1
A=M
D=M
@THAT
M=D

//push constant 200
@200
D=A
@SP
M=M+1
A=M-1
M=D

//pop local 1
@LCL
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

//push constant 40
@40
D=A
@SP
M=M+1
A=M-1
M=D

//pop local 2
@LCL
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

//push constant 6
@6
D=A
@SP
M=M+1
A=M-1
M=D

//pop local 3
@LCL
D=M
@3
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

//push constant 123
@123
D=A
@SP
M=M+1
A=M-1
M=D

//call Sys.add12 1
  //push return address
  @Sys$ret.2
  D=A
  @SP
  M=M+1
  A=M-1
  M=D
  //push LCL
  @LCL
  D=M
  @SP
  M=M+1
  A=M-1
  M=D
  //push ARG
  @ARG
  D=M
  @SP
  M=M+1
  A=M-1
  M=D
  //push THIS
  @THIS
  D=M
  @SP
  M=M+1
  A=M-1
  M=D
  //push THAT
  @THAT
  D=M
  @SP
  M=M+1
  A=M-1
  M=D
  //ARG = SP - 5 - 0
  @5
  D=A
  @1
  D=D+A
  @SP
  D=M-D
  @ARG
  M=D
  //LCL = SP
  @SP
  D=M
  @LCL
  M=D
  //goto Sys.add12
  @Sys.add12
  0;JMP

//return address
(Sys$ret.2)

//pop temp 0
@SP
M=M-1
A=M
D=M
@5
M=D

//push local 0
@LCL
D=M
@0
A=D+A
D=M
@SP
M=M+1
A=M-1
M=D

//push local 1
@LCL
D=M
@1
A=D+A
D=M
@SP
M=M+1
A=M-1
M=D

//push local 2
@LCL
D=M
@2
A=D+A
D=M
@SP
M=M+1
A=M-1
M=D

//push local 3
@LCL
D=M
@3
A=D+A
D=M
@SP
M=M+1
A=M-1
M=D

//push local 4
@LCL
D=M
@4
A=D+A
D=M
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

//add
@SP
M=M-1
A=M
D=M
A=A-1
M=D+M

//add
@SP
M=M-1
A=M
D=M
A=A-1
M=D+M

//add
@SP
M=M-1
A=M
D=M
A=A-1
M=D+M

//return
  //endFrame = LCL
  @LCL
  D=M
  @R13
  M=D
  //retAddr = *(endFrame - 5)
  @R13
  D=M
  @5
  D=D-A
  A=D
  D=M
  @R14
  M=D
  //*ARG = pop()
  @SP
  M=M-1
  A=M
  D=M
  @ARG
  A=M
  M=D
  //SP = ARG + 1
  @ARG
  D=M+1
  @SP
  M=D
  //THAT = *(endFrame - 1)
  @R13
  D=M
  @1
  D=D-A
  A=D
  D=M
  @THAT
  M=D
  //THIS = *(endFrame - 2)
  @R13
  D=M
  @2
  D=D-A
  A=D
  D=M
  @THIS
  M=D
  //ARG  = *(endFrame - 3)
  @R13
  D=M
  @3
  D=D-A
  A=D
  D=M
  @ARG
  M=D
  //LCL  = *(endFrame - 4)
  @R13
  D=M
  @4
  D=D-A
  A=D
  D=M
  @LCL
  M=D
  //goto retAddr
  @R14
  A=M
  0;JMP

//function Sys.add12 0
(Sys.add12)

//push constant 4002
@4002
D=A
@SP
M=M+1
A=M-1
M=D

//pop pointer 0
@SP
M=M-1
A=M
D=M
@THIS
M=D

//push constant 5002
@5002
D=A
@SP
M=M+1
A=M-1
M=D

//pop pointer 1
@SP
M=M-1
A=M
D=M
@THAT
M=D

//push argument 0
@ARG
D=M
@0
A=D+A
D=M
@SP
M=M+1
A=M-1
M=D

//push constant 12
@12
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

//return
  //endFrame = LCL
  @LCL
  D=M
  @R13
  M=D
  //retAddr = *(endFrame - 5)
  @R13
  D=M
  @5
  D=D-A
  A=D
  D=M
  @R14
  M=D
  //*ARG = pop()
  @SP
  M=M-1
  A=M
  D=M
  @ARG
  A=M
  M=D
  //SP = ARG + 1
  @ARG
  D=M+1
  @SP
  M=D
  //THAT = *(endFrame - 1)
  @R13
  D=M
  @1
  D=D-A
  A=D
  D=M
  @THAT
  M=D
  //THIS = *(endFrame - 2)
  @R13
  D=M
  @2
  D=D-A
  A=D
  D=M
  @THIS
  M=D
  //ARG  = *(endFrame - 3)
  @R13
  D=M
  @3
  D=D-A
  A=D
  D=M
  @ARG
  M=D
  //LCL  = *(endFrame - 4)
  @R13
  D=M
  @4
  D=D-A
  A=D
  D=M
  @LCL
  M=D
  //goto retAddr
  @R14
  A=M
  0;JMP
