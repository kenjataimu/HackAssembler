module HackRB
  module VMTranslator
    class Line
      def initialize(body, number)
        @body = body
        @number = number
      end

      def self.parse(vm_line)
        case vm_line
        when /(add|sub|eq|gt|lt|and|or|)/ then BinaryOperation.new(vm_line)
        when /(neg|not|)/ then UnaryOperation.new(vm_line)
        when /push .+/ then PushOperation.new(vm_line)
        when /pop .+/ then PopOperation.new(vm_line)
        end
      end
    end
  end
end

require "hack_rb/vm_translator/line/binary_operation"
require "hack_rb/vm_translator/line/unary_operation"
require "hack_rb/vm_translator/line/push_operation"
require "hack_rb/vm_translator/line/pop_operation"
