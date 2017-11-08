module HackRB
  module VMTranslator
    module VirtualMachine
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

      def self.class_name=(class_name)
        @class_name = class_name
        @label_count = 0
      end

      def self.uniq_label
        @label_count = @label_count + 1
        yield Label.new(@class_name, @label_count)
      end
    end
  end
end
