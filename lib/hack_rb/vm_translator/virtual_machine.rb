module HackRB
  module VMTranslator
    module VirtualMachine
      class Label
        def initialize(name, count)
          @name = name
          @count = count
        end

        def wrap(string)
          "#{@name}#{string}#{@count}"
        end
      end

      def self.class_name=(class_name)
        @class_name = class_name
        @label_count = 0
      end

      def self.uniq_label
        yield Label.new(@class_name, @label_count)
        @label_count = @label_count + 1
      end
    end
  end
end
