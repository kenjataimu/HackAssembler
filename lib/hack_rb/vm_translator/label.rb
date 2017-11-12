module HackRB
  module VMTranslator
    class Label
      def self.declare(name)
        <<~DECLARE
          (#{name})
        DECLARE
      end

      def self.at(name)
        <<~AT
          @#{name}
        AT
      end

      def self.go_to(name)
      end

      def self.if_goto(name)
      end

      def initialize(name, count)
        @name = name
        @count = count
      end

      def at
        @wrapper = "@%{string}"
        self
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
        wrapper % {string: "#{@name}#{string}#{@count}"}
      end

      def wrapper
        (@wrapper || "(%{string})").tap do
          @wrapper = nil
        end
      end
    end
  end
end
