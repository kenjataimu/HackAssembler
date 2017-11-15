module HackRB
  module VMTranslator
    module Segment
      def self.get(segment_name)
        const_get(segment_name.capitalize)
      end

      class Base
        def self.at(offset, &block)
          @offset = offset

          if block_given?
            push(block)
          else
            self
          end
        end

        def self.pop
          seek +
          copy
        end

        private

        def self.push(block)
          calculate("D") +
          Register.value.set +
          block.call +
          Register.address.set
        end

        def self.seek
          calculate("A")
        end

        def self.copy
          <<~POP
            D=M
          POP
        end

        def self.calculate(destination)
          <<~CALCULATE
            @#{pointer}
            D=M
            @#{@offset}
            #{destination}=D+A
          CALCULATE
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
        def self.seek
          Label.at("#{label}.#{@offset}")
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
        def self.seek
          Label.at(@offset == 0 ? "THIS" : "THAT")
        end
      end

      class Temp < Base
        def self.seek
          Label.at(@offset.to_i + 5)
        end
      end

      class Constant < Base
        def self.seek
          Label.at(@offset)
        end

        def self.copy
          <<~COPY
            D=A
          COPY
        end
      end

      class Register
        @address = 13
        @indirect = true

        def self.set
          peek +
          <<~SET
            M=D
          SET
        end

        def self.value
          @indirect = false
          self
        end

        def self.address
          @indirect = true
          self
        end

        private

        def self.peek
          <<~PEEK + go_to.to_s
            @R#{@address}
          PEEK
        end

        def self.go_to
          if @indirect
            <<~GO_TO
              A=M
            GO_TO
          end
        end
      end
    end
  end
end
