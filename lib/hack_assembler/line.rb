module HackAssembler
  class Line
    class UnknownInstructionError < StandardError; end

    attr_reader :body

    class << self
      def type(asm_line)
        case asm_line
        when /^\s*$/ then Blank
        when /^\/\/.*$/ then Comment
        when /^\(\S+\)$/ then Label
        when /^@\S+$/ then AInstruction
        when /^.+;.+$/ then CInstruction
        else
          raise UnknowInstructionError
        end
      end

      def parse(asm_line)
        line = asm_line.strip
        type(line).new(line)
      end
    end

    def initialize(body)
      @body = body
    end
  end
end

require "hack_assembler/line/blank"
require "hack_assembler/line/comment"
require "hack_assembler/line/label"
require "hack_assembler/line/a_instruction"
require "hack_assembler/line/c_instruction"
