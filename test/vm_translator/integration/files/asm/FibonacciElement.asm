@256
D=A
@SP
M=D

//call Sys.init 0   // computes the 4'th fibonacci element
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
  //goto Sys.init
  @Sys.init
  0;JMP  

//return address
(Sys$ret.1)

//function Sys.init 0
(Sys.init)

//push constant 4
@4
D=A
@SP
M=M+1
A=M-1
M=D

//call Main.fibonacci 1   // computes the 4'th fibonacci element
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
  //ARG = SP - 5 - 1
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
  //goto Main.fibonacci
  @Main.fibonacci
  0;JMP  

//return address
(Sys$ret.2)

//label WHILE
(WHILE)

//goto WHILE              // loops infinitely
@WHILE
0;JMP

//function Main.fibonacci 0
(Main.fibonacci)

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

//push constant 2
@2
D=A
@SP
M=M+1
A=M-1
M=D

//lt                     // checks if n<2
@SP
M=M-1
A=M
D=M
A=A-1
D=D-M
@Main.False.4
D;JLE
D=-1
@Main.End.4
0;JMP
(Main.False.4)
D=0
(Main.End.4)
@SP
A=M-1
M=D

//if-goto IF_TRUE
@SP
M=M-1
A=M
D=M
@IF_TRUE
D;JNE

//goto IF_FALSE
@IF_FALSE
0;JMP

//label IF_TRUE          // if n<2, return n
(IF_TRUE)

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

//label IF_FALSE         // if n>=2, returns fib(n-2)+fib(n-1)
(IF_FALSE)

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

//push constant 2
@2
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

//call Main.fibonacci 1  // computes fib(n-2)
  //push return address
  @Main$ret.1
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
  //ARG = SP - 5 - 1
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
  //goto Main.fibonacci
  @Main.fibonacci
  0;JMP  

//return address
(Main$ret.1)

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

//push constant 1
@1
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

//call Main.fibonacci 1  // computes fib(n-1)
  //push return address
  @Main$ret.2
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
  //ARG = SP - 5 - 1
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
  //goto Main.fibonacci
  @Main.fibonacci
  0;JMP  

//return address
(Main$ret.2)

//add                    // returns fib(n-1) + fib(n-2)
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
