require "hack_rb/vm_translator/line"

module HackRB
  module VMTranslator
    class BinaryOperation < Line
      def to_asm
        case @body
        when "add"
          %w[
            @SP
            M=M-1
            A=M
            D=M
            A=A-1
            M=D+M
          ]
        when "sub"
          %w[
            @SP
            M=M-1
            A=M
            D=M
            A=A-1
            M=D-M
          ]
        when "eq"
          %W[
            @SP
            M=M-1
            A=M
            D=M
            A=A-1
            D=D-M

            @FALSE_#{@number}
            D;JNZ

            D=-1
            @END_#{@number}
            0;JMP

            FALSE_#{@number}:
            D=0

            END_#{@number}:
            @SP
            A=M-1
            M=D
          ]
        end
        when "gt"
          %W[
            @SP
            M=M-1
            A=M
            D=M
            A=A-1
            D=D-M

            @FALSE_#{@number}
            0;JGT

            D=-1
            @END_#{@number}
            0;JMP

            FALSE_#{@number}:
            D=0

            END_#{@number}:
            @SP
            A=M-1
            M=D
          ]
        end
        when "lt"
          %W[
            @SP
            M=M-1
            A=M
            D=M
            A=A-1
            D=D-M

            @FALSE_#{@number}
            0;JLT

            D=-1
            @END_#{@number}
            0;JMP

            FALSE_#{@number}:
            D=0

            END_#{@number}:
            @SP
            A=M-1
            M=D
          ]
        end
      end
    end
  end
end
