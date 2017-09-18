module HackRB
  module Assembler
    class Line
      class InvalidLineError < StandardError; end

      attr_reader :body

      @@types = []

      class << self
        def inherited(subclass)
          add_type(self, subclass)
        end

        def add_type(superclass, subclass)
          @@types.delete(superclass)
          @@types << subclass
        end

        def =~(asm_line)
          /\A\s*(?<command>#{regexp})\s*(?:#{Comment.regexp})?\z/ =~ asm_line
          $1
        end

        def try_parse(asm_line)
          if match = self =~ asm_line
            new(match)
          end
        end

        def parse(asm_line)
          @@types.lazy.map{ |type|
            type.try_parse(asm_line)
          }.find{ |a| !a.nil? } or raise InvalidLineError
        end
      end

      def initialize(body)
        @body = body
      end
    end
  end
end

require "hack_rb/assembler/line/c_instruction"
require "hack_rb/assembler/line/a_instruction"
require "hack_rb/assembler/line/label"
require "hack_rb/assembler/line/comment"
require "hack_rb/assembler/line/blank"
