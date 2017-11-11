module HackRB
  module VMTranslator
    class Label
      def self.declare(name)
      end

      def self.at(name)
        <<~SEEK
          @#{name}
        SEEK
      end

      def self.got_to(name)
      end

      def self.if_goto(name)
      end

      def initialize(name, count)
        @name = name
        @count = count
      end

      def method_missing(m, *args, &block)
        if m == :ret
          wrap("$ret.")
        else
          wrap(".#{m.to_s.capitalize}.")
        end
      end

      private

      def wrap(string)
        "#{@name}#{string}#{@count}"
      end
    end
  end
end
