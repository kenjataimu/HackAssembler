//function SimpleFunction.test 2
(SimpleFunction.test)

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

//add
@SP
M=M-1
A=M
D=M
A=A-1
M=D+M

//not
@SP
A=M-1
M=!M

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
//add

//push argument 1
@ARG
D=M
@1
A=D+A
D=M
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
