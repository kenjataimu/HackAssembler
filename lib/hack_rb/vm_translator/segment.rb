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

        def self.seek(offset)
          <<~SEEK
            @#{pointer}
            D=M
            @#{offset}
            A=D+A
          SEEK
        end

        def self.save_d
          <<~SAVE_D
            D=M
          SAVE_D
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
          pointer = offset == 0 ? "THIS" : "THAT"

          <<~SEEK
            @#{pointer}
          SEEK
        end
      end

      class Temp < Base
        def self.seek(offset)
          <<~SEEK
            @#{offset.to_i + 5}
          SEEK
        end
      end

      class Constant < Base
        def self.seek(offset)
          <<~SEEK
            @#{offset}
          SEEK
        end

        def self.save_d
          <<~SAVE_D
            D=A
          SAVE_D
        end
      end
    end
  end
end
