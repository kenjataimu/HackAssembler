require "hack_rb/vm_translator/line"

module HackRB
  module VMTranslator
    class BinaryOperation < Line
      def initialize(body)
        @body = body
      end

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
          %w[
            @SP
            M=M-1
            A=M
            D=M
            A=A-1
            M=D-M
          ]
        end
      end
    end
  end
end
