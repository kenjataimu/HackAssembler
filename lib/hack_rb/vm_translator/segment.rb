module HackRB
  module VMTranslator
    module Segment
      def self.get(segment_name)
        const_get(segment_name.capitalize)
      end

      class Base
        def self.pop_d(offset)
          seek(offset) +
          save_d
        end

        def self.push_d
          Register.address +
          store_d
        end

        def self.store(offset)
          calculate(offset, destination: "D") +
          Register.save_d
        end

        private

        def self.seek(offset)
          calculate(offset, destination: "A")
        end

        def self.calculate(offset, destination:)
          <<~CALCULATE
            @#{pointer}
            D=M
            @#{offset}
            #{destination}=D+A
          CALCULATE
        end

        def self.save_d
          <<~SAVE
            D=M
          SAVE
        end
      end

      class Argument < Base
        def self.pointer
          "ARG"
        end
      end

      class Local < Base
        def self.pointer
          "LCL"
        end
      end

      class Static < Base
        def self.seek(offset)
          Label.at("#{label}.#{offset}")
        end

        def self.label
          VirtualMachine.current_class
        end
      end

      class This < Base
        def self.pointer
          "THIS"
        end
      end

      class That < Base
        def self.pointer
          "THAT"
        end
      end

      class Pointer < Base
        def self.seek(offset)
          Label.at(offset == 0 ? "THIS" : "THAT")
        end
      end

      class Temp < Base
        def self.seek(offset)
          Label.at(offset.to_i + 5)
        end
      end

      class Constant < Base
        def self.seek(offset)
          Label.at(offset)
        end

        def self.save_d
          <<~SAVE_D
            D=A
          SAVE_D
        end
      end

      class Register
        @current_register = 13

        def self.save_d
          peek +
          <<~SAVE_D.tap { @current_register += 1 }
            M=D
          SAVE_D
        end

        def self.address
          peek +
          <<~ADDRESS.tap { @current_register -= 1 }
            A=M
          ADDRESS
        end

        private

        def self.peek
          <<~PEEK
            @R#{@current_register}
          PEEK
        end
      end
    end
  end
end
