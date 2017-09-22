module HackRB
  module Assembler
    class Line
      def self.parse(vm_line)
        case vm_line
        when /(add|sub|eq|gt|lt|and|or|)/ then BinaryOperation.new(vm_line)
        end
      end
    end
  end
end

require "hack_rb/vm_translator/line/push_operation"
require "hack_rb/vm_translator/line/pop_operation"
require "hack_rb/vm_translator/line/unary_operation"
require "hack_rb/vm_translator/line/binary_operation"
