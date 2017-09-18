require "hack_rb/assembler/line/instruction"
require "hack_rb/assembler/mnemonics"

module HackRB
  module Assembler
    class CInstruction < Instruction
      def initialize(body)
        super
        split_body!
      end

      def self.regexp
        @regexp ||= %r{
          ((?<dest>#{Mnemonics.dest_regexp})=)?
          (?<comp>#{Mnemonics.comp_regexp})
          (;(?<jump>#{Mnemonics.jump_regexp}))?
        }x
      end

      def to_binary
        "111#{a_bit}#{binary_instruction}"
      end

      private

      def a_bit
        @computation.include?("M") ? 1 : 0
      end

      def binary_instruction
        @binary_instruction ||= Mnemonics.binary(@computation, @destination, @jump).join
      end

      def split_body!
        matches = self.class.regexp.match(body)
        @destination, @computation, @jump = [matches["dest"], matches["comp"], matches["jump"]]
      end
    end
  end
end
