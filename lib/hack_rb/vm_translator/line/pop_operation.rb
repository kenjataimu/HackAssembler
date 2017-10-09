require "hack_rb/vm_translator/line"

module HackRB
  module VMTranslator
    class PopOperation < Line
      SEGMENTS = {
        "local" => "LCL",
        "argument" => "ARG",
        "this" => "THIS",
        "that" => "THAT"
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
        case @segment
        when "static"
          %W[
            @SP
            M=M+1
            A=M-1
            D=M
            @#{filename}.#{@offset}
            M=D
          ]
        when "temp"
          %W[
            @SP
            M=M-1
            A=M
            D=M
            @#{5 + @offset.to_i}
            M=D
          ]
        else
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
end
