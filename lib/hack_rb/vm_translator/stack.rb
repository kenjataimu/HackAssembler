module HackRB
  module VMTranslator
    module Stack
      class << self
        def push_d
          <<~PUSH_D
            @SP
            M=M+1
            A=M-1
            M=D
          PUSH_D
        end

        def pop_d
          <<~POP_D
            @SP
            AM=M-1
            D=M
          POP_D
        end

        def add
          pop_d +
          move_up +
          <<~ADD
            M=D+M
          ADD
        end

        def sub
          pop_d +
          move_up +
          <<~SUB
            M=M-D
          SUB
        end

        def neg
          move_top +
          <<~NEG
            M=-M
          NEG
        end

        def eq
          move_top +
          <<~NEG
            M=-M
          NEG
        end

        private

        def move_up
          <<~MOVE_UP
            A=A-1
          MOVE_UP
        end

        def move_top
          <<~TOP
            @SP
            A=M-1
          TOP
        end

        def sub_d
        end
      end
    end
  end
end
