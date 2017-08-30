module HackAssembler
  class Line
    class InvalidLineError < StandardError; end

    attr_reader :body

    @@types = []

    class << self
      def =~(asm_line)
        /^#{regexp}(#{Comment.regexp})?$/ =~ asm_line
      end

      def inherited(subclass)
        add_type(self, subclass)
      end

      def add_type(superclass, subclass)
        @@types.delete(superclass)
        @@types << subclass
      end

      def parse(asm_line)
        type(asm_line).new(asm_line.strip)
      end

      def type(asm_line)
        @@types.find{ |type| type =~ asm_line } or raise InvalidLineError
      end
    end

    def initialize(body)
      @body = body
    end
  end
end

require "hack_assembler/line/c_instruction"
require "hack_assembler/line/a_instruction"
require "hack_assembler/line/label"
require "hack_assembler/line/comment"
require "hack_assembler/line/blank"
