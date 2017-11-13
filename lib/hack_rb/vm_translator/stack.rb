module HackRB
  module VMTranslator
    module Stack
      class << self
        def push(segment, offset)
          segment.pop_d(offset) +
          push_d
        end

        def pop(segment, offset)
          segment.push_d(offset) do
            pop_d
          end
        end

        def add
          binary_operation { add_m }
        end

        def sub
          binary_operation { sub_m }
        end

        def neg
          unary_operation { neg_m }
        end

        def eq
          compare { jeq }
        end

        def gt
          compare { jgt }
        end
  
        def lt
          compare { jlt }
        end

        def and
          binary_operation { and_m }
        end

        def or
          binary_operation { or_m }
        end

        def not
          unary_operation { not_m }
        end

        private

        def binary_operation(&operation)
          pop_d +
          move_up +
          operation.call
        end

        def unary_operation(&operation)
          move_top +
          operation.call
        end

        def add_m
          <<~ADD_M
            M=D+M
          ADD_M
        end

        def sub_m
          <<~SUB_M
            M=M-D
          SUB_M
        end

        def sub_d
          <<~SUB_D
            D=M-D
          SUB_D
        end

        def neg_m
          <<~NEG_M
            M=-M
          NEG_M
        end

        def and_m
          <<~AND_M
            M=D&M
          AND_M
        end

        def or_m
          <<~OR_M
            M=D|M
          OR_M
        end

        def not_m
          <<~NOT_M
            M=!M
          NOT_M
        end

        def compare(&jmp)
          pop_d +
          move_up +
          sub_d +
          compare_d(jmp.call) +
          replace_d
        end

        def compare_d(condition)
          VirtualMachine.uniq_label do |label|
            <<~COMPARE
              #{label.at.true}
              D;#{condition}
              D=0
              #{label.at.end}
              0;JMP
              #{label.true}
              D=-1
              #{label.end}
            COMPARE
          end
        end

        def jeq
          "JEQ"
        end

        def jlt
          "JLT"
        end

        def jgt
          "JGT"
        end

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

        def replace_d
          move_top +
          <<~REPLACE_D
            M=D
          REPLACE_D
        end
      end
    end
  end
end
