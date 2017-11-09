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
      end

      class Argument < Base
        def self.seek(offset)
          <<~SEEK
            @ARG
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
