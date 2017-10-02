require "hack_rb/vm_translator/line"

module HackRB
  module VMTranslator
    class PopOperation < Line
      SEGMENTS = {
        "local" => "LCL",
        "argument" => "ARG"
      }

      def initialize(body, number)
        super
        @segment, @offset = self.class.regexp.match(body).captures
        @segment = SEGMENTS[@segment]
      end

      def self.regexp
        /pop (?<segment>\w+) (?<offset>\d+)/
      end

      def to_asm
        %W[
          @#{@segment}
          D=M
          @#{@offset}
          D=D+A
          @R13
          M=D
          @SP
          M=M-1
          A=M
          D=M
          @R13
          A=M
          M=D
        ]
      end
    end
  end
end
