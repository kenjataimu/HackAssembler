module HackRB
  module VMTranslator
    class Label
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
