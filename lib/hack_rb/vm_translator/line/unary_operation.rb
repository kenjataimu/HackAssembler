require "hack_rb/vm_translator/line"

module HackRB
  module VMTranslator
    class UnaryOperation < Line
      def to_asm
        case @body
        when "neg"
          %w[
            @SP
            A=M-1
            M=-M 
          ]
        when "not"
          %w[
            @SP
            A=M-1
            M=!M
          ]
        end
      end
    end
  end
end